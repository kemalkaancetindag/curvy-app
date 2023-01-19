import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsModalSwitchRow extends StatelessWidget {
  final String title;
  final String text;
  final Function(bool) switchOnChange;
  final bool switchState;
  SettingsModalSwitchRow({super.key, required this.title, required this.text, required this.switchOnChange, required this.switchState});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.h12, bottom: Dimensions.h12),
      width: double.maxFinite,
      
      padding: EdgeInsets.only(left: Dimensions.w2*10,right: Dimensions.w2*10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.h8/2),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.h100/5
                      ),
                    ),
                  ),
                ),
                 Container(
                  width: Dimensions.w11*10,
                  child: Text(
                      text,
                       style: TextStyle(
                        color: Colors.white,
                     
                       
                      ),
                    ),
                )
              ],
            ),
          ),
          Container(
            child: CupertinoSwitch(
              value: switchState,
              onChanged: (value) {
                switchOnChange(value);
              },
            ),
          )
        ],
      ),
    );
  }
}