import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

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
                  child: controller.currentIndex == 0 ? Image.asset("assets/images/nav_hubs_white.png") : Image.asset("assets/images/nav_first.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              
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
                  child: controller.currentIndex == 1 ? Image.asset("assets/images/nav_archive_white.png") : Image.asset("assets/images/nav_second.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
                         
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
                  child: controller.currentIndex == 2 ? Image.asset("assets/images/nav_index_white.png") : Image.asset("assets/images/nav_middle.png"),
                )),
          ),
          GestureDetector(
             onTap: () {
              
              controller.setCurrentIndex(3);             
            },
            child: GetBuilder<CurrentUserOnlineController>(
              builder: (userOnlineController) {
                print("BURDAAAAAAAA");
                print(userOnlineController.unAnsweredMessages);
                return Container(
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
                child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child:  controller.currentIndex == 3 ? Image.asset("assets/images/nav_messages_white.png") : Image.asset("assets/images/nav_fourth.png"),
                      ),
                      userOnlineController.unAnsweredMessages != 0 ?
                      Positioned(       
                        right: 0,       
                        top: -Dimensions.h100/20,                                                
                        child: Container(
                            width: Dimensions.h60/3,
                            height: Dimensions.h60/3,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular((Dimensions.h60/3)/2)
                            ),        
                            child: Center(
                              child: Text(
                                userOnlineController.unAnsweredMessages.toString(),
                                style: TextStyle(
                                  fontSize: Dimensions.h100/10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),                    
                          ),
                      ) : Container()
                    ],
                  ));
              },
            )
          ),
          GestureDetector(
             onTap: () {
              
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
                  child: controller.currentIndex == 4 ? Image.asset("assets/images/nav_profile_white.png") : Image.asset("assets/images/nav_last.png"),
                )),
          )
        ],
      );

        },
      )
    );
  }
}
