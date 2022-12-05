import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, Dimensions.h140),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.h16),
                  bottomRight: Radius.circular(Dimensions.h16)),
              gradient: LinearGradient(
                  colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
          width: Dimensions.w35 * 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: Dimensions.w11),
                child: Center(
                  child: Image.asset("assets/images/chevron_left_white.png"),
                ),
              ),
              Container(
                height: Dimensions.h8 * 10,
                width: Dimensions.w316,
                child: Stack(
                  children: [
                    Positioned(
                        left: Dimensions.w2 * 20,
                        top: Dimensions.h8 / 2.2,
                        child: Container(
                          width: Dimensions.w254,
                          height: Dimensions.h300 / 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h8 * 5)),
                          child: Row(
                            children: [],
                          ),
                        )),
                    Positioned(
                        left: Dimensions.w2 * 20,
                        bottom: Dimensions.h8 / 2.2,
                        child: Container(
                          width: Dimensions.w140,
                          height: Dimensions.h300 / 10,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h8 * 5),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: Row(
                            children: [],
                          ),
                        )),
                    Positioned(
                        child: Container(
                      width: Dimensions.h8 * 10,
                      height: Dimensions.h8 * 10,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h8 * 10 / 2),
                          border: Border.all(width: 2, color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage("assets/images/women.png"),
                              fit: BoxFit.cover)),
                    )),
                    Positioned(
                        right: 0,
                        bottom: (Dimensions.h8 / 2.2) + (Dimensions.h300 / 35),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: Dimensions.w8),
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/location_white.png"),
                                ),
                              ),
                              Text(
                                "6 km uzaklıkta",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: Dimensions.h8 * 10,
                width: Dimensions.w8 * 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Center(
                        child: Image.asset("assets/images/report.png"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.h8 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.h16),
                      topRight: Radius.circular(Dimensions.h16)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: Image.asset("assets/images/chat_add_white.png"),
                    ),
                  ),
                  Container(
                    width: Dimensions.w270 + Dimensions.w17,
                    height: Dimensions.h27,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.h300 / 10)),
                    child: Stack(
                      children: [
                        Positioned(
                            right: Dimensions.w8,
                            top: Dimensions.h8 / 2,
                            child: Container(
                              child: Center(
                                child:
                                    Image.asset("assets/images/chat_mic.png"),
                              ),
                            )),
                        Positioned(
                            child: Container(
                              margin: EdgeInsets.only(left: Dimensions.w8, right: Dimensions.w8),
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Image.asset("assets/images/chat_send.png"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
