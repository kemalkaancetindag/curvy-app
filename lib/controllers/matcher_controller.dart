import 'package:curvy_app/api/clients/go_api_client.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/slider_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/widgets/matcher_style.dart';
import 'package:curvy_app/ui/widgets/matcher_style_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MatcherController extends GetxController {
  FirestoreService firestoreService;
  GoApiClient goApiClient;

  UserModel? _notFoundCurrentUser;
  UserModel? get notFoundCurrentUser => _notFoundCurrentUser;

  bool _isFreeStyle = false;
  bool _isMatcherStyleExpanded = false;
  double unSelectedWidth = Dimensions.w120 - Dimensions.w8;
  double selectedWidth = Dimensions.w180;

  bool get isFreeStyle => _isFreeStyle;
  bool get isMatcherStyleExpanded => _isMatcherStyleExpanded;

  List<Widget>? _cards;
  List<Widget>? get cards => _cards;

  int currentUserIndex = 0;

  List<String>? _users;
  List<String>? get users => _users;

  List<String> _existingUsers = [];

  double? _userDistancePreference;
  double? get userDistancePreference => _userDistancePreference;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  MatcherController(
      {required this.firestoreService, required this.goApiClient});

  @override
  Future<void> onInit() async {
    super.onInit();
    String currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    _notFoundCurrentUser = await firestoreService.getUser(currentUserID);
    _userDistancePreference =
        _notFoundCurrentUser!.settings!.distance_preference!.distance!;
    if (_cards == null) {
      await getCards();
    }
  }

  Future<int> calculateDistance(double lat2, double lon2) async {
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

  Future<void> getCards() async {
    _isLoading = true;
    _users = [];
    _cards = [];

    Map<String, dynamic> recommendationPostData = Map<String, dynamic>();

    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    recommendationPostData["userID"] = userID;
    var user = await firestoreService.getCurrentUser(userID);
    var unWantedUsers = user.un_liked_users;
    unWantedUsers!.addAll(user.users_i_liked!);

    recommendationPostData["un_liked_users"] = unWantedUsers;

    var response =
        await goApiClient.postData(recommendationPostData, "/recommendations");
    var matches = response.body;

    List<Future<dynamic>> lastCardImages = [];

    RxList<Widget> cardList = <Widget>[].obs;


    for (int i = (matches as List<dynamic>).length - 1; i >= 0; i--) {
      if (matches[i] != null) {
        var user = UserModel.fromJson(matches[i] as Map<String, dynamic>);
        _users!.add(user.userID!);
        int distance = await calculateDistance(
            user.location!.latitude!, user.location!.longitude!);
        _existingUsers.add(user.userID!);
        var sliderController =
            Get.put(SliderController(userIndex: i), tag: user.userID);
        sliderController.setUser(user);
        Get.find<SliderController>(tag: user.userID)
            .createImageCarousel(user.images!, user.userID!, distance);

        cardList.add(GetBuilder<SliderController>(
            init: Get.find<SliderController>(tag: user.userID),
            global: false,
            builder: (_) {
              return MatcherStyleUserCard(controllerTag: user.userID!);
            }));      
       await Future.forEach( user.images!,(element) async {          
            await precacheImage(NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(element)}?alt=media'), Get.context!);
      });
      }
    }

    _cards = cardList;

    _isLoading = false;

    update();
  }

  Future<void> controllCurrentUserIndex(bool isNext) async {
    if (isNext) {
      currentUserIndex += 1;
    } else {
      currentUserIndex -= 1;
    }
    await continuousSliding(currentUserIndex);
    update();
  }

  Future<void> continuousSliding(int slideCount) async {
    if (slideCount == 5) {
      List<Widget> newCards = [];
      Map<String, dynamic> recommendationPostData = Map<String, dynamic>();

      String userID = Get.find<SharedPreferenceService>().getUserID()!;
      recommendationPostData["userID"] = userID;
      var user = await firestoreService.getCurrentUser(userID);
      var unWantedUsers = user.un_liked_users;
      unWantedUsers!.addAll(user.users_i_liked!);

      recommendationPostData["un_liked_users"] = unWantedUsers;

      var response = await goApiClient.postData(
          recommendationPostData, "/recommendations");
      var matches = response.body;

      for (int i = (matches as List<dynamic>).length - 1; i >= 0; i--) {
        if (matches[i] != null) {
          var user = UserModel.fromJson(matches[i] as Map<String, dynamic>);
          _users!.add(user.userID!);
          int distance = await calculateDistance(
              user.location!.latitude!, user.location!.longitude!);
          _existingUsers.add(user.userID!);
          var sliderController = Get.put(
              SliderController(userIndex: _users!.length + i),
              tag: user.userID);
          sliderController.setUser(user);
          Get.find<SliderController>(tag: user.userID)
              .createImageCarousel(user.images!, user.userID!, distance);

          newCards.add(GetBuilder<SliderController>(
              init: Get.find<SliderController>(tag: user.userID),
              global: false,
              builder: (_) {
                return MatcherStyleUserCard(controllerTag: user.userID!);
              }));
        }
      }

      _cards!.addAll(newCards);
      currentUserIndex = 0;
    }

    update();
  }

  Future<void> updateUnLikedUsers(List<dynamic> unLikedUsers) async {
    var data = Map<String, dynamic>();
    data["un_liked_users"] = unLikedUsers;
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    await firestoreService.updateUser(data, userID);
  }

  void setStyle(bool style) {
    _isFreeStyle = style;
    update();
  }

  void setExpansion(bool expansion) {
    _isMatcherStyleExpanded = expansion;
    update();
  }

  void expandUser(UserModel user) {
    Get.find<ExpandedMatcherStyleController>().setUser(user);
    update();
  }

  void shrinkUser() {
    Get.find<ExpandedMatcherStyleController>().removeUser();
    update();
  }

  Future<void> goBack() async {
    String currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await firestoreService.getCurrentUser(currentUserID);

    if (currentUser.remaining_daily_back_count! > 0) {
      if (currentUserIndex != 0) {
        //iJG5IuYK6Y2aNuxEcPjj

        var matches = (await firestoreService
                .getCollection('matches')
                .where("user1.id", isEqualTo: currentUserID)
                .where("user2.id",
                    isEqualTo: _users![_users!.length - currentUserIndex])
                .get())
            .docs;

        if (matches.isNotEmpty) {
          var matchDoc = matches[0];

          var chats = (await firestoreService
                  .getCollection('chats')
                  .where('user1', isEqualTo: currentUserID)
                  .get())
              .docs;

          if (chats.isNotEmpty) {
            await firestoreService
                .getCollection('chats')
                .doc(chats[0].id)
                .delete();
          }

          var likedUser = await firestoreService
              .getUser(_users![_users!.length - currentUserIndex]);

          var newLikedUserWhoLikedMeList = likedUser.users_who_liked_me!
              .where((id) => id != currentUserID)
              .toList();
          var newCurrentUserILikedList = currentUser.users_i_liked!
              .where((id) => id != _users![_users!.length - currentUserIndex])
              .toList();

          var currentUserData = Map<String, dynamic>();
          var likedUserData = Map<String, dynamic>();

          currentUserData['users_i_liked'] = newCurrentUserILikedList;
          currentUserData['remaining_daily_back_count'] =
              currentUser.remaining_daily_back_count! - 1;
          likedUserData['users_who_liked_me'] = newLikedUserWhoLikedMeList;

          await firestoreService.updateUser(currentUserData, currentUserID);
          await firestoreService.updateUser(
              likedUserData, _users![_users!.length - currentUserIndex]);

          await firestoreService
              .getCollection('matches')
              .doc(matchDoc.id)
              .delete();

          Get.find<SliderController>(
                  tag: _users![_users!.length - currentUserIndex])
              .returnBack();

          currentUserIndex = currentUserIndex - 1;
        } else {
          var currentUser =
              await firestoreService.getCurrentUser(currentUserID);

          var newUnLikedUsersList = currentUser.un_liked_users!
              .where((id) => id != _users![_users!.length - currentUserIndex])
              .toList();

          var data = Map<String, dynamic>();

          data['un_liked_users'] = newUnLikedUsersList;
          data['remaining_daily_back_count'] =
              currentUser.remaining_daily_back_count! - 1;

          await firestoreService.updateUser(data, currentUserID);

          Get.find<SliderController>(
                  tag: _users![_users!.length - currentUserIndex])
              .returnBack();

          currentUserIndex = currentUserIndex - 1;
        }
      }
    }
  }

  void setCurrentUserIndex(bool isNext) {
    if (isNext) {
      currentUserIndex = currentUserIndex + 1;
    } else {
      currentUserIndex = currentUserIndex - 1;
    }
  }

  void setDistancePreference(double distance) {
    _userDistancePreference = distance;
    print(_userDistancePreference);
    update();
  }

  Future updateDistancePreference() async {
    var data = Map<String, dynamic>();
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    print("sa");
    print(_userDistancePreference);
    print(userID);
    data['settings.distance_preference.distance'] = _userDistancePreference;
    await firestoreService.updateUser(data, userID);
    await onInit();
    update();
  }
}
