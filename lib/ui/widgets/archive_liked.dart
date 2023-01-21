import 'package:curvy_app/controllers/pages/archive_i_liked_controller.dart';
import 'package:curvy_app/ui/widgets/archive_liked_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ArchiveLiked extends StatelessWidget {
  ArchiveLiked({super.key});

  @override
  Widget build(BuildContext context) {    
    Get.find<ArchiveILikedController>().onInit();
    return GetBuilder<ArchiveILikedController>(
      builder: (controller){
        return     Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: controller.usersILiked != null ? SingleChildScrollView(
          child: Wrap(
            children: controller.tiles ?? []
          ),
        ) : Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: CircularProgressIndicator(
            color: Color(0xFFD51CFF),
          ),
        )
      );
      }
    );
    

  }
}
