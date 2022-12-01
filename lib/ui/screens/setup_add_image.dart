import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SetupAddImageScreen extends StatelessWidget {
  const SetupAddImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
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
            Container(),
            GetBuilder<SetupController>(builder: ((controller) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.pickImage(0,controller.currentImageIndex);
                    },
                    child: Container(
                      width: Dimensions.w120,
                      height: Dimensions.h120,
                      decoration: BoxDecoration(
                          color: Color(0xFFD446F4),
                          borderRadius: BorderRadius.circular(Dimensions.h31)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/camera_icon.png"),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.h7),
                              width: Dimensions.w50,
                              child: Text(
                                "Kameranla Çek",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Dimensions.h14,
                                  color: Colors.white
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage(1,controller.currentImageIndex);
                    },
                    child: Container(
                      width: Dimensions.w120,
                      height: Dimensions.h120,
                      margin: EdgeInsets.only(top: Dimensions.h31),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.h31),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.4))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/gallery_icon.png"),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.h7),
                              width: Dimensions.w50,
                              
                              child: Text(
                                "Galerinden Seç",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: Dimensions.h14,
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              );
            })),
            GestureDetector(
              onTap: (){
                Get.to(() => SetupImageScreen());
              },
              child:  GradientButton(text: "DEVAM ET"),
            )
          
          ],
        ),
      ),
    );
  }
}
