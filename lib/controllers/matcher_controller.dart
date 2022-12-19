import 'package:curvy_app/api/services/firestore_service.dart';
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

  bool _isFreeStyle = false;
  bool _isMatcherStyleExpanded = false;
  double unSelectedWidth = Dimensions.w120 - Dimensions.w8;
  double selectedWidth = Dimensions.w180;

  bool get isFreeStyle => _isFreeStyle;
  bool get isMatcherStyleExpanded => _isMatcherStyleExpanded;

  List<Widget>? _cards;
  List<Widget>? get cards => _cards;

  int currentUserIndex = 0;

  MatcherController({required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCards();
  }

  Future<void> getCards() async {
    var matches = await firestoreService
        .getCollection('users')
        .where('sex', isEqualTo: 0)
        .limit(10)
        .get();
    RxList<Widget> cardList = <Widget>[].obs;
    matches.docs.forEach((element) {
      var user = UserModel.fromJson(element.data() as Map<String, dynamic>);
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
    if(index == 8){      
       var matches = await firestoreService
        .getCollection('users')
        .where('sex', isEqualTo: 0)
        .limit(10)
        .get();
    List<Widget> cardList = [];
    matches.docs.forEach((element) {
      
      var user = UserModel.fromJson(element.data() as Map<String, dynamic>);
      Get.put(SliderController(), tag: user.userID);
      Get.find<SliderController>(tag: user.userID)
          .createImageCarousel(user.images!, user.userID!);
       

      cardList.add(GetBuilder<SliderController>(
          init: Get.find<SliderController>(tag: user.userID),
          global: false,
          builder: (_) {
            return MatcherStyleUserCard(controllerTag: user.userID!);
          }));
      
    });

    

    _cards!.addAll(cardList);

    
    
    
    update();
    }
  }

  Future<void> controllCurrentUserIndex(bool isNext) async {
    if(isNext){
      currentUserIndex += 1;      
    }
    else{
      currentUserIndex -= 1;
    }
    await continousSlidingChecker(currentUserIndex);
    update();
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
