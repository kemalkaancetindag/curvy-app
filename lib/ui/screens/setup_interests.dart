import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/login.dart';
import 'package:curvy_app/ui/screens/setup_add_image.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:curvy_app/ui/widgets/interest_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SetupInterestsScreen extends StatelessWidget {
  SetupInterestsScreen({super.key});

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
            Column(
              children: [
                BlackBoldHeader(text: "İlgi Alanların"),
                Container(
                  width: Dimensions.w200,
                  child: Center(
                      child: Text(
                    "İlgi alanlarını profiline ekleyerek herkesle paylaş",
                    style: TextStyle(fontSize: Dimensions.h16),
                  )),
                )
              ],
            ),
            Container(
                width: Dimensions.w325,
                height: Dimensions.h435,
                child: GetBuilder<SetupController>(
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                
                                controller.controlInterests(0);
                              }),
                              child: InterestSelect(
                                  text: "Photography",
                                  isSelected: controller.interests.contains(0),
                                  assetName: "assets/images/camera.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(1);
                              }),
                                child: InterestSelect(
                                    text: "Shopping",
                                    isSelected: controller.interests.contains(1),
                                    assetName:
                                        "assets/images/weixin-market.png"))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(2);
                              }),
                              child: InterestSelect(
                                  text: "Karaoke",
                                  isSelected: controller.interests.contains(2),
                                  assetName: "assets/images/voice.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(3);
                              }),
                              child: InterestSelect(
                                  text: "Yoga",
                                  isSelected: controller.interests.contains(3),
                                  assetName: "assets/images/viencharts.png"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(4);
                              }),
                              child: InterestSelect(
                                  text: "Cooking",
                                  isSelected: controller.interests.contains(4),
                                  assetName: "assets/images/noodles.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(5);
                              }),
                              child: InterestSelect(
                                  text: "Tennis",
                                  isSelected: controller.interests.contains(5),
                                  assetName: "assets/images/tennis.png"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(6);
                              }),
                              child: InterestSelect(
                                  text: "Run",
                                  isSelected: controller.interests.contains(6),
                                  assetName: "assets/images/sport.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(7);
                              }),
                              child: InterestSelect(
                                  text: "Swimming",
                                  isSelected: controller.interests.contains(7),
                                  assetName: "assets/images/ripple.png"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(8);
                              }),
                              child: InterestSelect(
                                  text: "Art",
                                  isSelected: controller.interests.contains(8),
                                  assetName: "assets/images/platte.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(9);
                              }),
                                child: InterestSelect(
                                    text: "Traveling",
                                    isSelected: controller.interests.contains(9),
                                    assetName: "assets/images/outdoor.png"))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(10);
                              }),
                              child: InterestSelect(
                                  text: "Extreme",
                                  isSelected: controller.interests.contains(10),
                                  assetName: "assets/images/parachute.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(11);
                              }),
                              child: InterestSelect(
                                  text: "Music",
                                  isSelected: controller.interests.contains(11),
                                  assetName: "assets/images/music.png"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(12);
                              }),
                              child: InterestSelect(
                                  text: "Drink",
                                  isSelected: controller.interests.contains(12),
                                  assetName: "assets/images/goblet-full.png"),
                            ),
                            GestureDetector(
                               onTap: (() {
                                
                                controller.controlInterests(13);
                              }),
                              child: InterestSelect(
                                  text: "Video games",
                                  isSelected: controller.interests.contains(13),
                                  assetName: "assets/images/game-handle.png"),
                            )
                          ],
                        )
                      ],
                    );
                  },
                )),
            GestureDetector(
              onTap: (){
                Get.to(SetupImageScreen());
              },
              child: GradientButton(text: "DEVAM ET"),
            )
            
          ],
        ),
      ),
    );
  }
}
