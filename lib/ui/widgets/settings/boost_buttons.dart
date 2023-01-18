import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BoostButtons extends StatelessWidget {
  LinearGradient backgroundGradient;
  String packageName;
  String packageIcon;
  double marginTop;
  BoostButtons({
    super.key,
    required this.backgroundGradient,
    required this.packageName,
    required this.packageIcon,
    required this.marginTop
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      width: Dimensions.w310,
      height: Dimensions.h7*10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.h50),
        gradient: backgroundGradient
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Dimensions.h50,
            height: Dimensions.h50,
            margin: EdgeInsets.only(right: Dimensions.w11),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(packageIcon),
                fit: BoxFit.contain
              )
            ),
          ),
          Text(
            packageName,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.h27,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),

    );
  }
}