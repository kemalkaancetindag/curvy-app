import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SexualPreferenceSelect extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SexualPreferenceSelect({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w200,
      margin: EdgeInsets.only(bottom: Dimensions.h16),
      child: Row(
        children: [
          isSelected ?  Container(
            width: Dimensions.w22,
            height: Dimensions.h22,
            margin: EdgeInsets.only(right: Dimensions.w11),
            child: Center(
              child: Image.asset("assets/images/tick_icon.png"),
            ),
          ) :  Container(
            width: Dimensions.w22,
            height: Dimensions.h22,
            margin: EdgeInsets.only(right: Dimensions.w11),
           
          )
         ,
          Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.h22,
              color: Colors.black.withOpacity(0.4)
            ),
          )
        ],
      ),
    );
  }
}