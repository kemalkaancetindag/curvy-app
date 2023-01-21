import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class SliderController extends GetxController {
  String _curvyLikeMessageText = "";
  String _curvyChipMessageText = "";

  List<List<double>> imagePositions = [];
  List<Widget>? imageWidgets;

  double left = 0;
  double right = 0;
  double angle = 0;
  double bottom = 0;
  double top = 0;
  int animationDuration = 0;

  int? imageBeforeIndex;
  int imageCurrentIndex = 0;
  int imageNextIndex = 0;

  double? tapLocationX;
  double? tapLocationY;

  double? decideLocationX;
  double? decideLocationY;

  UserModel? _user;
  UserModel? get user => _user;

  double rejectOpacity = 0;
  double confirmOpacity = 0;

  int userIndex;

  SliderController({required this.userIndex});

  void setUser(UserModel user) {
    _user = user;
    update();
  }

  void decideHorizontalAction() async {
    if (Get.width / 3 > decideLocationX!) {
      bottom = -Get.height;
      top = Get.height;
      left = -Get.width;
      right = Get.width;
      animationDuration = 250;
      String userID = Get.find<SharedPreferenceService>().getUserID()!;
      var currentUser = await Get.find<FirestoreService>().getUser(userID);
      List<dynamic> unLikedUsers = currentUser.un_liked_users!;
      unLikedUsers.add(_user!.userID);
      await Get.find<MatcherController>().updateUnLikedUsers(unLikedUsers);

      await Get.find<MatcherController>().controllCurrentUserIndex(true);
    } else if ((Get.width - (Get.width / 3)) < decideLocationX!) {
      bottom = -Get.height;
      top = Get.height;
      left = Get.width;
      right = -Get.width;
      animationDuration = 250;

      await Get.find<MatcherController>().controllCurrentUserIndex(true);
      Get.find<MatchService>().createMatch(user!.userID!);
    } else {
      resetPosition();
    }
    update();
  }

  void showCurvyLikeDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.w42),
            backgroundColor: Colors.transparent,
            child: Container(              
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
                                    child: Center(
                                      child: Text(
                                        "168",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    ),
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
                                    _curvyLikeMessageText, _user!.userID!, 1);
                                await Get.find<MatchService>()
                                    .createMatch(_user!.userID!);
                                _curvyLikeMessageText = "";
                                Get.find<MatcherController>()
                                    .controllCurrentUserIndex(true);
                                Get.back();
                                autoSlide(true);
                              },
                              child: Container(
                                width: Dimensions.h22,
                                height: Dimensions.h22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage( "assets/images/curvy_dialog_send_icon.png"),
                                    fit: BoxFit.cover
                                  )
                                ),                              
                              ),
                            ),
                            Container(
                              width: Dimensions.h22,
                              height: Dimensions.h22,
                               decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(  "assets/images/curvy_dialog_mic_icon.png"),
                                    fit: BoxFit.cover
                                  )
                                ),                                             
                            ),
                            Container(
                                width: Dimensions.h22,
                              height: Dimensions.h22,
                               decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage( "assets/images/curvy_dialog_add_icon.png"),
                                    fit: BoxFit.cover
                                  )
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
              insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.w42),
            backgroundColor: Colors.transparent,
            child: Container(              
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
                                    child: Center(
                                      child: Text(
                                        "168",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    ),
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
                              _curvyChipMessageText = value;
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
                                    _curvyChipMessageText, _user!.userID!, 2);
                                await Get.find<MatchService>()
                                    .createMatch(_user!.userID!);
                                _curvyChipMessageText = "";
                                Get.back();
                                autoSlide(true);
                              },
                              child: Container(
                                width: Dimensions.h22,
                                height: Dimensions.h22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage( "assets/images/curvy_dialog_send_icon.png")
                                  )
                                ),                               
                              ),
                            ),
                            Container(
                               width: Dimensions.h22,
                                height: Dimensions.h22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/curvy_dialog_mic_icon.png")
                                  )
                                ),                                         
                            ),
                                Container(
                               width: Dimensions.h22,
                                height: Dimensions.h22,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage( "assets/images/curvy_dialog_add_icon.png")
                                  )
                                ),                                         
                            ),                          
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

  void decideVerticalAction() {
    if (Get.height / 2.5 > decideLocationY!) {
      showCurvyChipDialog();
    } else if ((Get.height / 2.5) < decideLocationY!) {
      showCurvyLikeDialog();
    }
  }

  void next() {
    if (imagePositions.length - 1 > imageCurrentIndex) {
      imageCurrentIndex = imageCurrentIndex + 1;
      imageNextIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;

      imagePositions[imageBeforeIndex!][0] = -Get.width;
      imagePositions[imageBeforeIndex!][1] = Get.width;

      imagePositions[imageCurrentIndex][0] = 0;
      imagePositions[imageCurrentIndex][1] = 0;
    }
  }

  void before() {
    if (imageCurrentIndex != 0 && imageBeforeIndex != null) {
      imageCurrentIndex = imageBeforeIndex!;
      imageNextIndex = imageCurrentIndex + 1;
      imageBeforeIndex = imageCurrentIndex - 1;

      imagePositions[imageNextIndex][0] = Get.width;
      imagePositions[imageNextIndex][1] = -Get.width;

      imagePositions[imageCurrentIndex][0] = 0;
      imagePositions[imageCurrentIndex][1] = 0;
    }
  }

  void setTapGlobalLocation(double locationX, double locationY) {
    tapLocationX = locationX;
    tapLocationY = locationY;
  }

  void controlCarousel() {
    if (tapLocationX! > Get.width / 2) {
      next();
    } else {
      before();
    }
    update();
  }

  Widget generateListIndicators(List<dynamic> images, String controllerTag) {
    List<Widget> indicators = [];
    Widget? indicatorRow;

    for (int i = 0; i < images.length; i++) {
      indicators.add(GetBuilder<SliderController>(
          global: false,
          init: Get.find<SliderController>(tag: controllerTag),
          builder: (controller) {
            return Container(
              width: (Dimensions.w300 / (images.length + 1)),
              height: Dimensions.h60 / 10,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.h50 / 10)),
              child: Get.find<SliderController>(tag: controllerTag)
                          .imageCurrentIndex ==
                      i
                  ? Center(
                      child: Container(
                        height: Dimensions.h21 / 10,
                        width: (Dimensions.w300 / (images.length + 1)) / 1.1,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xFFD51CFF),
                          Color(0xFF6198EF)
                        ])),
                      ),
                    )
                  : null,
            );
          }));
    }

    indicatorRow = Positioned(
        left: Dimensions.w31,
        top: Dimensions.h21 - 2,
        child: Container(
          width: Dimensions.w300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: indicators,
          ),
        ));
    return indicatorRow;
  }

  void createImageCarousel(
      List<dynamic> images, String controllerTag, int distance) {
    var tempImageWidgets = <Widget>[];
    var predefinedWidgets = <Widget>[
      Positioned(
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
          )),
      Positioned(
          child: Container(
              height: Dimensions.h42 + 2,
              width: Dimensions.w300,
              child: Column(
                children: [
                  Row(
                    children: [],
                  )
                ],
              ))),
      GetBuilder<SliderController>(
          init: Get.find<SliderController>(tag: controllerTag),
          global: false,
          builder: (controller) {
            return Positioned(
                top: Dimensions.h300 / 2,
                left: Dimensions.w2 * 10,
                child: Container(
                  width: Dimensions.w120 + Dimensions.w11,
                  height: Dimensions.h52,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.white
                              .withOpacity(controller.confirmOpacity)),
                      borderRadius: BorderRadius.circular(Dimensions.h16 / 2)),
                  child: Center(
                    child: Text(
                      "EVET",
                      style: TextStyle(
                          color: Colors.white
                              .withOpacity(controller.confirmOpacity),
                          fontSize: Dimensions.h300 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          }),
      GetBuilder<SliderController>(
          init: Get.find<SliderController>(tag: controllerTag),
          global: false,
          builder: (controller) {
            return Positioned(
                top: Dimensions.h300 / 2,
                right: Dimensions.w2 * 10,
                child: Container(
                  width: Dimensions.w120 + Dimensions.w11,
                  height: Dimensions.h52,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.white
                              .withOpacity(controller.rejectOpacity)),
                      borderRadius: BorderRadius.circular(Dimensions.h16 / 2)),
                  child: Center(
                    child: Text(
                      "HAYIR",
                      style: TextStyle(
                          color: Colors.white
                              .withOpacity(controller.rejectOpacity),
                          fontSize: Dimensions.h300 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
          }),
      GetBuilder<SliderController>(
          init: Get.find<SliderController>(tag: controllerTag),
          global: false,
          builder: (controller) {
            return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: Dimensions.h209,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          stops: [0.3, 0.7],
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: Dimensions.w300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Dimensions.w120 / 10,
                                  height: Dimensions.h12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2),
                                      color: Color(0xFF05ED00)),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: Dimensions.w8 / 2),
                                  child: Center(
                                    child: Text(
                                      "${controller.user!.name!.split(" ")[0]},${(DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last))}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.h36,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: Dimensions.w8),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/confirm_icon.png"),
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  var userDetailController = Get.put(
                                      UserDetailController(
                                          firestoreService: Get.find(),
                                          userID: user!.userID!,
                                          userIndex: userIndex));

                                  Get.toNamed(Routes.userDetail);
                                },
                                child: Container(
                                  width: Dimensions.w300 / 10,
                                  height: Dimensions.h300 / 10,
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/expand_icon.png"),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      imageCurrentIndex == 0
                          ? Container(
                              width: Dimensions.w300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/location_white.png"),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: Dimensions.w8),
                                    child: Text(
                                      "$distance km uzaklıkta",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      imageCurrentIndex == 1
                          ? Container(
                              width: Dimensions.w300,
                              child: Text(
                                user!.about ?? "",
                                textAlign: TextAlign.start,
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Container(),
                      imageCurrentIndex == 2
                          ? Container(
                              width: Dimensions.w300,
                              child: Wrap(
                                children: [
                                  Container(
                                    height: Dimensions.h300 / 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h12 * 2),
                                        color: Colors.white.withOpacity(0.25)),
                                    child: Center(
                                      child: Text(
                                        "Sosyal olarak aktif",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h17),
                          width: Dimensions.w300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await Get.find<MatcherController>().goBack();
                                },
                                child: Container(
                                  width: Dimensions.h45,
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/matcher_back.png"),
                                      fit: BoxFit.contain
                                    )
                                  ),                                 
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await Get.find<MatchService>()
                                      .dislikeUser(user!.userID!);
                                  Get.find<MatcherController>()
                                      .controllCurrentUserIndex(true);
                                  autoSlide(false);
                                },
                                child: Container(
                                  width: Dimensions.h60,
                                  height: Dimensions.h60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/matcher_dislike.png"),
                                      fit: BoxFit.contain
                                    )
                                  ),                                 
                                ),
                              ),
                              GestureDetector(
                                
                                onTap: () {
                                  showCurvyLikeDialog();
                                },
                                child: Container(
                                  width: Dimensions.h52,
                                  height: Dimensions.h52,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.h52/2),
                                    image: DecorationImage(
                                      image: AssetImage( "assets/images/matcher_superlike.png"),
                                      fit: BoxFit.contain
                                    )
                                  ),                                 
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await Get.find<MatchService>()
                                      .createMatch(user!.userID!);

                                  Get.find<MatcherController>()
                                      .controllCurrentUserIndex(true);
                                  autoSlide(true);
                                },
                                child: Container(
                                  width: Dimensions.h60,
                                  height: Dimensions.h60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.h60/2),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/matcher_like.png"),
                                      fit: BoxFit.contain
                                    )
                                  ),                               
                                ),
                              ),
                              Container(
                                width: Dimensions.h45,
                                height: Dimensions.h45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.h45/2),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/matcher_turbo.png"),
                                    fit: BoxFit.contain
                                  )
                                ),                                
                              )
                            ],
                          ))
                    ],
                  ),
                ));
          })
    ];

    Widget indicatorRow = generateListIndicators(images, controllerTag);

    predefinedWidgets.insert(0, indicatorRow);

    for (int i = 0; i < images.length; i++) {
      if (i == 0) {
        imagePositions.add([0.0, 0.0]);
        tempImageWidgets.add(GetBuilder<SliderController>(
            init: Get.find<SliderController>(tag: controllerTag),
            global: false,
            builder: (_) {
              return AnimatedPositioned(
                  duration: Duration(milliseconds: 250),
                  top: 0,
                  bottom: 0,
                  right: Get.find<SliderController>(tag: controllerTag)
                      .imagePositions[i][1],
                  left: Get.find<SliderController>(tag: controllerTag)
                      .imagePositions[i][0],
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(images[i])}?alt=media'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(Dimensions.h12),
                    ),
                  ));
            }));
      } else {
        imagePositions.add([Get.width, -Get.width]);
        tempImageWidgets.add(GetBuilder<SliderController>(
            init: Get.find<SliderController>(tag: controllerTag),
            global: false,
            builder: (_) {
              return AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  top: 0,
                  bottom: 0,
                  right: Get.find<SliderController>(tag: controllerTag)
                      .imagePositions[i][1],
                  left: Get.find<SliderController>(tag: controllerTag)
                      .imagePositions[i][0],
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(images[i])}?alt=media'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(Dimensions.h12),
                    ),
                  ));
            }));
      }
    }

    tempImageWidgets.addAll(predefinedWidgets);

    imageWidgets = tempImageWidgets;

    update();
  }

  void dragHorizontal(double changeX, double globalX) {
    animationDuration = 0;
    right -= changeX;
    left += changeX;

    if (changeX > 0) {
      angle += math.pi / 600;
      bottom -= changeX * 2;
      top += changeX * 2;
      if (rejectOpacity > 0.05) {
        rejectOpacity -= 0.05;
      }

      if (confirmOpacity < 0.9) {
        confirmOpacity += 0.05;
      }
    } else if (changeX < 0) {
      angle -= math.pi / 600;
      bottom += changeX * 2;
      top -= changeX * 2;
      if (rejectOpacity < 0.9) {
        rejectOpacity += 0.05;
      }
      if (confirmOpacity > 0.5) {
        confirmOpacity -= 0.5;
      }
    }

    decideLocationX = globalX;

    update();
  }

  void dragVertical(double changeY, double globalY) {
    decideLocationY = globalY;
    animationDuration = 0;
    bottom -= changeY;
    top += changeY;
    update();
  }

  void resetPosition() {
    left = 0;
    right = 0;
    animationDuration = 250;
    angle = 0;
    top = 0;
    bottom = 0;
    rejectOpacity = 0;
    confirmOpacity = 0;
    update();
  }

  void setInitialImagePositions(int imageCount) {
    var imagePositions = <double>[];
    for (int i = 0; i <= imageCount; i++) {
      if (i == 0) {
        imagePositions.add(0);
      } else {
        imagePositions.add(-Get.width);
      }
    }
  }

  void autoSlide(bool isLiked) {
    if (isLiked) {
      bottom = -Get.height;
      top = Get.height;
      left = Get.width;
      right = -Get.width;
      animationDuration = 250;
    } else {
      bottom = -Get.height;
      top = Get.height;
      left = -Get.width;
      right = Get.width;
      animationDuration = 250;
    }
    update();
  }

  void returnBack() {
    left = 0;
    top = 0;
    right = 0;
    bottom = 0;
    angle = 0;
    rejectOpacity = 0;
    confirmOpacity = 0;
    update();
  }
}
