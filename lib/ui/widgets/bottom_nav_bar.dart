import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var isCurrentUserOnlineControllerRegistred = Get.isRegistered<CurrentUserOnlineController>();
 
    if(!isCurrentUserOnlineControllerRegistred) {
        Get.put(CurrentUserOnlineController(firestoreService: Get.find()));
    }

    return Container(
      width: double.maxFinite,
      height: Dimensions.h87 - 4,
      
      decoration: BoxDecoration(
        color: Colors.white,
      ),
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
                width:   Dimensions.h60,
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
                  child: controller.currentIndex == 0 ?  SvgPicture.asset("assets/svg/nav-bar/hub_a.svg") : SvgPicture.asset("assets/svg/nav-bar/hub_ua.svg"),
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
                width:   Dimensions.h60,
                height:   Dimensions.h60,
                child: Center(
                  child: controller.currentIndex == 1 ? SvgPicture.asset("assets/svg/nav-bar/archive_a.svg") : SvgPicture.asset("assets/svg/nav-bar/archive_ua.svg"),
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
                  child: controller.currentIndex == 2 ? SvgPicture.asset("assets/svg/nav-bar/matcher_a.svg"): SvgPicture.asset("assets/svg/nav-bar/matcher_ua.svg"),
                )),
          ),
          GestureDetector(
             onTap: () {
              
              controller.setCurrentIndex(3);             
            },
            child: GetBuilder<CurrentUserOnlineController>(
              builder: (userOnlineController) {
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
                        left: Dimensions.w11,
                        right: Dimensions.w11,
                        top: 0,
                        bottom: 0,
                        child:  controller.currentIndex == 3 ?  SvgPicture.asset("assets/svg/nav-bar/messages_a.svg"): SvgPicture.asset("assets/svg/nav-bar/messages_ua.svg")
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
                  child: controller.currentIndex == 4 ? SvgPicture.asset("assets/svg/nav-bar/profile_a.svg") : SvgPicture.asset("assets/svg/nav-bar/profile_ua.svg"),
                )),
          )
        ],
      );

        },
      )
    );
  }
}
