import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:curvy_app/ui/widgets/free_style.dart';
import 'package:curvy_app/ui/widgets/matcher_style.dart';
import 'package:curvy_app/ui/widgets/matching/new_matcher_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MatchingScreen extends StatelessWidget {
  MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NewMatcherController(recommendationService: Get.find(), matchService: Get.find(), sharedPreferenceService: Get.find(), firestoreService: Get.find()));
    


    return GetBuilder<NewMatcherController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: Get.find<ExpandedMatcherStyleController>().user != null
            ? null
            : PreferredSize(
                preferredSize: Size(
                    double.maxFinite, Dimensions.h120 - Dimensions.h100 / 10),
                child: Container(
                    margin: EdgeInsets.only(top: Dimensions.h50 / 2),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: Dimensions.w320,
                            height: Dimensions.h50,
                            child: CustomPaint(
                                painter: StyleChangerContainer(),
                                child: GetBuilder<NewMatcherController>(
                                  builder: (controller) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.setIsMatcherStyle(false);
                                          },
                                          child: Container(
                                            width: controller.isMatcherStyle
                                                ? Dimensions.w11*10
                                                : Dimensions.w180,
                                            height: Dimensions.h36,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.h27),
                                                gradient: !controller.isMatcherStyle
                                                    ? LinearGradient(colors: [
                                                        Color(0xFFD51CFF),
                                                        Color(0xFF00FFE1)
                                                      ])
                                                    : null,
                                                color: !controller.isMatcherStyle
                                                    ? null
                                                    : Color(0xFFC5C5C7)),
                                            child: Center(
                                              child: Text(
                                                "FreeStyle",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                               controller.setIsMatcherStyle(true);                                         
                                            },
                                            child: Container(
                                              width: controller.isMatcherStyle
                                                  ? Dimensions.w180
                                                  : Dimensions.w11*10,
                                              height: Dimensions.h36,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.h27),
                                                  gradient: controller
                                                          .isMatcherStyle
                                                      ? LinearGradient(colors: [
                                                          Color(0xFFD51CFF),
                                                          Color(0xFF00FFE1)
                                                        ])
                                                      : null,
                                                  color: controller.isMatcherStyle
                                                      ? null
                                                      : Color(0xFFC5C5C7)),
                                              child: Center(
                                                child: Text(
                                                  "MatcherStyle",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ))
                                      ],
                                    );
                                  },
                                ))),
                        GestureDetector(
                          onPanDown: (details) {
                            controller.tappedButtonAnimation(6);
                          },
                          onPanCancel: () {
                            controller.tappedButtonAnimation(null);
                          },
                          onTap: () {
                            Get.toNamed(Routes.matcherSettings);
                          },
                          child: Container(                            
                            width: controller.tappedButton == 6 ? Dimensions.h31/1.2 : Dimensions.h31,
                            height: controller.tappedButton == 6 ? Dimensions.h31/1.2 : Dimensions.h31,                           
                            child: Center(
                              child: SvgPicture.asset("assets/svg/matcher/matcher_settings.svg"),
                            ),
                          ),
                        )
                      ],
                    ))),
        body: GetBuilder<NewMatcherController>(
          builder: (controller) {
            if (controller.isMatcherStyle) {
              return NewMatcherStyle();  
            }
            return FreeStyle();

            
          },
        ),
      );
    });
  }
}

class StyleChangerContainer extends CustomPainter {
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
