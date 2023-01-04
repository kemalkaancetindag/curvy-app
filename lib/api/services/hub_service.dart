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

  Future<String?> joinHub(int hubType) async {
    String currentUserID = Get.find<SharedPreferenceService>().getUserID();
    UserModel currentUser =
        await firestoreService.getCurrentUser(currentUserID);

    var onlineHubs = (await firestoreService
            .getCollection("online_hubs")
            .where("hub_type", isEqualTo: hubType)
            .get())
        .docs;
    var hubStorageObject = HubStorageModel.fromJson((await firestoreService
            .getCollection("hub_storage")
            .where("hub_type", isEqualTo: hubType)
            .get())
        .docs[0]
        .data() as Map<String, dynamic>);

    bool isFound = false;

    await Future.forEach(onlineHubs, (hub) async {
      var hubObject = OnlineHub.fromJson(hub.data() as Map<String, dynamic>);
      int distance = await _calculateDistance(hubObject.hub_location!.latitude!,
          hubObject.hub_location!.longitude!);

      if (distance < 50) {
        var newUsers = hubObject.users!;
        newUsers.add(currentUserID);
        var updateData = Map<String, dynamic>();
        updateData['users'] = newUsers;
        await firestoreService
            .getCollection("online_hubs")
            .doc(hub.id)
            .update(updateData);
        isFound = true;
        Get.put(OnlineHubController(hubService: Get.find(), hubId: hub.id));
        Get.find<OnlineHubController>().setInitialHubData(hubObject, hubStorageObject);
        Get.toNamed(Routes.hub);
        return hub.id;
      }
    });

    if (!isFound) {
      var newHubDocReference =
          firestoreService.getCollection('online_hubs').doc();

      var newHub = OnlineHub(
          users: [currentUserID],
          hub_location: OnlineHubLocation(
            latitude: currentUser.location!.latitude,
            longitude: currentUser.location!.longitude,
          ),
          hub_type: hubType,
          hub_id: newHubDocReference.id);

      var newHubJsonData = newHub.toJson();

      var newHubData = await newHubDocReference.set(newHubJsonData);

      Get.put(OnlineHubController(
          hubService: Get.find(), hubId: newHubDocReference.id));
      Get.find<OnlineHubController>().setInitialHubData(newHub, hubStorageObject);
      Get.toNamed(Routes.hub);
      return newHubDocReference.id;
    }

    return null;
  }

  Future<void> leftHub(String hubId) async {
    
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    
    var currentHub =
        (await firestoreService.getCollection('online_hubs').doc(hubId).get())
            .data() as Map<String, dynamic>;
    print(hubId);
    
    var onlineHubObject = OnlineHub.fromJson(currentHub);
    var newUsers = onlineHubObject.users!.where((id) => id != currentUserID);
    onlineHubObject.users = newUsers.toList();

    var updateData = onlineHubObject.toJson();

    await firestoreService
        .getCollection('online_hubs')
        .doc(hubId)
        .update(updateData);
  }

  Future listenHub(String hubId) async {
    await firestoreService
        .getCollection('online_hubs')
        .doc(hubId)
        .snapshots()
        .listen((event) async {
      if (event.data() != null) {
        var onlineHubObject =
            OnlineHub.fromJson(event.data() as Map<String, dynamic>);      
        Get.find<OnlineHubController>().updateHubData(onlineHubObject);
      }
    });
  }

  Future<int> _calculateDistance(dynamic lat2, dynamic lon2) async {
    String userID = Get.find<SharedPreferenceService>().getUserID();
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
    var hubID = await joinHub(hubType);
    await leftHub(lastHubId);
    if (hubID != null) {
      await listenHub(hubID);
    }
  }


  Future<void> likeUser(String userID) async {
    String currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var currentUser = await firestoreService.getCurrentUser(currentUserID);
    var currentUserDocID =  (await firestoreService.getCollection('users').where('userID', isEqualTo: currentUserID).get()).docs[0].id;

    var likedUserDoc = (await firestoreService.getCollection('users').where('userID', isEqualTo: userID).get()).docs[0];
    
    var likedUser =  UserModel.fromJson(likedUserDoc.data() as Map<String,dynamic>);

    var newCurrentUserLikeList = currentUser.users_i_liked;    
    newCurrentUserLikeList!.add(likedUser.userID);

    var currentUserUpdateData = Map<String,dynamic>();

    currentUserUpdateData['users_i_liked'] = newCurrentUserLikeList;

    await firestoreService.getCollection('users').doc(currentUserDocID).update(currentUserUpdateData);

    var newLikedUserWhoLikedList = likedUser.users_who_liked_me;
    newLikedUserWhoLikedList!.add(currentUserID);

    var likedUserUpdateData = Map<String,dynamic>();
    likedUserUpdateData['users_who_liked_me'] = newLikedUserWhoLikedList;

    await firestoreService.getCollection('users').doc(likedUserDoc.id).update(likedUserUpdateData);


  }

  Future<void> dislikeUser(String userID) async {
    String currentUserId = Get.find<SharedPreferenceService>().getUserID();

    var currentUser = await firestoreService.getCurrentUser(currentUserId);
    var currentUserDoc =  (await firestoreService.getCollection('users').where('userID', isEqualTo: currentUserId).get()).docs[0];

    var newUnLikedList = currentUser.un_liked_users!;
    newUnLikedList.add(currentUserId);

    var updateData = Map<String,dynamic>();

    updateData['un_liked_users'] = newUnLikedList;
    
    await firestoreService.getCollection('users').doc(currentUserDoc.id).update(updateData);

  }
}
