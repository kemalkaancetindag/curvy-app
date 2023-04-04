import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/bot_controll_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/enums/showme_enum.dart';
import 'package:curvy_app/models/bot_info_model.dart';
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
    var nonBotUsers;
    var nonBotUserIDS = [];

    var botUsers = await Get.find<BotControllService>().getBotUsers();

    if (currentUserDistancePref <= 100 && currentUserDistancePref > 40) {
      nonBotUsers = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km100",
                  isEqualTo: currentUser.location!.geohash!.km100)
              .where("bot", isEqualTo: 0)
              .get())
          .docs;
      ;
      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
    } else if (currentUserDistancePref <= 40 && currentUserDistancePref > 5) {
      nonBotUsers = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km40",
                  isEqualTo: currentUser.location!.geohash!.km40)
              .where("bot", isEqualTo: 0)
              .get())
          .docs;

      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
    } else if (currentUserDistancePref <= 5 && currentUserDistancePref > 2) {
      nonBotUsers = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km5",
                  isEqualTo: currentUser.location!.geohash!.km40)
              .where("bot", isEqualTo: 0)
              .get())
          .docs;
    } else if (currentUserDistancePref <= 2) {
      nonBotUsers = (await firestoreService
              .getCollection("users")
              .where("userID", isNotEqualTo: currentUserId)
              .where("location.geohash.km2",
                  isEqualTo: currentUser.location!.geohash!.km40)
              .where("bot", isEqualTo: 0)
              .get())
          .docs;

      if (nonBotUsers.length >= 4) {
        nonBotUsers = nonBotUsers.sublist(0, 4);
      }
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

    math.Random random = new math.Random();
    List<Map<String, dynamic>> newBotInfoData = [];
    List<String> changedBotInfoData = [];

    for (var recommendedUser in botUsers) {
      int currentDistance;
      var newJsonData = (recommendedUser.data() as Map<String, dynamic>);

      var existingBotInfo = currentUser.bot_info_list!
          .where((botInfo) => newJsonData["userID"] == botInfo.id)
          .toList();

      if (existingBotInfo.isEmpty) {
        int randomDistance = random.nextInt(
                currentUser.settings!.distance_preference!.distance!.toInt()) +
            2; // from 0 to 9 included
        List<double> newDistanceArray = calculateNewCoordinates(
            currentUser.location!.latitude!,
            currentUser.location!.longitude!,
            randomDistance.toDouble(),
            0);
        currentDistance =
            calculateDistance(newDistanceArray[0], newDistanceArray[1]);
      } else {
        
        var exitsingBot = existingBotInfo.first;

        if (exitsingBot.users_last_latitude == currentUser.location!.latitude &&
            exitsingBot.users_last_longitude ==
                currentUser.location!.longitude) {
          changedBotInfoData.add(exitsingBot.id);                  
          currentDistance = existingBotInfo[0].distance;
        } else {
          
          int randomDistance = random.nextInt(currentUser
                  .settings!.distance_preference!.distance!
                  .toInt()) +
              2; // from 0 to 9 included
          List<double> newDistanceArray = calculateNewCoordinates(
              currentUser.location!.latitude!,
              currentUser.location!.longitude!,
              randomDistance.toDouble(),
              0);
          currentDistance =
              calculateDistance(newDistanceArray[0], newDistanceArray[1]);
          
          var newCurrentUserBotInfoList = currentUser.bot_info_list!.where((element) => element.id != exitsingBot.id).toList();
          newCurrentUserBotInfoList.add(BotInfoModel(distance: currentDistance, id: exitsingBot.id, users_last_latitude: currentUser.location!.latitude, users_last_longitude: currentUser.location!.longitude, ));
          currentUser.bot_info_list = newCurrentUserBotInfoList;
          changedBotInfoData.add(exitsingBot.id);
          
        }
      }

      newJsonData["current_distance"] = currentDistance;

      var user = UserModel.fromJson(newJsonData);

      if ((currentUser.show_me! == user.sex &&
          !unWantedUsers.contains(user.userID) &&
          !nonBotUserIDS.contains(user.userID))) {
        recommendedUsers.add(newJsonData);
        if(!changedBotInfoData.contains(newJsonData["userID"])) {
                  newBotInfoData.add(BotInfoModel(
                distance: currentDistance,
                id: newJsonData["userID"],
                users_last_latitude: currentUser.location!.latitude,
                users_last_longitude: currentUser.location!.longitude)
            .toJson());
        }

      }

      if (currentUser.show_me == Showme.all.value &&
          !unWantedUsers.contains(user.userID) &&
          !nonBotUserIDS.contains(user.userID)) {
        recommendedUsers.add(newJsonData);
        if(!changedBotInfoData.contains(newJsonData["userID"])) {
                  newBotInfoData.add(BotInfoModel(
                distance: currentDistance,
                id: newJsonData["userID"],
                users_last_latitude: currentUser.location!.latitude,
                users_last_longitude: currentUser.location!.longitude)
            .toJson());
        }
      }

      if (recommendedUsers.length == 20 - recommendedNonBotUsers.length) {
        break;
      }
    }

    newBotInfoData.addAll(currentUser.toJson()["bot_info_list"]);
    await Get.find<BotControllService>()
        .saveNewBotInfos(newBotInfoData, currentUser.userID!);

    recommendedUsers.addAll(recommendedNonBotUsers);
    recommendedUsers.shuffle();
    recommendedUsers
        .sort((a, b) => b["current_distance"].compareTo(a["current_distance"]));

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

// Calculate the new latitude and longitude given a current location and offset in meters
// Returns a list with the new latitude and longitude in decimal degrees
  List<double> calculateNewCoordinates(
      double lat, double lon, double offsetKm, double bearing) {
    double latRadians = math.pi * lat / 180;
    double lonRadians = math.pi * lon / 180;

    double a = 6378137; // Equatorial radius in meters
    double b = 6356752.3142; // Polar radius in meters
    double earthRadius = 6371 * 1000;
    double offsetMeters = offsetKm * 1000;
    double offsetRadians = offsetMeters / earthRadius;

    double newLatRadians =
        latRadians + (offsetRadians * math.cos(bearing * math.pi / 180));

    double newLonRadians = lonRadians +
        (offsetRadians *
            math.sin(bearing * math.pi / 180) /
            math.cos(latRadians));

    double newLat = 180 * newLatRadians / math.pi;
    double newLon = 180 * newLonRadians / math.pi;

    return [newLat, newLon];
  }
}
