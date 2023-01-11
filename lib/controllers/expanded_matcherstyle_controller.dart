import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class ExpandedMatcherStyleController extends GetxController {
  UserModel? _user;
  UserModel? get user => _user;
  List<Widget>? imageCarousel;
  List<List<double>> imagePositions = [];

  int? imageBeforeIndex;
  int imageCurrentIndex = 0;
  int imageNextIndex = 1;

  int? distance;

  void next() {
    if(imageCurrentIndex + 1 < _user!.images!.length){
      imageCurrentIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;
      imageNextIndex = imageCurrentIndex + 1;
      imagePositions[imageCurrentIndex][0] = 0;
      imagePositions[imageCurrentIndex][1] = 0;
      imagePositions[imageBeforeIndex!][0] = -Get.width;
      imagePositions[imageBeforeIndex!][1] = Get.width;    
      print(imagePositions);  
      update();
    }
  }

  void before() {
    if(imageCurrentIndex != 0){
      imageCurrentIndex = imageCurrentIndex - 1;
      imageNextIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;

      imagePositions[imageCurrentIndex][0] = 0.0;
      imagePositions[imageCurrentIndex][1] = 0.0;
      imagePositions[imageNextIndex][0] = Get.width;
      imagePositions[imageNextIndex][1] = -Get.width;

      update();      
    }
  }

  void carouselController(double globalX) {
    if(globalX > Get.width/2){
      next();
    }
    else if(globalX < Get.width/2){
      print("sa");
      before();
    }
  }

  List<Widget> generateListIndicators(int imagesLength) {
    List<Widget> indicatorList = [];

    for(int i = 0; i < imagesLength; i++){
      indicatorList.add(
        GetBuilder<ExpandedMatcherStyleController>(
          builder: (controller){
            return   Container(
                  width: Dimensions.w300 / imagesLength,
                  height: Dimensions.h60 / 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.h50 / 10)),
                  child: Center(
                    child: Container(
                      height: Dimensions.h21 / 10,
                      width: (Dimensions.w300 / imagesLength) / 1.1,
                      decoration: BoxDecoration(
                          gradient: controller.imageCurrentIndex == i  ? LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF6198EF)]) : null),
                    ),
                  ));
          }
        )
      );

    }

    return indicatorList;

  }

  void createImageCarousel() {
    var indicatorList = generateListIndicators(_user!.images!.length);
    var tempImageWidgets = <Widget>[];
    for (int i = 0; i < _user!.images!.length; i++) {
      if (i == 0) {
        imagePositions.add([0.0, 0.0]);
        tempImageWidgets.add(
          GetBuilder<ExpandedMatcherStyleController>(
            builder: (controller){
               return           AnimatedPositioned(
            duration: Duration(milliseconds: 250),
              top: 0,
              bottom: 0,
              right: controller.imagePositions[i][0],
              left: controller.imagePositions[i][1],
              
              child: FittedBox(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_user!.images![i])}?alt=media'),
                fit: BoxFit.fill,
              ));
            }
          )        
        );
      } else {
        imagePositions.add([Get.width, -Get.width]);
        tempImageWidgets.add(
          GetBuilder<ExpandedMatcherStyleController>(
            builder: (controller){
              return  AnimatedPositioned(
            duration: Duration(milliseconds: 250),
              top: 0,
              bottom: 0,
              right: imagePositions[i][0],
              left: imagePositions[i][1],
              child: FittedBox(
                child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_user!.images![i])}?alt=media'),
                fit: BoxFit.fill,
              ));
            }
          )
         
        );
      }
    }

    tempImageWidgets.add(Positioned(
        left: Dimensions.w31,
        top: Dimensions.h21 - 2,
        child: Container(
          width: Dimensions.w300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: indicatorList
          ),
        )));

    tempImageWidgets.add(Positioned(
        top: Dimensions.h50,
        left: Dimensions.w31,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.h16),
              child: Center(
                child: Image.asset("assets/images/report.png"),
              ),
            ),
            Container(
                child: Center(
              child: Image.asset("assets/images/share.png"),
            ))
          ],
        )));

    tempImageWidgets.add(Positioned(
        bottom: -Dimensions.h50/2,
        right: Dimensions.h50/2,
        child: GestureDetector(
          onTap: () {
            Get.find<MatcherController>().shrinkUser();
          },
          child: Container(
            width: Dimensions.h50,
            height: Dimensions.h50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h50/2),
                gradient: LinearGradient(
                    colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
            child: Center(
              child: Image.asset("assets/images/expand_icon.png"),
            ),
          ),
        )));

    imageCarousel = tempImageWidgets;
    update();
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
    distance = await calculateDistance(_user!.location!.latitude!, _user!.location!.longitude!);
    createImageCarousel();


    update();
  }

  void removeUser() {
    _user = null;
    imageBeforeIndex = null;
    imageCurrentIndex = 0;
    imageNextIndex = 0;
    imageCarousel = null;
    imagePositions = [];

    update();
  }

 Future<int> calculateDistance(double lat2, double lon2) async {
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
}
