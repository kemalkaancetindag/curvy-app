import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/archive_who_liked_me_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArchiveLikes extends StatelessWidget {
  ArchiveLikes({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ArchiveWhoLikedMeController>().onInit();

    return GetBuilder<ArchiveWhoLikedMeController>(
      builder: (controller) {
        if(controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xFFD51CFF),
            ),
          );
        }
        if (controller.usersWhoLikedMe == null || controller.usersWhoLikedMe!.isEmpty) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: Dimensions.w209,
                  child: Center(
                    child: Text(
                      "Curvy Turbo kullanarak eşleşme şansını artır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.h100 / 5),
                    ),
                  ),
                ),
                controller.currentUser != null ?
                Container(
                  width: Dimensions.h120,
                  height: Dimensions.h120,
                  margin: EdgeInsets.only(top: Dimensions.h100),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.currentUser!.images!.first)}?alt=media'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(Dimensions.h120 / 2)),
                ) : Container(),
                Container(
                  width: Dimensions.w209,
                  margin: EdgeInsets.only(top: Dimensions.h120 + Dimensions.h8),
                  child: Center(
                    child: Text(
                      "Curvy Turbo sayesinde eşleştiklerin burada görünecek",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimensions.h14,
                          color: Color(0xFF7B8491),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: Dimensions.w209,
                  margin: EdgeInsets.only(top: Dimensions.h8),
                  child: Center(
                    child: Text(
                      "10X Görüntülenmek için",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Dimensions.h100 / 5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.buyCurvyTurbo);
                  },
                  child:                 Container(
                  width: Dimensions.w314,
                  height: Dimensions.h60,
                  margin: EdgeInsets.only(top: Dimensions.h14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h60 / 2),
                      gradient: LinearGradient(colors: [
                        Color(0xFFD51CFF),
                        Color(0xFF6198EF),
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w8),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/archive/likes/curvy_turbo.svg"),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Hemen Beni Turbola",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h50 / 2,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                )
              ],
            ),
          );
        }

        return Container(
          width: Get.width,
          height: Get.height ,
          color: Colors.white,
          child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(double.infinity),
              child: Container(
                width: Get.width,
                height: Get.height,
                child: Stack(
                  clipBehavior: Clip.none, 
                  children: controller.tiles ?? []
                ),
              )),
        );
      },
    );
  }
}
