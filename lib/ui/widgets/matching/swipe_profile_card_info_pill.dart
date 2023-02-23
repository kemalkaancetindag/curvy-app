import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SwipeProfileCardInfoPill extends StatelessWidget {
  bool isSame;
  String text;

  SwipeProfileCardInfoPill(
      {super.key, required this.isSame, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.w11, vertical: Dimensions.h60/10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h12*2),
              color: !isSame ? Colors.white.withOpacity(0.25) : null,
              gradient: isSame ? LinearGradient(
                colors: [
                  Color(0xFFD51CFF).withOpacity(0.5),
                  Color(0xFF00FFE1).withOpacity(0.5)
                ] 
              ) : null
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.w11, vertical: Dimensions.h12/4),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.h21
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
