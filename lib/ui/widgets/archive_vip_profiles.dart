import 'package:curvy_app/controllers/pages/archive_vip_profiles_controller.dart';
import 'package:curvy_app/ui/widgets/archive_vip_profile_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ArchiveVipProfiles extends StatelessWidget {
  ArchiveVipProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ArchiveVipProfilesController>().onInit();
    return GetBuilder<ArchiveVipProfilesController>(
      builder: (controller){
        return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: controller.vipProfiles != null ? SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: double.maxFinite,
            child:  Wrap(
            children: controller.tiles ?? []
          ),
          ) 
        ) : Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xFFD51CFF),
            ),
          ),
        )
        );
      }
    );
  }
}
