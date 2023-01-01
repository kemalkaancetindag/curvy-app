import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HubFoundWidget extends StatelessWidget {
  const HubFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF000000),
        Color(0xFF2E2B2B),
        Color(0xFF000000),
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: (Dimensions.h50 * 10) + (Dimensions.h230),
            width: Dimensions.w35 * 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                gradient: LinearGradient(
                    colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w42),
                        child: Text(
                          "Bu Gece Eğlenelim",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h230 / 10),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w300 / 10),
                        child: Image.asset("assets/images/hub_close_icon.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                  width: double.maxFinite,
                  height: Dimensions.h60 * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/women.png"),
                                    fit: BoxFit.fill)),
                          )),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: Dimensions.h100,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black,
                                Colors.transparent,
                              ])),
                        ),
                      ),
                      Positioned(
                          bottom: Dimensions.h7 * 13,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: Dimensions.h8,
                                            height: Dimensions.h8,
                                            margin: EdgeInsets.only(
                                                left: Dimensions.w11,
                                                right: Dimensions.w9),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.h8 / 2),
                                                color: Color(0xFF05ED00)),
                                          ),
                                          Container(
                                            child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          Dimensions.h16 * 2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  text: "Gülçitay,",
                                                  children: [
                                                    TextSpan(
                                                        text: "21",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: Dimensions
                                                                    .h230 /
                                                                10))
                                                  ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Wrap(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: Dimensions.w8),
                                            child: Center(
                                              child: Image.asset(
                                                  "assets/images/location_white.png"),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "10km uzaklıkta",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Image.asset(
                                          "assets/images/expand_icon.png"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: Dimensions.h12,
                          child: Container(
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            ),
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          top: Dimensions.h22,
                          child: Container(
                            width: Dimensions.w300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: Dimensions.w300 / 3,
                                  height: Dimensions.h7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 10)),
                                  child: Center(
                                    child: Container(
                                      width: (Dimensions.w300 / 3) / 1.1,
                                      height: Dimensions.h7 / 1.3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h8 / 4),
                                          gradient: LinearGradient(colors: [
                                            Color(0xFFD51CFF),
                                            Color(0xFF6198EF)
                                          ])),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Dimensions.w300 / 3,
                                  height: Dimensions.h7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 10)),
                                  child: Center(
                                    child: Container(
                                      width: (Dimensions.w300 / 3) / 1.1,
                                      height: Dimensions.h7 / 1.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h8 / 4),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                     Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: Dimensions.h27,
                                  child: Center(
                                    child: Image.asset("assets/images/curvy_chip_dialog.png"),
                                  ),
                                ),
                                Container(
                                  height: Dimensions.h27,
                                  child: Center(
                                    child: Text(
                                      "CurvyCHIP",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.h21,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: Dimensions.h16),
                                  height: Dimensions.h27,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: Dimensions.h8/2, horizontal: Dimensions.w11/2),
                                        child: Container(      
                                          margin: EdgeInsets.only(right: Dimensions.w50),                                    
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(Dimensions.h7)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "168",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h9
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: Dimensions.w200/10),
                                  child: Center(
                                    child: Image.asset("assets/images/chevron_bottom.png")
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                     )
                    ],
                  ),
                ),
                Container(
                  width: Dimensions.w320+Dimensions.w16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.w270,
                        height: Dimensions.h27,                                              
                        child: TextField(                                                    
                          decoration: InputDecoration(

                            filled: true,
                            fillColor: Colors.white,  
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Bir mesaj yaz",
                            hintStyle: TextStyle(
                              color: Color(0xFFC5C5C7),
                              
                            )
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Image.asset("assets/images/chat_send.png"),
                        ),
                      )

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
