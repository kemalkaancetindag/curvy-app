import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ColumnSwitch extends StatelessWidget {
  String settingName;
  bool switchState;
  String settingInfo;
  Function(bool state) actionFunction;
  ColumnSwitch({
    super.key,
    required this.settingName,
    required this.settingInfo,
    required this.switchState,
    required this.actionFunction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.w17),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  settingName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.h16,
                    fontWeight: FontWeight.bold,                    
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
          ),
          Container(
            margin: EdgeInsets.only(bottom: Dimensions.h9, top: Dimensions.h9),
            child: Text(
              settingInfo,
              style: TextStyle(
                color: Color(0xFF7B8491),
                fontSize: Dimensions.h14,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}