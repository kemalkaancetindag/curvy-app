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
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.h16),
                                    image: DecorationImage(
                                        image: swipingImageIndex != null
                                            ? NetworkImage(
                                                'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(user.images![controller.currentUserImageIndex])}?alt=media')
                                            : NetworkImage(
                                                'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(user.images![pageController != null ? index : 0])}?alt=media'),
                                        fit: BoxFit.cover)),
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
                                            pageController != null ? "${controller.currentRecommendedUserDistance} km uzakta" : "- km uzakta",
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
                                          margin: EdgeInsets.only(left: Dimensions.w11),
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
                                      return  Row(
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
                                            "${controller.currentRecommendedUserDistance} km uzaklıkta",
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
                                          children: List.generate(controller.currentRecommendedUsersInterests.length, (index){
                                            return SwipeProfileCardInfoPill(
                                              isSame: controller.currentUser!.interests!.contains(controller.currentRecommendedUsersInterests[index].interest_type),
                                              text:  controller.currentRecommendedUsersInterests[index].text!,
                                            );
                                          }) 
                                        ),
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
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/location_white.png"),
                                                    fit: BoxFit.contain)),
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
                                  onTap: () {
                                    Get.lazyPut(() => UserDetailController(
                                      firestoreService: Get.find(),
                                      userID: controller
                                          .recommendedUsers!.last.userID!,
                                      newMatcherController: controller,
                                      matchService: Get.find()
                                    ));
                                    Get.toNamed(Routes.userDetail);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w42),
                                    width: Dimensions.h36,
                                    height: Dimensions.h36,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/expand_icon.png"),
                                            fit: BoxFit.contain)),
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
                                  onTap: () {
                                    controller.previousUser();
                                  },
                                  child: Container(
                                    width: Dimensions.w42,
                                    height: Dimensions.w42,
                                    child: Image.asset(
                                      "assets/images/matcher_back.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    controller.dislikeUser(true);
                                  },
                                  child: Container(
                                    width: Dimensions.h58,
                                    height: Dimensions.h58,
                                    child: Image.asset(
                                      "assets/images/matcher_dislike.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Modals().curvyLikeModal(controller
                                        .recommendedUsers!.last.userID!);
                                  },
                                  child: Container(
                                    width: Dimensions.h45,
                                    height: Dimensions.h45,
                                    child: Image.asset(
                                      "assets/images/matcher_superlike.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    controller.likeUser(true);
                                  },
                                  child: Container(
                                    width: Dimensions.h58,
                                    height: Dimensions.h58,
                                    child: Image.asset(
                                      "assets/images/matcher_like.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.buyCurvyTurbo);
                                  },
                                  child: Container(
                                    width: Dimensions.w42,
                                    height: Dimensions.w42,
                                    child: Image.asset(
                                      "assets/images/matcher_turbo.png",
                                      fit: BoxFit.contain,
                                    ),
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
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/report.png"),
                                  fit: BoxFit.contain)),
                        ),
                        Container(
                          width: Dimensions.h27,
                          height: Dimensions.h27,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/share.png"),
                                  fit: BoxFit.contain)),
                        )
                      ],
                    ),
                  ),
                  controller.swipe == Swipe.none || pageController == null ?
                  Container() :
                  controller.swipe == Swipe.left ?
                  Positioned(
                    top: Dimensions.h137,
                    right: Dimensions.w25,
                    child: TagWidget(
                      text: "HAYIR",                      
                    )
                  ) : Positioned(
                    top: Dimensions.h137,
                    left: Dimensions.w25,
                    child: TagWidget(
                      text: "EVET",                      
                    )
                  ),
                  
                ],
              ))
          : Container();
    });
  }
}
