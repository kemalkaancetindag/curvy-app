import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/widgets/basic_button.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupSexScreen extends StatelessWidget {
  const SetupSexScreen({super.key});

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
            Column(
              children: [
                BasicButton(
                  text: "KADIN",
                  isSelected: false,
                ),
                BasicButton(
                  text: "ERKEK",
                  isSelected: true,
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
                        "Cinsiyetini gizle",
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
                GradientButton(text: "DEVAM ET", page: "setsexpref",)
              ],
            )
          ],
        ),
      ),
    );
  }
}
