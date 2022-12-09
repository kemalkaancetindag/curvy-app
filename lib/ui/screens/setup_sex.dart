import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/widgets/basic_button.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SetupSexScreen extends StatelessWidget {
  SetupSexScreen({super.key});

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
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlackBoldHeader(text: "Cinsiyetin"),
            GetBuilder<SetupController>(builder: ((controller) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setSex(0);
                    },
                    child: BasicButton(
                      text: "KADIN",
                      isSelected: controller.sex == 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setSex(1);
                    },
                    child: BasicButton(
                      text: "ERKEK",
                      isSelected: controller.sex == 1,
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
                        "Cinsiyetini gizle",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<SetupController>(builder: ((controller) {
                        return CupertinoSwitch(
                          value: controller.showSex,
                          onChanged: (value) {
                            controller.setShowSex(value);
                          },
                        );
                      }))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SetupSexualPreferenceScreen());
                  },
                  child:  GradientButton(
                  text: "DEVAM ET",
                  page: "setsexpref",
                ) ,
                )
              
              ],
            )
          ],
        ),
      ),
    );
  }
}
