import 'package:curvy_app/controllers/freestyle_controller.dart';
import 'package:curvy_app/ui/widgets/free_style_box.dart';
import 'package:curvy_app/ui/widgets/free_style_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FreeStyle extends StatelessWidget {
  FreeStyle({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FreestyleController(goApiClient: Get.find()));
    return GetBuilder<FreestyleController>(
      builder: (controller){
        return Container(
      width: double.maxFinite,
      height: double.maxFinite,      
      child: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.max,          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FreeStylePopup(),
            Wrap(
              
              children: controller.recommendedUsersWidget ?? [],
            )
          ],
        ),
      ),
    );
      }
    );
  }
}
