import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonTypeDialogButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int personalityType;
  final Function(int) select;
  PersonTypeDialogButton(
      {super.key, required this.text, required this.isSelected, required this.personalityType, required this.select});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        select(personalityType);
      },
      child: Container(
      margin: EdgeInsets.only(bottom: Dimensions.h90/5),
      width: Dimensions.w8 * 10,
      height: Dimensions.h50 / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.h300/10),
          gradient: isSelected ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.transparent,
            Colors.transparent,
            Colors.white
          ]) : null),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
    );
  }
}
