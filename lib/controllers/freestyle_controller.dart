import 'package:curvy_app/api/clients/go_api_client.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/widgets/free_style_box.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FreestyleController extends GetxController {
  ScrollController scrollController = ScrollController();

  GoApiClient goApiClient;

  UserModel? selectedUser;
  List<Widget>? imageCarousel;
  List<List<double>> imagePositions = [];

  int? imageBeforeIndex;
  int imageCurrentIndex = 0;
  int imageNextIndex = 1;

  List<Widget>? recommendedUsersWidget;

  int? distance;
  

  FreestyleController({required this.goApiClient});

  void next(){
    if(imageCurrentIndex + 1 < imagePositions.length){
      imageCurrentIndex = imageCurrentIndex + 1;
      imageNextIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;

      imagePositions[imageCurrentIndex][0] = 0;
      imagePositions[imageCurrentIndex][1] = 0;

      imagePositions[imageBeforeIndex!][0] = -Get.width;
      imagePositions[imageBeforeIndex!][1] = Get.width;
      
    }
  }

  void before() {
    if(imageCurrentIndex != 0){
      imageCurrentIndex = imageCurrentIndex - 1;
      imageNextIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;

      imagePositions[imageCurrentIndex][0] = 0;
      imagePositions[imageCurrentIndex][1] = 0;

      imagePositions[imageNextIndex][0] = Get.width;
      imagePositions[imageNextIndex][1] = -Get.width;
    }
  }

  void controlCarousel(double globalX) {
    if(globalX < Get.width/2){
      before();
    }
    else if(globalX > Get.width/2){
      next();
    }

    update();
  }

  @override
  Future<void> onInit() async {
    await getRecommendedUsers();
    distance = await calculateDistance(selectedUser!.location!.latitude!, selectedUser!.location!.longitude!);
    await generatePopup();
  }

  Future<void> getRecommendedUsers() async {
    List<UserModel> tempRecommendedUsers = [];

    String userID = Get.find<SharedPreferenceService>().getUserID();
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);

    var data = Map<String, dynamic>();
    data["userID"] = userID;
    data["un_liked_users"] = currentUser.un_liked_users;

    var response = await goApiClient.postData(data, "/recommendations");
    selectedUser = UserModel.fromJson(response.body[0] as Map<String, dynamic>);

    response.body.skip(0).forEach((element) {
      var user = UserModel.fromJson(element as Map<String, dynamic>);
      tempRecommendedUsers.add(user);
    });

    generateFreestyleBox(tempRecommendedUsers.skip(0).toList());

    update();
  }

  Future<void> setSelectedUser(UserModel user) async {
    selectedUser = user;    
    imageBeforeIndex = null;
    imageCurrentIndex = 0;
    imageNextIndex = 1;
    distance = await calculateDistance(selectedUser!.location!.latitude!, selectedUser!.location!.longitude!);
    await generatePopup();
    scrollController.animateTo(0 , duration: Duration(milliseconds: 250), curve: Curves.ease);
    update();
  }

  List<Widget> generateListIndicators(int imageLength) {
    var listIndicators = <Widget>[];
    for (int i = 0; i < imageLength; i++) {
      listIndicators.add(GetBuilder<FreestyleController>(builder: (controller) {
        return Container(
          width: Dimensions.w300 / imageLength,
          height: Dimensions.h7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.h100 / 20)),
          child: Center(
            child: Container(
              height: Dimensions.h7 / 3,
              width: (Dimensions.w300 / imageLength) / 1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h8 / 4),
                  gradient: controller.imageCurrentIndex == i
                      ? LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
                      : null),
            ),
          ),
        );
      }));
    }

    return listIndicators;
  }

  Future<void> generatePopup() async {
    List<Widget> tempImageCarousel = [];
    var listIndicators = generateListIndicators(selectedUser!.images!.length);

    for (int i = 0; i < selectedUser!.images!.length; i++) {
      if (i == 0) {
        imagePositions.add([0, 0]);
        tempImageCarousel
            .add(GetBuilder<FreestyleController>(builder: (controller) {
          return AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              top: 0,
              bottom: Dimensions.h100,
              left: imagePositions[i][0],
              right: imagePositions[i][1],
              child: DecoratedBox(
                child: FittedBox(
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(selectedUser!.images![i])}?alt=media'),
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(                  
                    borderRadius: BorderRadius.circular(Dimensions.h16)),
              ));
        }));
      } else {
        imagePositions.add([Get.width, -Get.width]);
        tempImageCarousel
            .add(GetBuilder<FreestyleController>(builder: (controller) {
          return AnimatedPositioned(            
              duration: Duration(milliseconds: 250),              
              top: 0,
              bottom: Dimensions.h100,
              left: imagePositions[i][0],
              right: imagePositions[i][1],
              child: DecoratedBox(
                child: FittedBox(
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(selectedUser!.images![i])}?alt=media'),
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h16)),
              ));
        }));
      }

      tempImageCarousel.add(
        Positioned(
            left: Dimensions.w200 / 10,
            right: Dimensions.w200 / 10,
            top: Dimensions.h14,
            child: Container(
              width: Dimensions.w300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: listIndicators,
              ),
            )),
      );

      tempImageCarousel.add(Positioned(
          top: Dimensions.h40,
          left: Dimensions.w200 / 10,
          child: Container(
            height: Dimensions.h8 * 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/report.png"),
                Image.asset("assets/images/share.png")
              ],
            ),
          )));
      tempImageCarousel.add(
        Positioned(
            top: Dimensions.h300 + Dimensions.h300 / 6,
            left: Dimensions.w200 / 10,
            right: Dimensions.w200 / 10,
            child: Container(
              height: Dimensions.h66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: Dimensions.w8,
                            height: Dimensions.h8,
                            margin: EdgeInsets.only(right: Dimensions.w9),
                            decoration: BoxDecoration(
                                color: Color(0xFF05ED00),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h8 / 2)),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "${selectedUser!.name!.split(" ")[0]},",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h36,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "${DateTime.now().year - int.parse(selectedUser!.birthdate!.split("/").last)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h230 / 10),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.w9),
                            child: Center(
                              child: Image.asset(
                                  "assets/images/location_white.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "$distance km uzaklıkta",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: Dimensions.h60,
                        height: Dimensions.h60,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h60 / 2),
                            color: Colors.black.withOpacity(0.67)),
                        child: Center(
                          child: Image.asset(
                              "assets/images/matcher_superlike.png"),
                        ),
                      ),
                      Container(
                        width: Dimensions.h60,
                        height: Dimensions.h60,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h60 / 2),
                            color: Colors.black.withOpacity(0.67)),
                        child: Center(
                          child: Image.asset("assets/images/matcher_chip.png"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      );

      imageCarousel = tempImageCarousel;
      update();
    }
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

  void generateFreestyleBox(List<UserModel> recommendedUsers) {
    List<Widget> tempRecommendedUsersWidgets = [];
    recommendedUsers.forEach((element) async {
      int rDistance = await calculateDistance(element.location!.latitude!, element.location!.longitude!);
      tempRecommendedUsersWidgets.add(FreeStyleBox(user: element, distance: rDistance,));
    });

    recommendedUsersWidget = tempRecommendedUsersWidgets;
        
  }
}
