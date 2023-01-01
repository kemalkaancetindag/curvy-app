import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/hub_controller.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:curvy_app/ui/widgets/explore_horizontal_box.dart';
import 'package:curvy_app/ui/widgets/explore_vertical_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HubController>().onInit();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, Dimensions.h87),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                  child: Center(
                    child: Image.asset("assets/images/archives_logo.png"),
                  ),
                )
              ],
            ),
          ),
        ),
        body: GetBuilder<HubController>(
          builder: (controller) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding:
                  EdgeInsets.only(left: Dimensions.w17, right: Dimensions.w17),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "Keşfet'e hoşgeldin",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h100 / 5),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: Dimensions.h16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.hub);
                              },
                              child:   ExploreVerticalBox(
                              title: controller.storageHubs![0].hub_title ?? "",
                              text: controller.storageHubs![0].hub_text ?? "",
                              image: controller.storageHubs![0].hub_image ?? "",
                              actionText: controller.storageHubs![0].hub_action_text ?? "",
                            ),
                            ),                          
                             ExploreVerticalBox(
                              title: controller.storageHubs![1].hub_title ?? "",
                              text: controller.storageHubs![1].hub_text ?? "",
                              image: controller.storageHubs![1].hub_image ?? "",
                              actionText: controller.storageHubs![1].hub_action_text ?? "",
                            ),
                          ],
                        )),
                    ExploreHorizontalBox(),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h36),
                          child: Center(
                            child: Text(
                              "Keşfet'e hoşgeldin",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h100 / 5),
                            ),
                          ),
                        )
                      ],
                    ),
                    Wrap(                      
                      children: controller.tiles ?? []
                    )

                  
                  ],
                ),
              ),
            );
          },
        ));
  }
}
