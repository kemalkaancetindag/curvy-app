import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/archive_vip_profiles_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ArchiveVipProfileBox extends StatelessWidget {
  String userID;
  int selectionTime;
  ArchiveVipProfileBox({super.key, required this.userID, required this.selectionTime});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserOnlineController>(
        init: Get.find<UserOnlineController>(tag: userID),
        global: false,
        builder: (controller) {
          return controller.user != null ? Container(
              width: Dimensions.w17 * 10,
              height: Dimensions.h230,
              margin: EdgeInsets.only(left: Dimensions.w16, top: Dimensions.h100/10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.h8),
                              topRight: Radius.circular(Dimensions.h8),
                              bottomLeft: Radius.circular(Dimensions.h8),
                              bottomRight: Radius.circular(Dimensions.h50 / 2),
                            ),
                            image: DecorationImage(
                                image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.user!.images![0])}?alt=media'),
                                fit: BoxFit.cover))),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.h8),
                              topRight: Radius.circular(Dimensions.h8),
                              bottomLeft: Radius.circular(Dimensions.h8),
                              bottomRight: Radius.circular(Dimensions.h50 / 2),
                            ),
                            gradient: LinearGradient(
                                stops: [0, 1],
                                colors: [Colors.transparent, Colors.black],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.h100 / 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              controller.user!.online_status! ? 
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.w8 / 2),
                                                height: Dimensions.h8,
                                                width: Dimensions.h8,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions.h8 / 2),
                                                    color: Color(0xFF05ED00)),
                                              ) : Container(),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.w8 / 2),
                                                child: Center(
                                                  child: Text(
                                                    "${controller.user!.name!.split(" ").first},${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Dimensions.h16),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Center(
                                                  child: SvgPicture.asset("assets/svg/archive/vip/confirmed_small.svg"),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.w8 / 2),
                                            child: Center(
                                              child: Text(
                                                "${(DateTime.fromMillisecondsSinceEpoch(selectionTime - DateTime.now().millisecondsSinceEpoch).hour).toString()} saat sonra kaldırılacak",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        Dimensions.h16 / 2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Get.find<ArchiveVipProfilesController>().showCurvyLikeDialog(userID);
                                      },
                                      child:Container(
                                      height: Dimensions.h31,
                                      width: Dimensions.h31,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h31 / 2),
                                          gradient: LinearGradient(colors: [
                                            Color(0xFF4AB0EB),
                                            Color(0xFF00FFE1),
                                          ])),
                                      child: Center(
                                        child:SvgPicture.asset("assets/svg/archive/vip/super_like.svg"),
                                      ),
                                    ) ,
                                    )
                                    
                                  ],
                                ),
                              ),
                            ],
                          ))),
                ],
              )) : Container();
        });
  }
}
