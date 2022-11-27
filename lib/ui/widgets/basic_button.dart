import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const BasicButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      width: Dimensions.w314,
      height: Dimensions.h50,
      margin: EdgeInsets.only(bottom: Dimensions.h22),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Color(0XFFD446F4) : Colors.black.withOpacity(0.4), width: 3),
        borderRadius: BorderRadius.circular(Dimensions.w25)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Color(0XFFD446F4) : Colors.black.withOpacity(0.4),
            fontSize: Dimensions.h22,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}