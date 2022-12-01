import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.h87 - 4,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTapDown: (details){
              
            },
            onTap: () {
              
            },
            child: Container(
                width: Dimensions.w60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_first.png"),
                )),
          ),
          GestureDetector(
            child: Container(
                width: Dimensions.w60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_second.png"),
                )),
          ),
          GestureDetector(
            child: Container(
                width: Dimensions.w60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_middle.png"),
                )),
          ),
          GestureDetector(
            child: Container(
                width: Dimensions.w60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_fourth.png"),
                )),
          ),
          GestureDetector(
            child: Container(
                width: Dimensions.w60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_last.png"),
                )),
          )
        ],
      ),
    );
  }
}
