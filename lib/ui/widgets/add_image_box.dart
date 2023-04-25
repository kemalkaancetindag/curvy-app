import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:io';
class AddImageBox extends StatelessWidget {
  final int index;
  AddImageBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetupController>(builder: (controller) {
      return Container(
          width: Dimensions.w99,
          height: Dimensions.h137,
          decoration: BoxDecoration(
            image: controller.images[index] != ""
                ? DecorationImage(image: FileImage(File(controller.images[index])), fit: BoxFit.cover,)
                : null,
            
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(Dimensions.h8)
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: -Dimensions.h100/10,
                right: -Dimensions.h100/10,
                child: Container(
                  width: Dimensions.w31,
                  height: Dimensions.w31,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Dimensions.w31 / 2)),
                  child: Center(
                    child: SvgPicture.asset("assets/svg/setup/plus.svg"),
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
