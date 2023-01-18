import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingHeader extends StatelessWidget {
  String settingName;
  SettingHeader({
    super.key,
    required this.settingName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,      
  child: Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: Dimensions.h50/2, left: Dimensions.w17, bottom: Dimensions.h100/10),
        child: Text(
          settingName,
          style: TextStyle(
            color: Color(0xFF7B8491),
            fontSize: Dimensions.h14
          ),
        ),
      )
    ],
  ),
    );
  }
}