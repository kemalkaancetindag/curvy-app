import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurvyPlusRow extends StatelessWidget {
  String text;

  CurvyPlusRow({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.h100/2, bottom: Dimensions.h100/10),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.w17),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF7B8491),
              fontSize: Dimensions.h14,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            width: Dimensions.w111,
            height: Dimensions.h300/10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h50),
              gradient: LinearGradient(                
                colors: [
                  Color(0xFFD51CFF),
                  Color(0xFF6198EF)
                ]
              )
            ),
            child: Center(
              child: Text(
                "CurvyPLUS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.h14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}