import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurvyPlusSelect extends StatelessWidget {
  bool selectState;
  String text;
  String infoText;
  CurvyPlusSelect({
    super.key,
    required this.text,
    required this.selectState,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.w17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h12),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.h16
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.h12),
                  child: Text(
                    infoText,
                    style: TextStyle(
                      color: Color(0xFF7B8491),
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.h12
                    ),
                  ),
                )
              ],
            ),
          ),
          selectState ? 
          Container(
            margin: EdgeInsets.only(right: Dimensions.w17),
            child: Image.asset("assets/images/settings_tick_icon.png"),
          ): Container()
        ],
      ),
    );
  }
}