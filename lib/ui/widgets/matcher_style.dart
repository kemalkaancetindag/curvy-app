import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
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
      if (!controller.isMatcherStyleExpanded) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/images/women.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(Dimensions.h12),
          ),
          child: Stack(
            children: [
              Positioned(
                  left: Dimensions.w31,
                  top: Dimensions.h21 - 2,
                  child: Container(
                    width: Dimensions.w300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: Dimensions.w300 / 5,
                            height: Dimensions.h60 / 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h50 / 10)),
                            child: Center(
                              child: Container(
                                height: Dimensions.h21 / 10,
                                width: Dimensions.w300 / 5 / 1.1,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0xFFD51CFF),
                                  Color(0xFF6198EF)
                                ])),
                              ),
                            )),
                        Container(
                          width: Dimensions.w300 / 5,
                          height: Dimensions.h60 / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 10)),
                        ),
                        Container(
                          width: Dimensions.w300 / 5,
                          height: Dimensions.h60 / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 10)),
                        ),
                        Container(
                          width: Dimensions.w300 / 5,
                          height: Dimensions.h60 / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 10)),
                        )
                      ],
                    ),
                  )),
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
              Positioned(
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
                                    margin: EdgeInsets.only(
                                        left: Dimensions.w8 / 2),
                                    child: Center(
                                      child: Text(
                                        "Gülçitay,21",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h36,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: Dimensions.w8),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/confirm_icon.png"),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    controller.setExpansion(true);
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
                        Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h7, bottom: Dimensions.h17),
                            width: Dimensions.w300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/matcher_back.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/matcher_dislike.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/matcher_superlike.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/matcher_like.png"),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/matcher_turbo.png"),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        );
      }

      return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h42),
                  height: Dimensions.h520,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      image: DecorationImage(
                          image: AssetImage("assets/images/women.png"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: Dimensions.w31,
                          top: Dimensions.h21 - 2,
                          child: Container(
                            width: Dimensions.w300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width: Dimensions.w300 / 5,
                                    height: Dimensions.h60 / 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h50 / 10)),
                                    child: Center(
                                      child: Container(
                                        height: Dimensions.h21 / 10,
                                        width: Dimensions.w300 / 5 / 1.1,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF6198EF)
                                        ])),
                                      ),
                                    )),
                                Container(
                                  width: Dimensions.w300 / 5,
                                  height: Dimensions.h60 / 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 10)),
                                ),
                                Container(
                                  width: Dimensions.w300 / 5,
                                  height: Dimensions.h60 / 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 10)),
                                ),
                                Container(
                                  width: Dimensions.w300 / 5,
                                  height: Dimensions.h60 / 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 10)),
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          top: Dimensions.h50,
                          left: Dimensions.w31,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: Dimensions.h16),
                                child: Center(
                                  child:
                                      Image.asset("assets/images/report.png"),
                                ),
                              ),
                              Container(
                                  child: Center(
                                child: Image.asset("assets/images/share.png"),
                              ))
                            ],
                          )),
                      
                     
                      Positioned(
                          bottom: -25,
                          right: 25,
                          child: GestureDetector(
                            
                            onTap: () {
                              Get.find<MatcherController>().setExpansion(false);
                            },
                            child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(colors: [
                                  Color(0xFFD51CFF),
                                  Color(0xFF6198EF)
                                ])),
                            child: Center(
                              child:
                                  Image.asset("assets/images/expand_icon.png"),
                            ),
                          ),
                          ))
                    ],
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
                                  "Gülçitay,21",
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
                                    "3 km uzaklıkta",
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
                            "Samimi doğru dürüst bir birliktelik seviyeli bir ilişki arıyanlar uzak dursun fuckbuddy mantığını ve kültürünü çözmüş zaman mekan sıkıntısı olmayan en az 28 orjinal kendi dişi olan arkadaşlar yazsın. Bu tanımlamaya uymayanları direkt engellerim.",
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
    });
  }
}
