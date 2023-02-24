import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TagWidget extends StatelessWidget {
  String text;
  
  TagWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w120 + Dimensions.w9,
      height: Dimensions.h52,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: Dimensions.h9/3),
        borderRadius: BorderRadius.circular(Dimensions.h16)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: Dimensions.h22,
            fontWeight: FontWeight.w800
          ),
        ),
      ),

    );
  }
}