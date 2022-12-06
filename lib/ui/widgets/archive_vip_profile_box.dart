import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveVipProfileBox extends StatelessWidget {
  const ArchiveVipProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.w17 * 10,
        height: Dimensions.h230,       
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.h8),
                        topRight: Radius.circular(Dimensions.h8),
                        bottomLeft: Radius.circular(Dimensions.h8),
                        bottomRight: Radius.circular(Dimensions.h50 / 2),
                      ),
                      image: DecorationImage(
                          image: AssetImage("assets/images/women.png"),
                          fit: BoxFit.cover))),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.h8),
                        topRight: Radius.circular(Dimensions.h8),
                        bottomLeft: Radius.circular(Dimensions.h8),
                        bottomRight: Radius.circular(Dimensions.h50 / 2),
                      ),
                      gradient: LinearGradient(
                          stops: [0, 1],
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.h100 / 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.w8 / 2),
                                          height: Dimensions.h8,
                                          width: Dimensions.h8,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.h8 / 2),
                                              color: Color(0xFF05ED00)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.w8 / 2),
                                          child: Center(
                                            child: Text(
                                              "Gülçitay,21",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h16),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Image.asset(
                                                "assets/images/confirm_small.png"),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.w8 / 2),
                                      child: Center(
                                        child: Text(
                                          "13 saat sonra kaldirilacak",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.h16 / 2,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: Dimensions.h31,
                                width: Dimensions.h31,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h31 / 2),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF4AB0EB),
                                      Color(0xFF00FFE1),
                                    ])),
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/archives_superlike.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ],
        ));
  }
}
