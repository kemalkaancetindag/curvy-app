import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: SingleChildScrollView(child: GetBuilder<UserDetailController>(
          builder: (controller) {
            return controller.user != null ? Column(
              children: [
                GestureDetector(
                  onPanDown: (details){
                    controller.controllCarousel(details.localPosition.dx, details.localPosition.dy);
                  },                 
                  child:  Container(
                  margin: EdgeInsets.only(top: Dimensions.h42),
                  width: Get.width,
                  height: Dimensions.h520,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: controller.imageCarousel,
                  ),
                ),
                ),
               
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.w180 / 10, top: Dimensions.h14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.user!.online_status! ?
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w50 / 10),
                        width: Dimensions.h12,
                        height: Dimensions.h12,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h12 / 2),
                            color: Color(0xFF05ED00)),
                      ) : Container(),
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w50 / 10),
                        child: Center(
                          child: Text(
                            "${controller.user!.name!.split(" ").first}, ${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.h36,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: SvgPicture.asset("assets/svg/index/confirmed.svg"),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.w180 / 10, top: Dimensions.h16),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w50 / 10),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/detail/home.svg"),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "İstanbul, Bakırköy, İncirli",
                            style: TextStyle(
                                color: Color(0xFF7B8491),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.h14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.w180 / 10, top: Dimensions.h100 / 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w50 / 10),
                        child: Center(
                          child:  SvgPicture.asset("assets/svg/detail/location.svg"),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "${controller.distance} km uzaklıkta",
                            style: TextStyle(
                                color: Color(0xFF7B8491),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.h14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                      left: Dimensions.w180 / 10,
                      bottom: Dimensions.h8,
                      top: Dimensions.h16),
                  child: Row(
                    children: [
                      Text(
                        "HAKKIMDA",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.h16),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: Dimensions.w180 / 10),
                    width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.user!.about}",
                        style: TextStyle(
                            color: Color(0xFF7B8491), fontSize: Dimensions.h14),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.h16, bottom: Dimensions.h16),
                  width: Dimensions.w35 * 10,
                  height: 1,
                  color: Color(0xFFC5C5C7),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    left: Dimensions.w180 / 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "İLGİ ALANLARIM",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.h16),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.w31),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: controller.interests,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h21),
                  width: Dimensions.w35 * 10,
                  height: Dimensions.h60,
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFC5C5C7)),
                    bottom: BorderSide(width: 1, color: Color(0xFFC5C5C7)),
                  )),
                  child: Center(
                    child: Text("Profili Paylaş"),
                  ),
                ),
                Container(
                  width: Dimensions.w35 * 10,
                  height: Dimensions.h60,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFC5C5C7)),
                  )),
                  child: Center(
                    child: Text("Profili Şikayet Et"),
                  ),
                ),
                Container(
                  width: Dimensions.w35 * 10,
                  margin: EdgeInsets.only(
                      top: Dimensions.h27, bottom: Dimensions.h27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          controller.removeAction();
                        },
                        child:  Container(
                        width: Dimensions.h52,
                        height: Dimensions.h52,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h52 / 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child:  SvgPicture.asset("assets/svg/matcher/card/back.svg"),
                        ),
                      ),
                      ),
                     
                      GestureDetector(
                        onTap: (){
                          controller.dislikeUser();
                        },
                        child:    Container(
                        width: Dimensions.h7 * 10,
                        height: Dimensions.h7 * 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h7 * 5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child:
                              SvgPicture.asset("assets/svg/matcher/card/un_like.svg"),
                        ),
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.showCurvyLikeDialog();
                        },
                        child:    Container(
                        width: Dimensions.h60,
                        height: Dimensions.h60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h60 / 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/matcher/card/super_like.svg"),
                        ),
                      ),
                      ),
                   
                      GestureDetector(
                        onTap: (){
                          controller.likeUser();
                        },
                        child:  Container(
                        width: Dimensions.h7 * 10,
                        height: Dimensions.h7 * 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h7 * 5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/matcher/card/like.svg"),
                        ),
                      ),
                      ),
                     
                     GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.buyCurvyTurbo);
                      },
                      child:  Container(
                        width: Dimensions.h52,
                        height: Dimensions.h52,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h52 / 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: SvgPicture.asset("assets/svg/matcher/card/turbo.svg"),
                        ),
                      ),
                     )
                    ],
                  ),
                )
              ],
            ) : Container();
          },
        )),
      ),
    ), 
      onWillPop: () async {
        Get.find<UserDetailController>().clearState();
        Get.delete<UserDetailController>();
        return true;
      },
    );
  }
}
