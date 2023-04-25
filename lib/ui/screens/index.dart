import 'package:camera/camera.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/buy_plus_premium_controller.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/confirm_me.dart';
import 'package:curvy_app/ui/screens/edit_profile.dart';
import 'package:curvy_app/ui/screens/settings.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:curvy_app/ui/widgets/circle_progress.dart';
import 'package:curvy_app/ui/widgets/main_action_button.dart';
import 'package:curvy_app/ui/widgets/main_boost_button.dart';
import 'package:curvy_app/ui/widgets/matching/new_matcher_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isIndexPageControllerRegistred = Get.isRegistered<IndexPageController>();

    if(!isIndexPageControllerRegistred) {
      print("NOT REG");
      Get.put(IndexPageController(userService: Get.find()));
    }
    
    if (Get.find<SetupController>().isAfterSetup) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        Get.find<IndexPageController>().showConfirmationDialog();
      });
    }

    

    

    return Scaffold(
      body: GetBuilder<IndexPageController>(
      builder: (indexPageController) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                    width: double.maxFinite,
                    height: Dimensions.h357 - Dimensions.h40,
                    child: Stack(
                      children: [
                        Positioned(
                            top: -Dimensions.h666,
                            left: -Dimensions.w316,
                            child: Container(
                              width: Dimensions.w1023,
                              height: Dimensions.h1023,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h1023 / 2),
                                  gradient: LinearGradient(
                                      colors: indexPageController.user != null
                                          ? (indexPageController.user!.sex == 0
                                              ? [
                                                  Colors.white,
                                                  Color(0xFFE2C1FC)
                                                ]
                                              : [
                                                  Colors.white,
                                                  Color(0xFFABE6FF)
                                                ])
                                          : [Colors.white, Colors.white],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                            )),
                        Positioned(
                            child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.h58, bottom: Dimensions.h8),
                                child: Center(
                                  child: SvgPicture.asset("assets/svg/index/curvy_logo.svg"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: Dimensions.h8),
                                width: Dimensions.w160,
                                height: Dimensions.h100 * 2,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        child: CustomPaint(
                                            painter: CircleProgress(),
                                            child: Container(
                                              width: Dimensions.h300,
                                              height: Dimensions.h300,
                                              child: Center(
                                                child: GestureDetector(
                                                  onTap: (){
                                                    
                                                  },
                                                  child: Container(
                                                  width: Dimensions.h140,
                                                  height: Dimensions.h140,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: indexPageController
                                                                  .user !=
                                                              null
                                                          ? DecorationImage(
                                                            fit: BoxFit.cover,
                                                              image:
                                                               NetworkImage(
                                                                  'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(indexPageController.user!.images![0])}?alt=media'))
                                                          : null,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions.h140/ 2)),
                                                ),
                                                )
                                              ),
                                            ))),
                                    Positioned(
                                        bottom: 0,
                                        child: Container(
                                            clipBehavior: Clip.none,
                                            width: Dimensions.w160,
                                            height: Dimensions.h40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.h22),
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFD51CFF),
                                                      Color(0xFF00FFE1)
                                                    ])),
                                            child: Center(
                                              child: Text(
                                                "%${indexPageController.compilation} Tamamlandı",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )))
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimensions.w8,
                                    height: Dimensions.h8,
                                    margin: EdgeInsets.only(
                                        right: Dimensions.w8 / 2),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF05ED00),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.w8 / 2)),
                                  ),
                                  Container(
                                    child: Text(
                                      indexPageController.user != null
                                          ? "${indexPageController.user!.name!.split(" ")[0]}, ${DateTime.now().year - int.parse(indexPageController.user!.birthdate!.split('/').last)}"
                                          : "",
                                      style: TextStyle(
                                          fontSize: Dimensions.h22,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      indexPageController.showConfirmationDialog();
                                    },
                                    child:  Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.w8 / 2),
                                    child: Center(
                                      child: SvgPicture.asset("assets/svg/index/confirmed.svg"),
                                    ),
                                  )
                                  ),
                                 
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    )),
                Container(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onPanDown: ((details) {
                                indexPageController.buttonAnimation(0);
                              }),
                              onPanCancel: (() {
                                indexPageController.buttonAnimation(null);
                              }),
                              onTap: (){
                                Get.toNamed(Routes.buyCurvyTurbo);
                              },
                              child:    MainBoostButton(
                                width: indexPageController.tappedButton == 0 ? Dimensions.w226 / 1.2 : Dimensions.w226,
                                icon: "assets/svg/index/curvy_turbo.svg",
                                text: "TURBO",
                                count: indexPageController.user != null
                                    ? indexPageController.user!.curvy_turbo!
                                    : 0,
                                background: LinearGradient(
                                    colors: [
                                      Color(0xFFFF0000),
                                      Color(0xFF0047FF)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.buyCurvyLike);
                              },
                                onPanDown: ((details) {
                                indexPageController.buttonAnimation(1);
                              }),
                              onPanCancel: (() {
                                indexPageController.buttonAnimation(null);
                              }),
                              child:   MainBoostButton(
                                width: indexPageController.tappedButton == 1 ? Dimensions.w209/1.2 : Dimensions.w209,
                                icon: "assets/svg/index/curvy_like.svg",
                                text: "LIKE",
                                count: indexPageController.user != null
                                    ? indexPageController.user!.curvy_like!
                                    : 0,
                                background: LinearGradient(
                                    colors: [
                                      Color(0xFF0095EC),
                                      Color(0xFF47C1B3)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)),
                            ),
                         
                          
                            GestureDetector(
                                 onPanDown: ((details) {
                                indexPageController.buttonAnimation(2);
                              }),
                              onPanCancel: (() {
                                indexPageController.buttonAnimation(null);
                              }),
                              onTap: (){
                                Get.toNamed(Routes.buyCurvyChip);
                              },
                              child:                             MainBoostButton(
                                width:  indexPageController.tappedButton == 2 ?  Dimensions.w226/1.2 : Dimensions.w226,
                                icon:"assets/svg/index/curvy_chip.svg",
                                text: "CHIP",
                                count: indexPageController.user != null
                                    ? indexPageController.user!.curvy_chip!
                                    : 0,
                                background: LinearGradient(
                                    colors: [
                                      Color(0xFFEEB137),
                                      Color(0xFFD99000)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                   onPanDown: ((details) {
                                indexPageController.buttonAnimation(3);
                              }),
                              onPanCancel: (() {
                                indexPageController.buttonAnimation(null);
                              }),
                              onTap: () {
                                Get.to(() => SettingsScreen());
                              },
                              child: MainActionButton(
                                id: 3,
                                currentButton: indexPageController.tappedButton,
                                text: "AYARLAR",
                                icon: "assets/svg/index/settings.svg",
                              ),
                            ),
                            GestureDetector(
                                   onPanDown: ((details) {
                                indexPageController.buttonAnimation(4);
                              }),
                              onPanCancel: (() {
                                indexPageController.buttonAnimation(null);
                              }),
                              onTap: () => {Get.to(() => EditProfileScreen())},
                              child: MainActionButton(
                                id: 4,
                                currentButton: indexPageController.tappedButton,
                                  text: "PROFİL DÜZENLE",
                                  icon: "assets/svg/index/edit_profile.svg"),
                            )
                          ],
                        )
                      ],
                    )),
                Container(
                  width: double.maxFinite,
                  height: Dimensions.h117,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: (){   
                          Get.toNamed(Routes.buyCurvyTurbo);                     
                        },
                        child:   Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.h117,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Column(
                          children: [
                            Container(
                              width: Dimensions.w310,
                              height: Dimensions.h60,
                              margin: EdgeInsets.only(
                                  top: Dimensions.h16, bottom: Dimensions.h8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.h52),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFFF0000),
                                        Color(0xFF0047FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Dimensions.w50 / 10),
                                    child: Center(
                                      child: SvgPicture.asset("assets/svg/index/curvy_turbo.svg"),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h27 - 3),
                                          text: "Curvy",
                                          children: [TextSpan(text: "TURBO")]))
                                ],
                              ),
                            ),
                            Text(
                              "HEMEN SATIN AL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h21 - 1,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.put(BuyPlusPremiumController(isPlus: false));
                          Get.toNamed(Routes.buyPlusPremium);
                        },
                        child:   Container(
                        width: MediaQuery.of(context).size.width,
                        height: Dimensions.h117,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        child: Column(
                          children: [
                            Container(
                              width: Dimensions.w310,
                              height: Dimensions.h60,
                              margin: EdgeInsets.only(
                                  top: Dimensions.h16, bottom: Dimensions.h8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.h52),
                                  gradient: LinearGradient(
                                      transform: GradientRotation(283),
                                      colors: [
                                        Colors.black,
                                        Color(0xFF2E2B2B),
                                        Colors.black,
                                      ],
                                      begin: Alignment(-1, 0),
                                      end: Alignment(1, 0))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: Dimensions.w50 / 10),
                                    child: Center(
                                      child: SvgPicture.asset("assets/svg/index/curvy_platinium.svg"),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h27 - 3),
                                          text: "Curvy",
                                          children: [
                                        TextSpan(text: "PLATINUM")
                                      ]))
                                ],
                              ),
                            ),
                            Text(
                              "HEMEN SATIN AL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h21 - 1,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                      )
                    
                    
                    ],
                  ),
                )
              ],
            ));
      },
    ));
  }
}
