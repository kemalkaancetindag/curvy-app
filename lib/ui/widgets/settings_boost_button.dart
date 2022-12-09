import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsBoostButton extends StatelessWidget {
  final LinearGradient background;
  final String icon;
  final String text;
  SettingsBoostButton({super.key, required this.background, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w310,
      height: Dimensions.h60,
      margin: EdgeInsets.only(top: Dimensions.h100/10),
      decoration: BoxDecoration(
        gradient: background,
        borderRadius: BorderRadius.circular(Dimensions.h52)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Container(
            margin: EdgeInsets.only(right: Dimensions.w8),
            child: Center(
              child: Image.asset(icon),
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: Dimensions.h22,
                fontWeight: FontWeight.bold
              ),
              text: "Curvy",
              children: [
                TextSpan(
                  text:text,
                  style: TextStyle(
                    color: Colors.white,

                  )

                )
              ]
            )
          )
        ],
      ),
    );
  }
}