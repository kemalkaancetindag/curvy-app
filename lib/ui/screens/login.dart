import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/enums/login_method_enums.dart';
import 'package:curvy_app/ui/screens/save_account.dart';
import 'package:curvy_app/ui/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:io';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: Container(        
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFD51CFF),
              Color(0xFF00FFE1)
            ]
          )
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:  EdgeInsets.only(top: Dimensions.h117),
              width: Dimensions.w200,
              height: Dimensions.h230,
              child: Center(
                child: SvgPicture.asset("assets/svg/setup/curvy_logo.svg") 
                ),
            ),
            Container(
              width: 284,
              margin:  EdgeInsets.only(top: Dimensions.h27, bottom: Dimensions.h66),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Hesap Oluştur veya Giriş Yap’a dokunarak,",
                  style: TextStyle(fontSize: Dimensions.h14),
                  children: <TextSpan>[
                    TextSpan(text: "Şartlarımızı", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    TextSpan(text: "kabul ediyorsun. Verilerini nasıl işlediğimizi öğrenmek için "),
                    TextSpan(text: "Gizlilik Politikası ", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    TextSpan(text: "ve "),
                    TextSpan(text: "Çerez Politikası", style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                    TextSpan(text: "'nı inceleyebilirsin"),
                  ]
                )
              )
            ),
            LoginButton(text: Platform.isIOS ? "APPLE İLE GİRİŞ YAP" : "GOOGLE İLE GİRİŞ YAP", logo: !Platform.isAndroid ? "assets/svg/setup/apple.svg" : "assets/svg/setup/google.svg",
            loginMethod: () async {
              if(Platform.isAndroid){
                Get.find<SetupController>().setLoginMethod(LoginMethod.google.value); 
                await Get.find<AuthService>().googleAuth();
              }
              else{
                Get.find<SetupController>().setLoginMethod(LoginMethod.apple.value); 
                await Get.find<AuthService>().appleAuth();
              }
                
               
                
                
            },),
            LoginButton(text: "FACEBOOK İLE KAYDOL", logo: "assets/svg/setup/facebook.svg",loginMethod: () async {
              Get.find<SetupController>().setLoginMethod(LoginMethod.facebook.value);
              await Get.find<AuthService>().facebookAuth();
            },),
            LoginButton(text: "TELEFON NUMARASI İLE GİRİŞ YAP", logo: "assets/svg/setup/phone.svg",loginMethod: (){

              Get.find<SetupController>().setLoginMethod(LoginMethod.phone.value);
              Get.toNamed(Routes.validationNumber);
            },),
            GestureDetector(
              onTap: () async {
                
              },
              child:   Container(
              width: Dimensions.w254,
              margin: EdgeInsets.only(top: Dimensions.h52 - Dimensions.h21),
              child:Center(
                child:  Text("Giriş yaparken sorun mu yaşıyorsun?", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),)
              ),
            )
            )
          

            
          ]
        ),
      ),
    );
  }
}