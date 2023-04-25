import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/freestyle_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FreeStylePopup extends StatelessWidget {
  FreeStylePopup({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<FreestyleController>(builder: (controller) {
      return GestureDetector(
        onPanDown: (details) {
          controller.controlCarousel(details.globalPosition.dx);
        },
        child:  Container(
          width: Dimensions.w35 * 10,
          height: controller.isPopupOn != null && controller.isPopupOn! ? Dimensions.h583 : Dimensions.h357,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h16)),
          child: Stack(
            children: [
              controller.isPopupOn != null &&  controller.isPopupOn! ? 
              Positioned(
                  bottom: Dimensions.h100 / 9,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.h583 - Dimensions.h357,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.h16),
                            bottomRight: Radius.circular(Dimensions.h16)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h21),
                          width: Dimensions.w310,
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    text:
                                        "Bu kullanıcıya direkt mesaj gönderebilmek için "),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    text: "CurvyLIKE"),
                                TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    text: " veya"),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    text: " CurvyCHIP"),
                                TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    text:
                                        " kullanabilirsin. Detaylı bilgi için"),
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    text: " Kullanım Şartlarını"),
                                TextSpan(
                                    style: TextStyle(color: Colors.white),
                                    text: " inceleyin."),
                              ]),
                            ),
                          ),
                        ),                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                controller.turnOffPopUpInfo();
                              },
                              child:   Container(
                              margin:
                                  EdgeInsets.only(right: Dimensions.w60 / 10),
                              width: Dimensions.w155,
                              height: Dimensions.h17,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.h16)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "Bu Popup'ı bir daha gösterme",
                                        style: TextStyle(
                                            color: Color(0xFF7B8491),
                                            fontSize: Dimensions.h9),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset("assets/svg/matcher/freestyle/close.svg")
                                ],
                              ),
                            ),
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.setIsPopUpOn(false);
                              },
                              child:  Container(
                              margin: EdgeInsets.only(right: Dimensions.w16),
                              child: Center(
                                child:  SvgPicture.asset("assets/svg/matcher/freestyle/chevron_up.svg"),
                              ),
                            ),
                            )
                          
                           
                          ],
                        )
                      ],
                    ),
                  )) : Container(),
              Positioned(
                  child: Container(
                width: double.maxFinite,
                height: Dimensions.h357,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16),
                ),
                child: Stack(
                  children: controller.imageCarousel ?? []
                ),
              )),
            ],
          )),
      );
    });
  }
}
