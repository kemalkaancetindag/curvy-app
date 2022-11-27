import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/setup_showme.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:curvy_app/ui/widgets/sexual_preference_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupSexualPreferenceScreen extends StatelessWidget {
  const SetupSexualPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: Dimensions.w48, right: Dimensions.w48),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Dimensions.w200,
                      child: BlackBoldHeader(text: "Cinsel Yönelimin"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "3 adet seçim yapabilirsin",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: Dimensions.h16),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SexualPreferenceSelect(
                  text: "Heteroseksüel",
                  isSelected: true,
                ),
                SexualPreferenceSelect(
                  text: "Gey",
                  isSelected: false,
                ),
                SexualPreferenceSelect(
                  text: "Lezbiyen",
                  isSelected: false,
                ),
                SexualPreferenceSelect(
                  text: "Biseksüel",
                  isSelected: false,
                ),
                SexualPreferenceSelect(
                  text: "Aseksüel",
                  isSelected: false,
                ),
                SexualPreferenceSelect(
                  text: "Demiseksüel",
                  isSelected: false,
                ),
                SexualPreferenceSelect(
                  text: "Panseksüel",
                  isSelected: true,
                ),
                SexualPreferenceSelect(
                  text: "Heteroseksüel",
                  isSelected: true,
                ),
                SexualPreferenceSelect(
                  text: "Sorguluyor",
                  isSelected: false,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.h7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cinsel yönelimimi gizle",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold),
                      ),
                      CupertinoSwitch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                GradientButton(text: "DEVAM ET", page: "showme",)
              ],
            )
          ],
        ),
      ),
    );
  }
}
