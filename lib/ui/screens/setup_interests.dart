import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/login.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:curvy_app/ui/widgets/interest_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupInterestsScreen extends StatelessWidget {
  const SetupInterestsScreen({super.key});

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
                    child:  Text(
                  "İlgi alanlarını profiline ekleyerek herkesle paylaş",
                  style: TextStyle(
                    fontSize: Dimensions.h16
                  ),
                )
                  ),
                )
               
              ],
            ),
            Container(
              width: Dimensions.w325,
              height: Dimensions.h435,
              child:  Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Photography", isSelected: false, assetName:"assets/images/camera.png"),
                    InterestSelect(text: "Shopping", isSelected: true,  assetName:"assets/images/weixin-market.png")
                  ],
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Karaoke", isSelected: false, assetName:"assets/images/voice.png"),
                    InterestSelect(text: "Yoga", isSelected: false,  assetName:"assets/images/viencharts.png")
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Cooking", isSelected: false, assetName:"assets/images/noodles.png"),
                    InterestSelect(text: "Tennis", isSelected: false,  assetName:"assets/images/tennis.png")
                  ],
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Run", isSelected: true, assetName:"assets/images/sport.png"),
                    InterestSelect(text: "Swimming", isSelected: false,  assetName:"assets/images/ripple.png")
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Art", isSelected: false, assetName:"assets/images/platte.png"),
                    InterestSelect(text: "Traveling", isSelected: true,  assetName:"assets/images/outdoor.png")
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Extreme", isSelected: false, assetName:"assets/images/parachute.png"),
                    InterestSelect(text: "Music", isSelected: false,  assetName:"assets/images/music.png")
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterestSelect(text: "Drink", isSelected: false, assetName:"assets/images/goblet-full.png"),
                    InterestSelect(text: "Video games", isSelected: false,  assetName:"assets/images/game-handle.png")
                  ],
                )
              ],
            ),
            ),
            GradientButton(text: "DEVAM ET")
           

          ],
        ),
      ),
    );
  }
}
