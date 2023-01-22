import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SimpleButton extends StatelessWidget {
  String text;
  LinearGradient? gradient;
  int buttonID;
  Function(int? buttonID) setTappedButton;
  Function? actionFunction;
  bool isTapped;
  bool? isQuit;
  SimpleButton({
    super.key,
    required this.text,
    this.gradient,
    required this.buttonID,
    required this.setTappedButton,
    required this.isTapped,
    this.isQuit,
    this.actionFunction
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(isQuit != null){
          actionFunction!();
          return;
        }
        Get.toNamed(Routes.deleteAccountLastChance);
      },
      onPanDown: (details){
        setTappedButton(buttonID);
      },
      onPanCancel: (){
        setTappedButton(null);
      },
      onPanEnd: (details){
        setTappedButton(null);
      },
      child: Container(
      width: double.maxFinite,
      height: Dimensions.h50,
      decoration: BoxDecoration(
        gradient: gradient != null ? gradient : null  ,
        color: !isTapped ? (gradient == null ? Colors.white : null) : Colors.black.withOpacity(0.4),
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
    ),
    );
  }
}