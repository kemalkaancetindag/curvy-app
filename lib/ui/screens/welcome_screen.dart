import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/setup_name.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:curvy_app/ui/widgets/welcome_screen_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: Dimensions.h209,
                  margin: EdgeInsets.only(bottom: Dimensions.h66),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Dimensions.h36),
                          bottomRight: Radius.circular(Dimensions.h36)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h40),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/setup/welcome_logo.svg"),
                        ),
                      ),
                      Container(
                          width: Dimensions.w300,
                          height: Dimensions.h40,
                          margin: EdgeInsets.only(top: Dimensions.h7),
                          child: Center(
                            child: Text(
                              "Curvy'e hoş geldin.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h36,
                                  fontWeight: FontWeight.w900),
                            ),
                          ))
                    ],
                  ),
                ),
                WelcomeScreenInfo(title: "Kendin ol", info: "Fotoğraflarının, yaşının ve biyografinin gerçeği yansıttığından emin ol.", isUnderlined: false,),
                WelcomeScreenInfo(title: "Dikkatli ol.", info: "Kişisel bilgilerini paylaşmadan önce iyi düşün. Tedbirli Kullan.", isUnderlined: false,),
                WelcomeScreenInfo(title: "Nazik ol.", info: "Diğer kullanıcılara saygı göster ve sana nasıl davranılmasını istiyorsan onlara da öyle davran.", isUnderlined: false,),
                WelcomeScreenInfo(title:"Proaktif ol.", info: "Kötü davranışları mutlaka bize bildir.", isUnderlined: false,),
              ],
            ),
            GestureDetector(
              onTap: (){
                Get.to(() => SetupNameScreen());
              
              },
              child:GradientButton(text: "ONAYLIYORUM", page: "setname",),
            )
            
          ],
        ),
      ),
    );
  }
}
