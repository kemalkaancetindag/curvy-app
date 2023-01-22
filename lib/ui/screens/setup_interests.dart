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
                
                child: GetBuilder<SetupController>(
                  builder: (controller) {
                    return SingleChildScrollView(
                      child:  Column(                      
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceAround,
                          children: controller.interestWidgets
                        ),
                       
               
                      ],
                    )
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
