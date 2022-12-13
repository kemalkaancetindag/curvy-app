import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsModalSwitchColumn extends StatelessWidget {
  final void Function()? function;
  final String title;
  final String text;
  final bool isSwitch;
  final bool? switchState;
  final Function(bool)? switchOnChanged;

  SettingsModalSwitchColumn({super.key, required this.title, required this.text, required this.isSwitch, this.function, this.switchOnChanged, this.switchState});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? function : null,
      child: Container(
      margin: EdgeInsets.only(top: Dimensions.h12, bottom: Dimensions.h12),
      padding: EdgeInsets.only(left: Dimensions.w2*10, right: Dimensions.w2*10),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Dimensions.w120+Dimensions.w8,
                  child: Center(
                    child:  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.h100/5,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  )
                ),
                isSwitch ? CupertinoSwitch(
                  value: switchState ?? true, 
                  onChanged: (value){
                    if(switchOnChanged != null){
                      switchOnChanged!(value);
                    }
                    
                  }
                  ) : 
                  Container(
                  child: Center(
                    child: Image.asset("assets/images/settings_modal_chevron_right.png"),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Dimensions.h8),
            child: Center(
              child: Text(
                text,
                 style: TextStyle(
                      color: Colors.white,
                      
                    ),
              ),
            ),
          )
        ],
      ),

    ),
    );
  }
}