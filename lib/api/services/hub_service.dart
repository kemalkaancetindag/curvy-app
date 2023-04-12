import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/online_hub_controller.dart';
import 'package:curvy_app/models/hub_storage.model.dart';
import 'package:curvy_app/models/online_hub.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HubService extends GetxService {
  FirestoreService firestoreService;
  StreamSubscription<DocumentSnapshot>? _listener;

  HubService({required this.firestoreService});

  Future<List<HubStorageModel>> getHubs() async {
    List<HubStorageModel> hubList = [];

    var hubs = (await firestoreService
            .getCollection("hub_storage")
            .orderBy("hub_type")
            .get())
        .docs;

    hubs.forEach((hub) {
      var hubStorageObject =
          HubStorageModel.fromJson((hub.data() as Map<String, dynamic>));
      hubList.add(hubStorageObject);
    });

    return hubList;
  }

  Future<List<String>> fillWithBots(String userID) async {
    UserModel currentUser = await firestoreService.getCurrentUser(userID);
    var unWantedBotIDS = currentUser.un_liked_users!;
    unWantedBotIDS.addAll(currentUser.users_i_liked!);

    var bots = (await firestoreService
            .getCollection('users')
            .where('bot', isEqualTo: 1)
            .where('sex', isEqualTo: currentUser.show_me)
            .get())
        .docs;

    List<String> selectedBotsForUser = [];

    for (var bot in bots) {
      var botModel = UserModel.fromJson((bot.data() as Map<String, dynamic>));
      int botAge =
          DateTime.now().year - int.parse(botModel.birthdate!.split("/").last);

      if (!unWantedBotIDS.contains(botModel) &&
          botAge >= currentUser.settings!.age_preference!.min_age! &&
          botAge <= currentUser.settings!.age_preference!.max_age! &&
          currentUser.last_seen_on_hub != botModel.userID) {
        selectedBotsForUser.add(botModel.userID!);
      }
    }

    return selectedBotsForUser;
  }

  Future<String?> joinHub(int hubType) async {
    String? foundHubID;
    String currentUserID = Get.find<SharedPreferenceService>().getUserID()!;

    var botIDS = await fillWithBots(currentUserID);

    UserModel currentUser =
        await firestoreService.getCurrentUser(currentUserID);

    var onlineHubs = (await firestoreService
            .getCollection("online_hubs")
            .where("hub_type", isEqualTo: hubType)
            .get())
        .docs;

    bool isFound = false;

    await Future.forEach(onlineHubs, (hub) async {
      var hubObject = OnlineHub.fromJson(hub.data() as Map<String, dynamic>);
      int distance = await _calculateDistance(hubObject.hub_location!.latitude!,
          hubObject.hub_location!.longitude!);

      if (distance < 50) {
        var newUsers = hubObject.users!;
        newUsers.add(currentUserID);

        hubObject.each_users_users!.keys.forEach((key) {
          (hubObject.each_users_users![key] as List<dynamic>)
              .add(currentUserID);
          if (!currentUser.un_liked_users!.contains(key) &&
              !currentUser.users_i_liked!.contains(key)) {
              botIDS.add(key);
          }
        });

        

        hubObject.users = newUsers;
        hubObject.each_users_users![currentUserID] = botIDS;

        var updateData = Map<String, dynamic>();

        updateData = hubObject.toJson();
        await firestoreService
            .getCollection("online_hubs")
            .doc(hub.id)
            .update(updateData);
        isFound = true;
        foundHubID = hub.id;

        Get.put(OnlineHubController(hubService: Get.find(), hubId: hub.id));
        Get.find<OnlineHubController>().stopTimer = false;
        Get.toNamed(Routes.hub);
        return;
      }
    });

    if (!isFound) {
      var newHubDocReference =
          firestoreService.getCollection('online_hubs').doc();
      Map<String, dynamic> distinctUsers = Map<String, dynamic>();

      distinctUsers[currentUserID] = botIDS;

      var newHub = OnlineHub(
          users: [currentUserID],
          hub_location: OnlineHubLocation(
            latitude: currentUser.location!.latitude,
            longitude: currentUser.location!.longitude,
          ),
          hub_type: hubType,
          hub_id: newHubDocReference.id,
          each_users_users: distinctUsers);

      var newHubJsonData = newHub.toJson();

      var newHubData = await newHubDocReference.set(newHubJsonData);

      Get.put(OnlineHubController(
          hubService: Get.find(), hubId: newHubDocReference.id));
      Get.toNamed(Routes.hub);
      foundHubID = newHubDocReference.id;
    }

    return foundHubID;
  }

  Future<void> leftHub(String hubId) async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var currentHubData =
        (await firestoreService.getCollection('online_hubs').doc(hubId).get())
            .data();
    var currentHub = null;

    if (currentHubData != null) {
      currentHub = (currentHubData as Map<String, dynamic>);
    }

    var onlineHubObject = OnlineHub.fromJson(currentHub);
    var newUsers = onlineHubObject.users!.where((id) => id != currentUserID);
    onlineHubObject.each_users_users!
        .removeWhere((key, value) => key == currentUserID);

    onlineHubObject.users = newUsers.toList();

    var updateData = onlineHubObject.toJson();

    await firestoreService
        .getCollection('online_hubs')
        .doc(hubId)
        .update(updateData);
  }

  Future listenHub(String hubId) async {
    var listener = firestoreService
        .getCollection('online_hubs')
        .doc(hubId)
        .snapshots()
        .listen((event) async {
      if (event.data() != null) {
        var onlineHubObject =
            OnlineHub.fromJson(event.data() as Map<String, dynamic>);
        var storedHubDoc = (await firestoreService
                .getCollection('hub_storage')
                .where('hub_type', isEqualTo: onlineHubObject.hub_type)
                .get())
            .docs[0];
        var storedHubData = HubStorageModel.fromJson(
            storedHubDoc.data() as Map<String, dynamic>);

        Get.find<OnlineHubController>()
            .updateHubData(onlineHubObject, storedHubData);
      }
    });

    _listener = listener;
  }

  Future stopListeningHub() async {
    await _listener!.cancel();
    _listener = null;
  }

  Future<int> _calculateDistance(dynamic lat2, dynamic lon2) async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);
    var lat1 = currentUser.location!.latitude!;
    var lon1 = currentUser.location!.longitude!;
    var dLat = (lat2 - lat1) * math.pi / 180.0;
    var dLon = (lon2 - lon1) * math.pi / 180.0;
    var latTimesPi1 = (lat1) * math.pi / 180.0;
    var latTimesPi2 = (lat2) * math.pi / 180.0;

    var a = (math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) *
            math.cos(latTimesPi1) *
            math.cos(latTimesPi2));
    var rad = 6371;
    var c = 2 * math.asin(math.sqrt(a));

    return (rad * c).toInt();
  }

  Future<void> nextHub(int hubType, String lastHubId) async {
    print(hubType);
    var hubID = await joinHub(hubType);
    print(hubID);
    Get.find<OnlineHubController>().setHubID(hubID!);
    await leftHub(lastHubId);
    if (hubID != null) {
      await listenHub(hubID);
    }
  }
}
