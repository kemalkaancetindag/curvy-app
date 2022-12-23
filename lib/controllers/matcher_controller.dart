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

class MatcherController extends GetxController {
  FirestoreService firestoreService;
  GoApiClient goApiClient;

  bool _isFreeStyle = false;
  bool _isMatcherStyleExpanded = false;
  double unSelectedWidth = Dimensions.w120 - Dimensions.w8;
  double selectedWidth = Dimensions.w180;

  bool get isFreeStyle => _isFreeStyle;
  bool get isMatcherStyleExpanded => _isMatcherStyleExpanded;

  List<Widget>? _cards;
  List<Widget>? get cards => _cards;

  int currentUserIndex = 0;

  List<String> _existingUsers = [];

  MatcherController(
      {required this.firestoreService, required this.goApiClient});

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCards();
  }

  Future<void> getCards() async {
    Map<String, dynamic> recommendationPostData = Map<String, dynamic>();

    String userID = Get.find<SharedPreferenceService>().getUserID();
    recommendationPostData["userID"] = userID;
    var user = await firestoreService.getCurrentUser(userID);
    recommendationPostData["un_liked_users"] = user.un_liked_users;

    var response =
        await goApiClient.postData(recommendationPostData, "/recommendations");
    var matches = response.body;

    RxList<Widget> cardList = <Widget>[].obs;
    matches.forEach((element) {
      var user = UserModel.fromJson(element as Map<String, dynamic>);
      _existingUsers.add(user.userID!);
      Get.put(SliderController(), tag: user.userID);
      Get.put(SliderController(), tag: user.userID).setUser(user);
      Get.find<SliderController>(tag: user.userID)
          .createImageCarousel(user.images!, user.userID!);

      cardList.add(GetBuilder<SliderController>(
          init: Get.find<SliderController>(tag: user.userID),
          global: false,
          builder: (_) {
            return MatcherStyleUserCard(controllerTag: user.userID!);
          }));
    });
    _cards = cardList;
    update();
  }

  Future<void> continousSlidingChecker(int index) async {
    if (index == 5) {
      Map<String, dynamic> recommendationPostData = Map<String, dynamic>();
      String userID = Get.find<SharedPreferenceService>().getUserID();
      recommendationPostData["userID"] = userID;
      var user = await firestoreService.getCurrentUser(userID);

      recommendationPostData["un_liked_users"] = user.un_liked_users;

      var response = await goApiClient.postData(
          recommendationPostData, "/recommendations");
      var matches = response.body;

      List<Widget> cardList = [];
      matches.forEach((element) {
        var user = UserModel.fromJson(element as Map<String, dynamic>);
        Get.put(SliderController(), tag: user.userID);
        Get.put(SliderController(), tag: user.userID).setUser(user);
        Get.find<SliderController>(tag: user.userID)
            .createImageCarousel(user.images!, user.userID!);

        cardList.add(GetBuilder<SliderController>(
            init: Get.find<SliderController>(tag: user.userID),
            global: false,
            builder: (_) {
              return MatcherStyleUserCard(controllerTag: user.userID!);
            }));
        currentUserIndex = 0;
      });

      _cards!.addAll(cardList);
      print(_cards);
    }

    update();
  }

  Future<void> controllCurrentUserIndex(bool isNext) async {
    if (isNext) {
      currentUserIndex += 1;
    } else {
      currentUserIndex -= 1;
    }
    await continousSlidingChecker(currentUserIndex);
    update();
  }

  Future<void> updateUnLikedUsers(List<dynamic> unLikedUsers) async {
    var data = Map<String,dynamic>();
    data["un_liked_users"] = unLikedUsers;
    String userID = Get.find<SharedPreferenceService>().getUserID();
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
}
