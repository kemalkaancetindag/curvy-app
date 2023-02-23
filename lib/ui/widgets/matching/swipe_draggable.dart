import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';
import 'package:curvy_app/enums/swipe.dart';
import 'package:curvy_app/ui/widgets/matching/swipe_profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SwipeDraggable extends StatelessWidget {

  PageController? pageController;
  int userIndex;

  SwipeDraggable({
    super.key,
    this.pageController,
    required this.userIndex
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewMatcherController>(
      builder: (controller) {
        return LayoutBuilder(builder: (context, constraints) {
      
      return Draggable(        
        data: "DONE",
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (((-1 * dragUpdateDetails.delta.dx) <
                  (-1 * dragUpdateDetails.delta.dy)) ||
              dragUpdateDetails.delta.dx == 0) {
                controller.setSwipe(Swipe.none);
              }
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
                    controller.setSwipe(Swipe.left);
                  }
          // When Draggable widget is dragged left
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
                    controller.setSwipe(Swipe.right);
                  }
        },
        onDragEnd: (drag) {
          
        },
        child: SwipePofileCard(          
          pageController: pageController,
          user: controller.recommendedUsers![userIndex],          
        ),
        feedback: Material(
            color: Colors.transparent,
            child: RotationTransition(
              turns: controller.swipe == Swipe.none 
              ? AlwaysStoppedAnimation(0) 
              : controller.swipe == Swipe.left ?  AlwaysStoppedAnimation(-15/360) :  AlwaysStoppedAnimation(15/360), 
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SwipePofileCard(                   
                   swipingImageIndex: controller.currentUserImageIndex,
                   pageController: pageController != null ? pageController : null,
                   user: controller.recommendedUsers![userIndex],
                                      
                ),
              ),
            )),
        childWhenDragging: Container(
          color: Colors.transparent,
        )
      );
    });
      }
    );
  }
}
