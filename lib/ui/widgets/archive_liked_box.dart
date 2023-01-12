import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ArchiveLikedBox extends StatelessWidget {
  
  String userID;
  

  ArchiveLikedBox({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserOnlineController>(      
      init: Get.find<UserOnlineController>(tag: userID),
      global: false,
      builder: (controller) { 
      return controller.user != null ? Container(
        width: Dimensions.w111,
        height: Dimensions.h148,
        margin: EdgeInsets.only(left: Dimensions.w16/2, right: Dimensions.w16/2, top: Dimensions.w11),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h8),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.user!.images![0])}?alt=media'),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h8),
                    gradient: LinearGradient(
                        stops: [0, 1],
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          controller.user!.online_status! ? 
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.w8, right: Dimensions.w8 / 2),
                            width: Dimensions.h8 / 2,
                            height: Dimensions.h8 / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h8 / 4),
                                color: Color(0xFF05ED00)),
                          ) : Container(),
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.w8 / 2, left: controller.user!.online_status! ? 0 : Dimensions.w8),
                            child: Center(
                              child: Text(
                                "${controller.user!.name!.split(" ")[0]}, ${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.h100 / 10),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/confirm_small.png"),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h8 / 2, bottom: Dimensions.h8 / 2),
                        child: SizedBox(
                          height: 1,
                          width: Dimensions.w111 / 1.2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                          width: Dimensions.w111 / 1.2,
                          child: Text(
                            "Antalya konumundan, ${controller.distance}km uzakta${controller.user!.online_status! ? ', şuan online. ' : ""}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white, fontSize: Dimensions.h8),
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ) :Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFD51CFF),
          ),
        ),
      );
    });
  }
}
