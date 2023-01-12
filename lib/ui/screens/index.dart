import 'package:camera/camera.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/confirm_me.dart';
import 'package:curvy_app/ui/screens/edit_profile.dart';
import 'package:curvy_app/ui/screens/settings.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:curvy_app/ui/widgets/circle_progress.dart';
import 'package:curvy_app/ui/widgets/main_action_button.dart';
import 'package:curvy_app/ui/widgets/main_boost_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IndexPageController(userService: Get.find()));
    if (Get.find<SetupController>().isAfterSetup) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, _, __) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Dimensions.w300,
                        height: Dimensions.h450,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h16)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: Dimensions.h21),
                              child: Center(
                                child: Image.asset(
                                    "assets/images/confirm_me_icon.png"),
                              ),
                            ),
                            Container(
                              width: Dimensions.w267,
                              height: Dimensions.h42,
                              child: Center(
                                child: Text(
                                  "Nasıl Çalışır?",
                                  style: TextStyle(
                                      fontSize: Dimensions.h27,
                                      color: Color(0xFF7B8491),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w267,
                              height: Dimensions.h148,
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style:
                                          TextStyle(color: Color(0xFF7B8491)),
                                      text:
                                          "Yüz tanıma teknolojimiz, video selfinde bulunan yüzü profilindeki fotoğraflarla karşılaştırır. Doğrulama tamamlandıktan sonra, genellikle 24 saatten kısa bir süre içerisinde yüz tanıma bilgilerini sileriz.",
                                      children: [
                                        TextSpan(
                                            text:
                                                " Bunun nasıl çalıştığı hakkında daha fazla bilgi edin.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color(0xFF7B8491)))
                                      ]),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await availableCameras().then(((value) {
                                  Get.find<SetupController>()
                                      .setAfterSetup(false);
                                  Get.back();
                                  Get.to(() => ConfirmMePage(cameras: value));
                                }));
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: Dimensions.h50 / 2),
                                width: Dimensions.w222,
                                height: Dimensions.h50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h50 / 2),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF00FFE1)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)),
                                child: Center(
                                  child: Text(
                                    "Beni Doğrula",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.h22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: Dimensions.h21),
                                  width: Dimensions.w222,
                                  height: Dimensions.h50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.4),
                                          width: Dimensions.w300 / 100),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 2)),
                                  child: Center(
                                    child: Text(
                                      "Belki daha sonra",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: Dimensions.h22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      });
    }

    return Scaffold(body: GetBuilder<IndexPageController>(
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
                                  child: Image.asset(
                                      "assets/images/main_logo.png"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                width: Dimensions.w160,
                                height: Dimensions.h100 * 2,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        child: CustomPaint(
                                            foregroundPainter: CircleProgress(),
                                            child: Container(
                                              width: Dimensions.w300,
                                              height: Dimensions.h300,
                                              child: Center(
                                                child: Container(
                                                  width: 140,
                                                  height: 140,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: indexPageController
                                                                  .user !=
                                                              null
                                                          ? DecorationImage(
                                                              image: NetworkImage(
                                                                  'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(indexPageController.user!.images![0])}?alt=media'))
                                                          : null,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              140 / 2)),
                                                ),
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
                                                "%65 Tamamlandı",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.w8 / 2),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/confirm_icon.png"),
                                    ),
                                  )
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
                            MainBoostButton(
                                width: Dimensions.w226,
                                icon: "assets/images/turbo_icon.png",
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
                            MainBoostButton(
                                width: Dimensions.w209,
                                icon: "assets/images/like_icon.png",
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
                            MainBoostButton(
                                width: Dimensions.w226,
                                icon: "assets/images/chip_icon.png",
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
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SettingsScreen());
                              },
                              child: MainActionButton(
                                text: "AYARLAR",
                                icon: "assets/images/settings_icon.png",
                              ),
                            ),
                            GestureDetector(
                              onTap: () => {Get.to(() => EditProfileScreen())},
                              child: MainActionButton(
                                  text: "PROFİL DÜZENLE",
                                  icon: "assets/images/edit_icon.png"),
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
                      Container(
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
                                      child: Image.asset(
                                          "assets/images/turbo_icon.png"),
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
                      Container(
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
                                      child: Image.asset(
                                          "assets/images/platinium_logo.png"),
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
                    ],
                  ),
                )
              ],
            ));
      },
    ));
  }
}
