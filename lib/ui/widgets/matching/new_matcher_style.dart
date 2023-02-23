import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/enums/swipe.dart';
import 'package:curvy_app/ui/util/modals.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:curvy_app/ui/widgets/matching/swipe_draggable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class NewMatcherStyle extends StatelessWidget {
  NewMatcherStyle({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: GetBuilder<NewMatcherController>(
        builder: (controller) {
          return !controller.isLoading ? Stack(
            clipBehavior: Clip.none,
            children: [
              Stack(
                children:
                    List.generate(controller.recommendedUsers!.length, (index) {
                  if (index == controller.recommendedUsers!.length - 1) {
                    return PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            const Rect.fromLTWH(0, 0, 250, 400),
                            const Size(250, 400)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(
                              controller.swipe == Swipe.left ? -300 : 300, 
                              0, 
                              250, 
                              400
                              ),
                            const Size(250, 400)),
                      ).animate(CurvedAnimation(
                        parent: controller.animationController,
                        curve: Curves.easeInOut,
                      )),
                      child: RotationTransition(
                        turns: Tween<double>(begin: 0, end: controller.swipe == Swipe.left ? -0.1 * 0.3 : 0.1 * 0.3 ).animate(
                          CurvedAnimation(
                            parent: controller.animationController,
                            curve:
                                const Interval(0, 0.4, curve: Curves.easeInOut),
                          ),
                        ),
                        child: SwipeDraggable(
                          pageController: controller.mainPageController,
                          userIndex: index,
                        ),
                      ),
                    );
                  } else {
                    return SwipeDraggable(                      
                      userIndex: index,
                    );
                  }
                }),
              ),
              Positioned(
                  left: 0,
                  top: -Dimensions.h100,
                  right: 0,
                  child: DragTarget(
                    onAccept: (data) {
                      
                      Modals().curvyLikeModal(
                          controller.recommendedUsers!.last.userID!);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return IgnorePointer(
                        child: Container(
                          
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      );
                    },
                  )),
              Positioned(
                  left: 0,
                  bottom: -Dimensions.h100,
                  right: 0,
                  child: DragTarget(
                    onAccept: (data) {
                      Modals().curvyChipModal(
                          controller.recommendedUsers!.last.userID!);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return IgnorePointer(
                        child: Container(
                          
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                      );
                    },
                  )),
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: DragTarget(
                    onAccept: (data) {
                      controller.dislikeUser(false);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return IgnorePointer(
                        child: Container(
                          width: Dimensions.w8*10,
                        ),
                      );
                    },
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: DragTarget(
                    onAccept: (data) {
                      
                      controller.likeUser(false);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return IgnorePointer(
                        child: Container(
                          width: Dimensions.w8 * 10,
                        ),
                      );
                    },
                  )),
            ],
          ) : Center(
            child: CircularProgressIndicator(
              color: Color(0xFFD51CFF),
            ),
          );
        },
      ),
     
    );
  }
}

class StyleChangerContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = 25.0;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      Radius.circular(r),
    );
    var paint1 = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
          .createShader(Rect.fromCenter(
              center: Offset(w / 2, h / 2), width: w, height: h))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(fullRect, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
