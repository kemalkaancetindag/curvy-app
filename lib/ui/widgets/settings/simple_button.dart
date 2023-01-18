import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SimpleButton extends StatelessWidget {
  String text;
  LinearGradient? gradient;
  SimpleButton({
    super.key,
    required this.text,
    this.gradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.h50,
      decoration: BoxDecoration(
        gradient: gradient != null ? gradient : null  ,
        color: gradient == null ? Colors.white : null,
        border: Border(
          top: BorderSide(color: Color(0xFFC5C5C7), width:1),
          bottom: BorderSide(color: Color(0xFFC5C5C7), width:1)
        )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: gradient == null ? Colors.black : Colors.white,
            fontSize: Dimensions.h16,
            fontWeight: FontWeight.bold
          ),

        ),
      ),
    );
  }
}