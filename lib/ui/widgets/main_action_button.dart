import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainActionButton extends StatelessWidget {
  final String text;
  final String icon;
  int? id;
  int? currentButton;
  MainActionButton({super.key, required this.text, required this.icon, this.id, this.currentButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: Dimensions.w155,
      height: Dimensions.h8 * 10,
      margin: EdgeInsets.only(bottom: Dimensions.h100 / 10, left:currentButton == id ? Dimensions.w2*10 : 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.h90),
              bottomLeft: Radius.circular(Dimensions.h90)),
          gradient: LinearGradient(
              colors: [Color(0xFFE3E3E3), Color(0xFFAAAAE3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Dimensions.w42,
            height: Dimensions.h42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h42 / 2),
                color: Color(0xFFF7F7F7)),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          Container(
            width: Dimensions.w50,
            child: Center(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: Dimensions.h14,
              ),
            )),
          )
        ],
      ),
    );
  }
}
