import 'package:cached_network_image/cached_network_image.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:curvy_app/enums/swipe.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/util/modals.dart';
import 'package:curvy_app/ui/widgets/matching/swipe_profile_card_info_pill.dart';
import 'package:curvy_app/ui/widgets/matching/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SwipePofileCard extends StatelessWidget {
  int? swipingImageIndex;
  PageController? pageController;
  UserModel user;

  SwipePofileCard(
      {super.key,
      this.swipingImageIndex,
      required this.pageController,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMatcherController>(builder: (controller) {
      return user != null
          ? Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16)),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: PageView.builder(
                          controller: pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: user.images!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onPanDown: (details) {
                                if (details.localPosition.dx < Get.width / 2) {
                                  pageController!.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                  if (index != 0) {
                                    controller
                                        .setCurrentUserImageIndex(index - 1);
                                  }
                                } else {
                                  pageController!.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                  if (index != user.images!.length - 1) {
                                    controller
                                        .setCurrentUserImageIndex(index + 1);
                                  }
                                }
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(seconds: 0),
                                  fadeOutDuration: Duration(seconds: 0),
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                  fit: BoxFit.cover,
                                  imageUrl: swipingImageIndex != null
                                      ? 'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(user.images![controller.currentUserImageIndex])}?alt=media'
                                      : 'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(user.images![pageController != null ? index : 0])}?alt=media',

                                  placeholder: (context, url){
                                    return  Container(
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: Dimensions.h100/10),
                                              width: Dimensions.h60*2,
                                              height: Dimensions.h60*2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.h60),
                                                color: Color(0XFFE3E3E3)
                                              ),
                                            ),
                                            Container(
                                              
                                              width: Dimensions.h60*2,
                                              height: Dimensions.h60*3,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(Dimensions.h60/2),
                                                  topRight: Radius.circular(Dimensions.h60/2)
                                                ),
                                                color: Color(0XFFE3E3E3)
                                              ),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFfD0D0D0),
                                            
                                        ),
                                      );
                                  },
                                ) ,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Dimensions.h16),
                                ),
                              ),
                            );
                          })),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                      )),
                  Positioned(
                      top: Dimensions.h16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(user.images!.length, (index) {
                          if (controller.currentUserImageIndex == index) {
                            return Container(
                              width: (Get.width / (user.images!.length + 0.5)),
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h50 / 10),
                              ),
                              child: Center(
                                child: Container(
                                  width: (Get.width /
                                          (user.images!.length + 0.5)) /
                                      1.05,
                                  height: Dimensions.h60 / 20,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    Color(0xFFD51CFF),
                                    Color(0xFF6198EF)
                                  ])),
                                ),
                              ),
                            );
                          }
                          return Container(
                            width: (Get.width / (user.images!.length + 0.3)),
                            height: Dimensions.h7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h50 / 10)),
                          );
                        }),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.h16),
                            bottomRight: Radius.circular(Dimensions.h16),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black
                              ])),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: Dimensions.w50 / 5,
                                            right: Dimensions.w8),
                                        width: Dimensions.h16 / 2,
                                        height: Dimensions.h16 / 2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.h16 / 4),
                                            color: Color(0xFF05ED00)),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text:
                                                  "${user.name!.split(" ").first},",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Dimensions.h36,
                                                  fontWeight: FontWeight.w800),
                                              children: [
                                            TextSpan(
                                                text:
                                                    "${DateTime.now().year - int.parse(user.birthdate!.split("/").last)}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Dimensions.h22,
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ]))
                                    ],
                                  ),
                                  LayoutBuilder(builder: (p0, p1) {
                                    if (controller.currentUserImageIndex == 0) {
                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.w50 / 5,
                                                right: Dimensions.w8),
                                            width: Dimensions.h12,
                                            height: Dimensions.h12,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/location_white.png"),
                                                    fit: BoxFit.contain)),
                                          ),
                                          Text(
                                            pageController != null
                                                ? "${user.current_distance} km uzakta"
                                                : "- km uzakta",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.h21,
                                            ),
                                          )
                                        ],
                                      );
                                    } else if (controller
                                            .currentUserImageIndex ==
                                        1) {
                                      if (controller
                                              .recommendedUsers!.last.about !=
                                          null) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              left: Dimensions.w11),
                                          width: Dimensions.w270,
                                          child: Text(
                                            controller
                                                .recommendedUsers!.last.about!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h21),
                                          ),
                                        );
                                      }
                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.w50 / 5,
                                                right: Dimensions.w8),
                                            width: Dimensions.h12,
                                            height: Dimensions.h12,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/location_white.png"),
                                                    fit: BoxFit.contain)),
                                          ),
                                          Text(
                                            "${user.current_distance} km uzaklıkta",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.h21,
                                            ),
                                          )
                                        ],
                                      );
                                    } else if (controller
                                            .currentUserImageIndex ==
                                        2) {
                                      return Container(
                                        width: Dimensions.w270,
                                        child: Wrap(
                                            children: List.generate(
                                                controller
                                                    .currentRecommendedUsersInterests
                                                    .length, (index) {
                                          return SwipeProfileCardInfoPill(
                                            isSame: controller
                                                .currentUser!.interests!
                                                .contains(controller
                                                    .currentRecommendedUsersInterests[
                                                        index]
                                                    .interest_type),
                                            text: controller
                                                .currentRecommendedUsersInterests[
                                                    index]
                                                .text!,
                                          );
                                        })),
                                      );
                                    } else {
                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: Dimensions.w50 / 5,
                                                right: Dimensions.w8),
                                            width: Dimensions.h12,
                                            height: Dimensions.h12,
                                            child: SvgPicture.asset("assets/svg/matcher/card/location.svg"),
                                          ),
                                          Text(
                                            "3 km uzaklıkta",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.h21,
                                            ),
                                          )
                                        ],
                                      );
                                    }
                                  }),
                                ],
                              ),
                              GestureDetector(
                                onPanDown: (details) {
                                  controller.tappedButtonAnimation(5);
                                },
                                onPanCancel: () {
                                  controller.tappedButtonAnimation(null);
                                },
                                  onTap: () {
                                    Get.lazyPut(() => UserDetailController(
                                        firestoreService: Get.find(),
                                        userID: controller
                                            .recommendedUsers!.last.userID!,
                                        newMatcherController: controller,
                                        matchService: Get.find()));
                                    Get.toNamed(Routes.userDetail);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w42),
                                    width: controller.tappedButton == 5 ? Dimensions.h36/1.2 : Dimensions.h36,
                                    height: controller.tappedButton == 5 ? Dimensions.h36/1.2 : Dimensions.h36,
                                    child: SvgPicture.asset("assets/svg/matcher/card/expand.svg"),
                                  )),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: Dimensions.h14,
                                top: Dimensions.h40 / 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onPanDown: (details) {
                                    controller.tappedButtonAnimation(0);
                                  },
                                  onPanCancel: () {
                                    controller.tappedButtonAnimation(null);
                                  },
                                  onTap: () {
                                    controller.previousUser();
                                  },
                                  child: Container(
                                    width: controller.tappedButton == 0 ? Dimensions.w42/1.2 : Dimensions.w42,
                                    height: controller.tappedButton == 0 ? Dimensions.w42/1.2 : Dimensions.w42,
                                    child: SvgPicture.asset("assets/svg/matcher/card/back.svg"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    controller.dislikeUser(true);
                                  },
                                   onPanDown: (details) {
                                    controller.tappedButtonAnimation(1);
                                  },
                                  onPanCancel: () {
                                    controller.tappedButtonAnimation(null);
                                  },
                                  child: Container(
                                     width: controller.tappedButton == 1 ? Dimensions.h58/1.2 : Dimensions.h58,
                                    height: controller.tappedButton == 1 ? Dimensions.h58/1.2 : Dimensions.h58,                                   
                                    child: SvgPicture.asset("assets/svg/matcher/card/un_like.svg"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Modals().curvyLikeModal(controller
                                        .recommendedUsers!.last.userID!);
                                  },
                                    onPanDown: (details) {
                                    controller.tappedButtonAnimation(2);
                                  },
                                  onPanCancel: () {
                                    controller.tappedButtonAnimation(null);
                                  },
                                  child: Container(
                                      width: controller.tappedButton == 2 ? Dimensions.h45/1.2 : Dimensions.h45,
                                    height: controller.tappedButton == 2 ? Dimensions.h45/1.2 : Dimensions.h45,                                    
                                    child: SvgPicture.asset("assets/svg/matcher/card/super_like.svg"),
                                  ),
                                ),
                                GestureDetector(
                                   onPanDown: (details) {
                                    controller.tappedButtonAnimation(3);
                                  },
                                  onPanCancel: () {
                                    controller.tappedButtonAnimation(null);
                                  },
                                  onTap: () async {

                                    controller.likeUser(true);
                                  },
                                  child: Container(
                                        width: controller.tappedButton == 3 ? Dimensions.h58/1.2 : Dimensions.h58,
                                    height: controller.tappedButton == 3 ? Dimensions.h58/1.2 : Dimensions.h58, 
                                    child:SvgPicture.asset("assets/svg/matcher/card/like.svg"),
                                  ),
                                ),
                                GestureDetector(
                                    onPanDown: (details) {
                                    controller.tappedButtonAnimation(4);
                                  },
                                  onPanCancel: () {
                                    controller.tappedButtonAnimation(null);
                                  },
                                  onTap: () {
                                    Get.toNamed(Routes.buyCurvyTurbo);
                                  },
                                  child: Container(
                                  width: controller.tappedButton == 4 ? Dimensions.w42/1.2 : Dimensions.w42,
                                    height: controller.tappedButton == 4 ? Dimensions.w42/1.2 : Dimensions.w42,
                                    child: SvgPicture.asset("assets/svg/matcher/card/turbo.svg"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: Dimensions.h50,
                    left: Dimensions.w25,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.h16),
                          width: Dimensions.h27,
                          height: Dimensions.h27,
                        child:  SvgPicture.asset("assets/svg/matcher/card/report.svg"),
                        ),
                        Container(
                          width: Dimensions.h27,
                          height: Dimensions.h27,
                          child:  SvgPicture.asset("assets/svg/matcher/card/share.svg"),
                        )
                      ],
                    ),
                  ),
                 
                  controller.swipe == Swipe.none || pageController == null
                      ? Container()
                      : controller.swipe == Swipe.left
                          ? Positioned(
                              top: Dimensions.h137,
                              right: Dimensions.w25,
                              child: TagWidget(
                                text: "HAYIR",
                              ))
                          : Positioned(
                              top: Dimensions.h137,
                              left: Dimensions.w25,
                              child: TagWidget(
                                text: "EVET",
                              )),
                  controller.isSuperLike  && pageController != null ?
                   Positioned(
                    top: Dimensions.h52,
                    left: (MediaQuery.of(context).size.width/2) - (Dimensions.h87/2),
                    child: Container(
                      width: Dimensions.h87,
                      height: Dimensions.h87,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/super_like_icon.png"),
                          fit: BoxFit.contain
                        )
                      ),
                    )
                  ) : Container(),
                ],
              ))
          : Container();
    });
  }
}
