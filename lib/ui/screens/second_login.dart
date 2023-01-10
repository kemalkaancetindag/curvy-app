import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/second_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SecondLoginScreen extends StatelessWidget {
  const SecondLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SecondLoginController(firestoreService: Get.find(), sharedPreferenceService: Get.find()));
    return Scaffold(body: GetBuilder<SecondLoginController>(
      builder: (controller) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.h117),
                child: Center(
                  child: Image.asset("assets/images/second_login_logo.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Dimensions.h60),
                child: Text(
                  "Tekrar hoş geldin ${controller.name ?? ""}!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.h21),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Dimensions.h60),
                width: Dimensions.w325,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.white, fontSize: Dimensions.h14),
                      text: "Giriş Yap'a dokunarak ",
                      children: [
                        TextSpan(
                            text: "Şartlarımızı",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                          text:
                              " kabul ediyorsun. Verilerini nasıl işlediğimizi öğrenmek için ",
                        ),
                        TextSpan(
                            text: "Gizlilik Politikası",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                          text: " veya ",
                        ),
                        TextSpan(
                            text: "Çerez Politikası",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                          text: "'nı inceleyebilirsin.",
                        ),
                      ]),
                ),
              ),
           GestureDetector(
            onTap: (){
              controller.login();
            },
            child:    Container(
                margin: EdgeInsets.only(
                    top: Dimensions.h60, bottom: Dimensions.h52),
                width: Dimensions.w320,
                height: Dimensions.h50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.h300 / 10)),
                child: Center(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
                        .createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      "GİRİŞ YAP",
                      style: TextStyle(
                          fontSize: Dimensions.h21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
           ),
              Text(
                "Giriş yaparken sorun mu yaşıyorsun?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.h14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    ));
  }
}
