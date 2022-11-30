import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/setup_showme.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:curvy_app/ui/widgets/sexual_preference_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
            GetBuilder<SetupController>(builder: ((controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(0);
                    },
                    child: SexualPreferenceSelect(
                      text: "Heteroseksüel",
                      isSelected: controller.sexPreference.contains(0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(1);
                    },
                    child: SexualPreferenceSelect(
                      text: "Gey",
                      isSelected: controller.sexPreference.contains(1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(2);
                    },
                    child: SexualPreferenceSelect(
                      text: "Lezbiyen",
                      isSelected: controller.sexPreference.contains(2),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(3);
                    },
                    child: SexualPreferenceSelect(
                      text: "Biseksüel",
                      isSelected: controller.sexPreference.contains(3),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(4);
                    },
                    child: SexualPreferenceSelect(
                      text: "Aseksüel",
                      isSelected: controller.sexPreference.contains(4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(5);
                    },
                    child: SexualPreferenceSelect(
                      text: "Demiseksüel",
                      isSelected: controller.sexPreference.contains(5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(6);
                    },
                    child: SexualPreferenceSelect(
                      text: "Panseksüel",
                      isSelected: controller.sexPreference.contains(6),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(7);
                    },
                    child: SexualPreferenceSelect(
                      text: "Heteroseksüel",
                      isSelected: controller.sexPreference.contains(7),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.controlSexPreference(8);
                    },
                    child: SexualPreferenceSelect(
                      text: "Sorguluyor",
                      isSelected: controller.sexPreference.contains(8),
                    ),
                  )
                ],
              );
            })),
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
                      GetBuilder<SetupController>(builder: (controller) {
                        return CupertinoSwitch(
                          value: controller.showSexPreference,
                          onChanged: (value) {
                            controller.setShowSexPreference(value);
                          },
                        );
                      })
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SetupShowmeScreen());
                  },
                  child: GradientButton(
                    text: "DEVAM ET",
                    page: "showme",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
