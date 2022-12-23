import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/ui/widgets/matcher_style_user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MatcherStyle extends StatelessWidget {
  MatcherStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatcherController>(builder: (controller) {
      if (Get.find<ExpandedMatcherStyleController>().user == null) {        
        return controller.cards != null ?  Stack(          
              children: controller.cards!,
            ) : Container();
      }

      return GetBuilder<ExpandedMatcherStyleController>(
        builder: (controller){
          return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
               GestureDetector(                
                onPanDown: (details){
                  controller.carouselController(details.globalPosition.dx);
                },
                child:  Container(
                  margin: EdgeInsets.only(top: Dimensions.h42),
                  height: Dimensions.h520,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: controller.imageCarousel ?? []
                  ),
                ),
               ),
                Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.h14, bottom: Dimensions.h16),
                    padding: EdgeInsets.only(
                        left: Dimensions.w17, right: Dimensions.w17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Dimensions.w120 / 10,
                              height: Dimensions.h12,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.h12 / 2),
                                  color: Color(0xFF05ED00)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.w8 / 2),
                              child: Center(
                                child: Text(
                                  "${controller.user!.name!.split(" ")[0]},${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                                  style: TextStyle(
                                      color: Colors.black,
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
                        Container(
                            margin: EdgeInsets.only(top: Dimensions.h16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: Dimensions.w8),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/home_icon.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "İstanbul, Bakırköy, İncirli",
                                    style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h16),
                                  )),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: Dimensions.h12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: Dimensions.w8),
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/location_icon.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                      child: Text(
                                    "${controller.distance ?? ""} km uzaklıkta",
                                    style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h16),
                                  )),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h16),
                          child: Text(
                            "HAKKIMDA",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h8),
                          child: Text(
                            controller.user!.about!,
                            style: TextStyle(color: Color(0xFF7B8491)),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  width: 340,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.w17, right: Dimensions.w17),
                    margin: EdgeInsets.only(top: Dimensions.h16),
                    child: Row(
                      children: [
                        Text(
                          "İLGİ ALANLARIM",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: Dimensions.h21),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: Dimensions.h16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Dimensions.w155,
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.4),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/camera.png"),
                                      Text(
                                        "Photography",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Dimensions.h16),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: Dimensions.w155,
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.4),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/camera.png"),
                                      Text(
                                        "Photography",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Dimensions.h16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                          bottom:
                              BorderSide(color: Color(0xFFC5C5C7), width: 1))),
                  width: 340,
                  height: Dimensions.h120,
                  child: Column(
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            primary: Colors.black.withOpacity(0.2),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Profili Paylaş",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 340,
                        height: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.white,
                            primary: Colors.black.withOpacity(0.2),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Profili Paylaş",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.h27, bottom: Dimensions.h27),
                  width: 340,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(52 / 2),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.25))
                            ]),
                        child: Center(
                          child: Image.asset("assets/images/matcher_back.png"),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.25))
                            ]),
                        child: Center(
                          child:
                              Image.asset("assets/images/matcher_dislike.png"),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.25))
                            ]),
                        child: Center(
                          child: Image.asset(
                              "assets/images/matcher_superlike.png"),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.25))
                            ]),
                        child: Center(
                          child: Image.asset("assets/images/matcher_like.png"),
                        ),
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(52 / 2),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(0.25))
                            ]),
                        child: Center(
                          child: Image.asset("assets/images/matcher_turbo.png"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
        }
      ) ;
    });
  }
}
