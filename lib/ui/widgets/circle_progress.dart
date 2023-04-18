import 'dart:math';
import 'dart:ui' as ui;
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleProgress extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    Paint circle = Paint()
      ..strokeWidth = 5
      ..color = Color(0xFFD9D9D9)
      ..style = PaintingStyle.stroke;

    //Get.find<IndexPageController>().compilation!
    double angle = 2 * pi * ( 30 / 100);
    print(angle);
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = Dimensions.h9*10;

    final rect =  Rect.fromCircle(center: center, radius: radius);
    
    final gradient =  SweepGradient(
      startAngle: pi/2,
      endAngle: angle,
      tileMode: TileMode.decal,
      colors: [Color(0xFFD51CFF),Color(0xFF00FFE1)],
    );

    Paint animationArc = Paint()
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color(0xFF00FFE1);

  

    canvas.drawCircle(center, radius, circle);


    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi/2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
