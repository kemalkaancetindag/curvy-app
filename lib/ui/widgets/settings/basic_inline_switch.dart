import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasicInlineSwitch extends StatelessWidget {
  String settingName;
  bool switchState;
  Function(bool state) actionFunction;

  BasicInlineSwitch({
    super.key,
    required this.settingName,
    required this.switchState,
    required this.actionFunction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.w17),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            settingName,
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.h16,
              fontWeight: FontWeight.bold
            ),
          ),
          CupertinoSwitch(
               thumbColor: Colors.white,
            activeColor: Color(0xFFD51CFF),
            value: switchState, 
            onChanged: (value){
              actionFunction(value);
            }
          )
        ],
      ),
    );
  }
}