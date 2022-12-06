import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.h87 - 4,
      decoration: BoxDecoration(),
      child: GetBuilder<NavController>(
        builder: (controller){
          return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
         
            onTap: () {
              Get.offAllNamed('/explore');   
              controller.setCurrentIndex(0);           
            },
            child: Container(
                width: Dimensions.h60,
                height: Dimensions.h60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h60/2),
                  gradient:controller.currentIndex == 0 ? LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF00FFE1)
                    ]
                  ) : null
                ),
                child: Center(
                  child: Image.asset("assets/images/nav_first.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              Get.offAllNamed('/archives');    
               controller.setCurrentIndex(1);                
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h60/2),
                  gradient:controller.currentIndex == 1 ? LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF00FFE1)
                    ]
                  ) : null
                ),
                width: Dimensions.h60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_second.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              Get.offAllNamed('/matching');              
              controller.setCurrentIndex(2);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h60/2),
                  gradient:controller.currentIndex == 2 ? LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF00FFE1)
                    ]
                  ) : null
                ),
                width: Dimensions.h60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_middle.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              Get.offAllNamed('/messages'); 
              controller.setCurrentIndex(3);             
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h60/2),
                  gradient:controller.currentIndex == 3 ? LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF00FFE1)
                    ]
                  ) : null
                ),
                width: Dimensions.h60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_fourth.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              Get.offAllNamed('/'); 
              controller.setCurrentIndex(4);             
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h60/2),
                  gradient:controller.currentIndex == 4 ? LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF00FFE1)
                    ]
                  ) : null
                ),
                width: Dimensions.h60,
                height: Dimensions.h60,
                child: Center(
                  child: Image.asset("assets/images/nav_last.png"),
                )),
          )
        ],
      );

        },
      )
    );
  }
}
