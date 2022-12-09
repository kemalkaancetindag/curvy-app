import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

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
                margin: EdgeInsets.only(
                    right: Dimensions.w11, left: Dimensions.w8 / 2),
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
                            children: [
                              Container(
                                width: Dimensions.h8,
                                height: Dimensions.h8,
                                margin: EdgeInsets.only(
                                    left: Dimensions.w35,
                                    right: Dimensions.w8 / 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h8 / 2),
                                    color: Color(0xFF05ED00)),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Dimensions.w8 / 2),
                                child: Center(
                                    child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.h16),
                                      children: [
                                        TextSpan(
                                            text: "Gülçitay,",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        TextSpan(text: "21")
                                      ]),
                                )),
                              ),
                              Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/confirm_small.png"),
                                ),
                              )
                            ],
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: Dimensions.w31),
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/chat_chip.png"),
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Dimensions.w2 * 10),
                                child: Center(
                                  child: Text(
                                    "124",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.h16),
                                  ),
                                ),
                              )
                            ],
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
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsets.only(
                left: Dimensions.w8 * 2, right: Dimensions.w8 * 2),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.h16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.h8,
                                bottom: Dimensions.h8,
                                right: Dimensions.w8,
                                left: Dimensions.w8),
                            width: Dimensions.w200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h16),
                                color: Color(0xFFE4E4E4)),
                            child: Center(
                              child: Text(
                                "Merhaba?",
                                style: TextStyle(fontSize: Dimensions.h16),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: Dimensions.w11),
                            child: Center(
                              child: Image.asset("assets/images/chat_like.png"),
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.h16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.w11),
                            child: Center(
                              child:
                                  Image.asset("assets/images/chat_unliked.png"),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.h8,
                                bottom: Dimensions.h8,
                                right: Dimensions.w8,
                                left: Dimensions.w8),
                            width: Dimensions.w200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h16),
                                gradient: LinearGradient(colors: [
                                  Color(0xFFD51CFF),
                                  Color(0xFF6198EF)
                                ])),
                            child: Center(
                              child: Text(
                                "Teşekkür ederim? Mesainin bitmesi için vakit öldürüyorum. Sen?",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: Dimensions.h16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
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
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      child: Center(
                        child: Image.asset("assets/images/chat_add_white.png"),
                      ),
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
                          margin: EdgeInsets.only(
                              left: Dimensions.w8, right: Dimensions.w8),
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
