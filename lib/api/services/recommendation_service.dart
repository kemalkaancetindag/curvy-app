import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/enums/showme_enum.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class RecommendationService extends GetxService {
  FirestoreService firestoreService;

  RecommendationService({required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<List<dynamic>> getRecommendations(List<dynamic> unWantedUsers) async {
    var currentUserId = Get.find<SharedPreferenceService>().getUserID();
    var currentUser = await firestoreService.getUser(currentUserId!);
    var currentUserDistancePref =
        currentUser.settings!.distance_preference!.distance!;
    var users;
    var nonBotUsers;
    var nonBotUserIDS = [];

    if (currentUserDistancePref <= 100 && currentUserDistancePref > 40) {
      users = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km100",
                  isEqualTo: currentUser.location!.geohash!.km100)
              .get())
          .docs;

      nonBotUsers = users.where(
          (element) => (element.data() as Map<String, dynamic>)["bot"] == 0).toList();
      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
    } else if (currentUserDistancePref <= 40 && currentUserDistancePref > 5) {
      users = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km40",
                  isEqualTo: currentUser.location!.geohash!.km40)
              .get())
          .docs;
      nonBotUsers = users.where(
          (element) => (element.data() as Map<String, dynamic>)["bot"] == 0).toList();
      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
      print(nonBotUsers.length);
    } else if (currentUserDistancePref <= 5 && currentUserDistancePref > 2) {
      users = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km5",
                  isEqualTo: currentUser.location!.geohash!.km5)
              .get())
          .docs;
      nonBotUsers = users.where(
          (element) => (element.data() as Map<String, dynamic>)["bot"] == 0).toList();
      print(nonBotUsers.length);
    } else if (currentUserDistancePref <= 2) {
      users = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km2",
                  isEqualTo: currentUser.location!.geohash!.km2)
              .get())
          .docs;
      nonBotUsers = users.where(
          (element) => (element.data() as Map<String, dynamic>)["bot"] == 0).toList();
      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
      print(nonBotUsers.length);
    }

    List<dynamic> recommendedUsers = [];
    List<dynamic> recommendedNonBotUsers = [];

    for (var nonBotUser in nonBotUsers) {
      int currentDistance = calculateDistance(
          (nonBotUser.data() as Map<String, dynamic>)["location"]["latitude"],
          (nonBotUser.data() as Map<String, dynamic>)["location"]["longitude"]);
      var newJsonData = (nonBotUser.data() as Map<String, dynamic>);
      newJsonData["current_distance"] = currentDistance;

      var user = UserModel.fromJson(newJsonData);

      if ((currentUser.show_me! == user.sex &&
          !unWantedUsers.contains(user.userID))) {
        recommendedNonBotUsers.add(newJsonData);
        nonBotUserIDS.add(newJsonData["userID"]);
      }

      if (currentUser.show_me == Showme.all.value &&
          !unWantedUsers.contains(user.userID)) {
        recommendedNonBotUsers.add(newJsonData);
        nonBotUserIDS.add(newJsonData["userID"]);
      }
    }

    for (var recommendedUser in users) {
      int currentDistance = calculateDistance(
          (recommendedUser.data() as Map<String, dynamic>)["location"]
              ["latitude"],
          (recommendedUser.data() as Map<String, dynamic>)["location"]
              ["longitude"]);
      var newJsonData = (recommendedUser.data() as Map<String, dynamic>);
      newJsonData["current_distance"] = currentDistance;

      var user = UserModel.fromJson(newJsonData);

      if ((currentUser.show_me! == user.sex &&
          !unWantedUsers.contains(user.userID) && !nonBotUserIDS.contains(user.userID))) {
        recommendedUsers.add(newJsonData);
      }

      if (currentUser.show_me == Showme.all.value &&
          !unWantedUsers.contains(user.userID) && !nonBotUserIDS.contains(user.userID)) {
        recommendedUsers.add(newJsonData);
      }

      if (recommendedUsers.length == 20 - recommendedNonBotUsers.length) {
        break;
      }
    }

    recommendedUsers.addAll(recommendedNonBotUsers);
    recommendedUsers.shuffle();
    recommendedUsers.sort((a,b) => b["current_distance"].compareTo(a["current_distance"]));

    return recommendedUsers;
  }

  int calculateDistance(double lat2, double lon2) {
    var currentUser = Get.find<NewMatcherController>().currentUser!;

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
}
