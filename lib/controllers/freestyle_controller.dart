import 'package:curvy_app/api/clients/go_api_client.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/recommendation_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/widgets/free_style_box.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  bool? _isPopupOn;
  bool? get isPopupOn => _isPopupOn;

  UserModel? _user;
  UserModel? get user => _user;

  String _curvyChipMessageText = "";
  String _curvyLikeMessageText = "";


  bool _isLoadingNewUsers = false;
  bool get isLoadingNewUsers => _isLoadingNewUsers;

  List<dynamic> _currentUsers = [];
  

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
    
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    _user = await Get.find<FirestoreService>().getUser(currentUserID!);
    _isPopupOn = _user!.show_freestyle_pop_up!;

    scrollController.addListener(() async { 
      if (scrollController.position.atEdge) {
      bool isTop = scrollController.position.pixels == 0;
      if (isTop) {
        
      } else {
        //BOTTOM
        if(_isLoadingNewUsers == false) {
          await loadContinousUsers();
        }
        

      }
    }
    });
    
    await generatePopup();
  }

  void setIsPopUpOn(bool state) {
    _isPopupOn = state;
    update();
  }

  Future<void> loadContinousUsers() async {
    _isLoadingNewUsers = true;
    update();

     List<UserModel> tempRecommendedUsers = [];

    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);

    var data = Map<String, dynamic>();
    data["userID"] = userID;
    data["un_liked_users"] = currentUser.un_liked_users;
     
    var unWantedUsers = currentUser.un_liked_users;
    unWantedUsers!.addAll(currentUser.users_i_liked!);
    unWantedUsers!.addAll(_currentUsers);
    

    var matches = await Get.find<RecommendationService>().getRecommendations(unWantedUsers);
    print("HAM");
    print(matches.length);
    

    

    matches.forEach((element) {
      var user = UserModel.fromJson(element as Map<String, dynamic>);
      tempRecommendedUsers.add(user);
    });

    List<Widget> tempRecommendedUsersWidgets = [];

    tempRecommendedUsers.forEach((element) async {
      int rDistance = await calculateDistance(element.location!.latitude!, element.location!.longitude!);
      recommendedUsersWidget!.add(FreeStyleBox(user: element,));
      _currentUsers.add(element.userID);
    });
    print("TEMP");
    print(tempRecommendedUsers.length);

    //recommendedUsersWidget!.addAll(tempRecommendedUsersWidgets);
    print("WİDGET");
    print(recommendedUsersWidget!.length);
    _isLoadingNewUsers = false;
    update();
  }

  Future<void> getRecommendedUsers() async {
    List<UserModel> tempRecommendedUsers = [];

    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);

    var data = Map<String, dynamic>();
    data["userID"] = userID;
    data["un_liked_users"] = currentUser.un_liked_users;
     
    var unWantedUsers = currentUser.un_liked_users;
    unWantedUsers!.addAll(currentUser.users_i_liked!);

    var matches = await Get.find<RecommendationService>().getRecommendations(unWantedUsers);
    print("POP");
    print(matches.first["userID"]);
    _currentUsers.add(matches.first["userID"]);
    selectedUser = UserModel.fromJson(matches.first as Map<String, dynamic>);

    matches.skip(1).forEach((element) {
      var user = UserModel.fromJson(element as Map<String, dynamic>);
      _currentUsers.add(user.userID);
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
              bottom: 0,
              left: imagePositions[i][0],
              right: imagePositions[i][1],
              child:Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:  NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(selectedUser!.images![i])}?alt=media')
                  )
                ),
              ));
        }));
      } else {
        imagePositions.add([Get.width, -Get.width]);
        tempImageCarousel
            .add(GetBuilder<FreestyleController>(builder: (controller) {
          return AnimatedPositioned(            
              duration: Duration(milliseconds: 250),              
              top: 0,
              bottom: 0,
              left: imagePositions[i][0],
              right: imagePositions[i][1],
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:  NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(selectedUser!.images![i])}?alt=media')
                  )
                ),
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
               SvgPicture.asset("assets/svg/matcher/card/report.svg"),
                SvgPicture.asset("assets/svg/matcher/card/share.svg"),
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
                              child: SvgPicture.asset("assets/svg/matcher/card/location.svg"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "${selectedUser!.current_distance} km uzaklıkta",
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
                      GestureDetector(
                        onTap: (){
                          showCurvyLikeDialog();                          
                        },
                        child: Container(
                        width: Dimensions.h60,
                        height: Dimensions.h60,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h60 / 2),
                            color: Colors.black.withOpacity(0.67)),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/matcher/freestyle/super_like.svg"),
                        ),
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          showCurvyChipDialog();
                        },
                        child:   Container(
                          margin: EdgeInsets.only(left: Dimensions.w11),
                        width: Dimensions.h60,
                        height: Dimensions.h60,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h60 / 2),
                            color: Colors.black.withOpacity(0.67)),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/matcher/freestyle/curvy_chip.svg"),
                        ),
                      ),
                      ),
                      
                    
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

  void generateFreestyleBox(List<UserModel> recommendedUsers) {
    List<Widget> tempRecommendedUsersWidgets = [];
    recommendedUsers.forEach((element) async {
      int rDistance = await calculateDistance(element.location!.latitude!, element.location!.longitude!);
      tempRecommendedUsersWidgets.add(FreeStyleBox(user: element));
    });

    recommendedUsersWidget = tempRecommendedUsersWidgets;
        
  }


  Future<void> turnOffPopUpInfo() async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();

    var firestoreService = Get.find<FirestoreService>();
    var data = Map<String,dynamic>();

    data['show_freestyle_pop_up'] = false;

    await firestoreService.updateUser(data, currentUserID!);

    _isPopupOn = false;
    update();

  }

  void showCurvyLikeDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: Dimensions.w35 * 10,
              height: Dimensions.h22 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    height: Dimensions.h36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: Image.asset(
                                "assets/images/curvy_like_dialog.png"),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "CurvyLIKE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h21),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.w9 / 3),
                                    child: GetBuilder<CurrentUserOnlineController>(
                                      builder: (cuoc) {
                                        return Center(
                                      child: Text(
                                        cuoc.userModel!.curvy_like!.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    );
                                      },
                                    )
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                    width: Dimensions.w320,
                    height: Dimensions.h60,
                    child: Text(
                      "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h100 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Dimensions.w325,
                    height: Dimensions.h90,
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: Dimensions.w270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h16)),
                          child: TextField(
                            onChanged: (value) {
                              _curvyLikeMessageText = value;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(Dimensions.w9),
                                hintText: "Bir mesaj yaz",
                                hintStyle: TextStyle(color: Color(0xFFC5C5C7)),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Get.find<ChatService>().startNewChat(
                                    _curvyLikeMessageText, selectedUser!.userID!, 1);
                                _curvyLikeMessageText = "";

                                Get.back();
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/curvy_dialog_send_icon.png"),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_mic_icon.png"),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_add_icon.png"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  
  void showCurvyChipDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: Dimensions.w35 * 10,
              height: Dimensions.h22 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    height: Dimensions.h36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: Image.asset(
                                "assets/images/curvy_chip_dialog.png"),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "CurvyCHIP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h21),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.w9 / 3),
                                    child: GetBuilder<CurrentUserOnlineController>(
                                      builder: (cuoc) {
                                        return Center(
                                      child: Text(
                                        cuoc.userModel!.curvy_chip!.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    );
                                      },
                                    )
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                    width: Dimensions.w320,
                    height: Dimensions.h60,
                    child: Text(
                      "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h100 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Dimensions.w325,
                    height: Dimensions.h90,
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: Dimensions.w270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h16)),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(Dimensions.w9),
                                hintText: "Bir mesaj yaz",
                                hintStyle: TextStyle(color: Color(0xFFC5C5C7)),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Get.find<ChatService>().startNewChat(
                                    _curvyChipMessageText, selectedUser!.userID!, 2);
                                _curvyChipMessageText = "";
                                Get.back();
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/curvy_dialog_send_icon.png"),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_mic_icon.png"),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_add_icon.png"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
