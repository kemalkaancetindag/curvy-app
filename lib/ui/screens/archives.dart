import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/archives_controller.dart';
import 'package:curvy_app/ui/widgets/archive_liked.dart';
import 'package:curvy_app/ui/widgets/archive_likes.dart';
import 'package:curvy_app/ui/widgets/archive_vip_profiles.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ArchivesScreen extends StatelessWidget {
  const ArchivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArchivesController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, Dimensions.h165),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.h60, bottom: Dimensions.h100 / 10),
                  child: Center(
                    child: Image.asset("assets/images/archives_logo.png"),
                  ),
                ),
                CustomPaint(
                  child: Container(
                    width: Dimensions.w325 + Dimensions.w300 / 10,
                    height: Dimensions.h50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setPan(0);
                          },
                          child: Container(
                              width: Dimensions.w111,
                              height: Dimensions.h36,
                              decoration: BoxDecoration(
                                  gradient: controller.currentIndex == 0
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xFFD51CFF),
                                            Color(0xFF00FFE1)
                                          ],
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 5),
                                  color: controller.currentIndex == 0
                                      ? null
                                      : Color(0xFFC5C5C7)),
                              child: Center(
                                child: Text(
                                  "VIP Profiller",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setPan(1);
                          },
                          child: Container(
                              width: Dimensions.w111,
                              height: Dimensions.h36,
                              decoration: BoxDecoration(
                                  color: controller.currentIndex == 1
                                      ? null
                                      : Color(0xFFC5C5C7),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 5),
                                  gradient: controller.currentIndex == 1
                                      ? LinearGradient(
                                          colors: [
                                            Color(0xFFD51CFF),
                                            Color(0xFF00FFE1)
                                          ],
                                        )
                                      : null),
                              child: Center(
                                child: Text(
                                  "Beğenenler",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setPan(2);
                          },
                          child: Container(
                              width: Dimensions.w111,
                              height: Dimensions.h36,
                              decoration: BoxDecoration(
                                  gradient: controller.currentIndex == 2
                                      ? LinearGradient(colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF00FFE1)
                                        ])
                                      : null,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 5),
                                  color: controller.currentIndex == 2
                                      ? null
                                      : Color(0xFFC5C5C7)),
                              child: Center(
                                child: Text(
                                  "Beğenilenler",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  painter: SwitchPainter(),
                )
              ],
            ),
          ),
        ),
        body: controller.pans[controller.currentIndex],
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}

class SwitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = 25.0;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      Radius.circular(r),
    );
    var paint1 = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
          .createShader(Rect.fromCenter(
              center: Offset(w / 2, h / 2), width: w, height: h))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(fullRect, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
