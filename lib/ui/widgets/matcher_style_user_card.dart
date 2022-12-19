import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/slider_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MatcherStyleUserCard extends StatelessWidget {
  String controllerTag;  
  MatcherStyleUserCard({super.key, required this.controllerTag});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        bottom: Get.find<SliderController>(tag: controllerTag).bottom,
        top: Get.find<SliderController>(tag: controllerTag).top,
        left: Get.find<SliderController>(tag: controllerTag).left,
        right: Get.find<SliderController>(tag: controllerTag).right,
        child: GestureDetector(
            onTap: () {    
              Get.find<SliderController>(tag: controllerTag).controlCarousel();        
            },
            onPanDown: (details){
              Get.find<SliderController>(tag: controllerTag).setTapGlobalLocation(details.localPosition.dx, details.localPosition.dy);
            },
            onVerticalDragUpdate: (details) {
              Get.find<SliderController>(tag: controllerTag)
                  .dragVertical(details.delta.dy, details.globalPosition.dy);
            },
            onVerticalDragEnd: (details) {
              Get.find<SliderController>(tag: controllerTag).decideVerticalAction();
              Get.find<SliderController>(tag: controllerTag).resetPosition();
            },
            onHorizontalDragUpdate: (details) {
              Get.find<SliderController>(tag: controllerTag)
                  .dragHorizontal(details.delta.dx, details.globalPosition.dx);
            },
            onHorizontalDragEnd: (details) {              
              Get.find<SliderController>(tag: controllerTag).decideHorizontalAction();
            },
            child: Transform.rotate(
              angle: Get.find<SliderController>(tag: controllerTag).angle,
              child: Container(
                child: Stack(
                    children: Get.find<SliderController>(tag: controllerTag)
                            .imageWidgets ??
                        []),
              ),
            )),
        duration: Duration(
            milliseconds: Get.find<SliderController>(tag: controllerTag)
                .animationDuration));
  }
}
