import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveLikedBox extends StatelessWidget {
  const ArchiveLikedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w111,
      height: Dimensions.h148,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h8),
                    image: DecorationImage(
                        image: AssetImage("assets/images/women.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h8),
                  gradient: LinearGradient(
                      stops: [0, 1],
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.w8, right: Dimensions.w8 / 2),
                          width: Dimensions.h8 / 2,
                          height: Dimensions.h8 / 2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h8 / 4),
                              color: Color(0xFF05ED00)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: Text(
                              "Gülçitay, 21",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h100 / 10),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child:
                                Image.asset("assets/images/confirm_small.png"),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.h8 / 2, bottom: Dimensions.h8 / 2),
                      child: SizedBox(
                        height: 1,
                        width: Dimensions.w111 / 1.2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        width: Dimensions.w111 / 1.2,
                        child: Text(
                          "Antalya konumundan, 500m uzakta, şuan online.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white, fontSize: Dimensions.h8),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
