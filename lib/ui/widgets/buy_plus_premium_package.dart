import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BuyPlusPremiumPackage extends StatelessWidget {
  final String title;
  final String duration;
  final String cost;
  final String discount;
  final String totalCost;
  int currentPage;
  final int pageIndex;
  bool isPlus;

  BuyPlusPremiumPackage(
      {super.key,
      required this.title,
      required this.duration,
      required this.cost,
      required this.discount,
      required this.totalCost,
      required this.currentPage,
      required this.pageIndex,
      required this.isPlus});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: currentPage == pageIndex ? 0.95 : 0.85,
      child: CustomPaint(
        painter: GradientBorder(
            isPlus: isPlus, pageIndex: pageIndex, currentPage: currentPage),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.w11),
          width: double.maxFinite,
          height: Dimensions.h27 * 8,
          child: Column(
            children: [
              CustomPaint(
                painter: HeaderPainter(
                    isPlus: isPlus,
                    currentPage: currentPage,
                    pageIndex: pageIndex),
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.h42,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: Dimensions.h100,
                child: Center(
                    child: currentPage == pageIndex
                        ? ( isPlus ? ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => LinearGradient(colors: [
                              Color(0xFFD51CFF),
                              Color(0xFF6198EF)
                            ]).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ) ,
                            child: Text(duration,
                                style: TextStyle(
                                    fontSize: Dimensions.h90,
                                    fontWeight: FontWeight.bold)),
                          )  :  Text(duration,
                                style: TextStyle(
                                    fontSize: Dimensions.h90,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)))
                        : Text(duration,
                            style: TextStyle(
                                fontSize: Dimensions.h90,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC5C5C7)))),
              ),
              Container(
                width: Dimensions.w120 + Dimensions.w11,
                height: Dimensions.h300 / 10,
                decoration: BoxDecoration(
                    color: currentPage != pageIndex ? Color(0xFFC5C5C7) : null,
                    borderRadius: BorderRadius.circular(Dimensions.h17),
                    gradient: currentPage == pageIndex
                        ? ( isPlus ? LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)]) :  LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ]) )
                        : null),
                child: Center(
                  child: Text(
                    "Aylık Paket",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.h9, bottom: Dimensions.h9),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "₺",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: currentPage == pageIndex
                                  ? Color(0xFF808080)
                                  : Color(0xFFC5C5C7),
                              fontSize: Dimensions.h14,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: cost,
                          style: TextStyle(
                              color: currentPage == pageIndex
                                  ? Color(0xFF808080)
                                  : Color(0xFFC5C5C7),
                              fontSize: Dimensions.h14,
                              fontWeight: FontWeight.bold))
                    ]),
                  )),
              SizedBox(
                height: 2,
                width: Dimensions.w120 + Dimensions.w11,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          currentPage != pageIndex ? Color(0xFFC5C5C7) : (isPlus ? null : Colors.black),
                      gradient: currentPage == pageIndex
                          ? ( isPlus ? LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF6198EF)]) : null)
                          : null),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.h9 / 2, bottom: Dimensions.h9 / 2),
                width: Dimensions.w120 + Dimensions.w11,
                child: Center(
                  child: currentPage == pageIndex
                      ? ( isPlus ?  ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => LinearGradient(colors: [
                            Color(0xFFD51CFF),
                            Color(0xFF6198EF)
                          ]).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(discount,
                              style: TextStyle(
                                  fontSize: Dimensions.h14,
                                  fontWeight: FontWeight.bold)),
                        ) : Text(discount,
                          style: TextStyle(
                              fontSize: Dimensions.h14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)))
                      : Text(discount,
                          style: TextStyle(
                              fontSize: Dimensions.h14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC5C5C7))),
                ),
              ),
              SizedBox(
                height: 2,
                width: Dimensions.w120 + Dimensions.w11,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          currentPage != pageIndex ? Color(0xFFC5C5C7) : ( isPlus ? null : Colors.black),
                          
                      gradient: currentPage == pageIndex
                          ? ( isPlus ? LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF6198EF)]) : null)
                          : null),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.h9 / 2, bottom: Dimensions.h9 / 2),
                width: Dimensions.w120 + Dimensions.w11,
                child: Center(
                  child: currentPage == pageIndex
                      ? ( isPlus ?  ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => LinearGradient(colors: [
                                Color(0xFFD51CFF),
                                Color(0xFF6198EF)
                              ]).createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height),
                              ),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "₺",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: totalCost,
                                  style: TextStyle(
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold))
                            ]),
                          )) : RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "₺",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: totalCost,
                                  style: TextStyle(
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ]),
                          ))
                      : RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "₺",
                                style: TextStyle(
                                    color: Color(0xFFC5C5C7),
                                    fontFamily: "Roboto",
                                    fontSize: Dimensions.h21,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: totalCost,
                                style: TextStyle(
                                    color: Color(0xFFC5C5C7),
                                    fontSize: Dimensions.h21,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientBorder extends CustomPainter {
  int pageIndex;
  int currentPage;
  bool isPlus;

  GradientBorder(
      {required this.pageIndex,
      required this.currentPage,
      required this.isPlus});

  @override
  void paint(Canvas canvas, Size size) {
    Rect gradientRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height);
    RRect gradientBorder = RRect.fromRectAndRadius(
        gradientRect, Radius.circular(Dimensions.h50 / 2));

    Paint gradientPaint = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
          .createShader(gradientRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Paint nonActive = Paint()
      ..color = Color(0xFFC5C5C7)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    Paint platiniumPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    if (currentPage == pageIndex) {
      if (isPlus) {
        canvas.drawRRect(gradientBorder, gradientPaint);
      } else {
        canvas.drawRRect(gradientBorder, platiniumPaint);
      }
    } else {
      canvas.drawRRect(gradientBorder, nonActive);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPainter extends CustomPainter {
  int pageIndex;
  int currentPage;
  bool isPlus;

  HeaderPainter(
      {required this.pageIndex,
      required this.currentPage,
      required this.isPlus});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width + Dimensions.w2 * 10,
        height: size.height);
    RRect gradientBorder = RRect.fromRectAndCorners(rect,
        topLeft: Radius.circular(Dimensions.h50 / 2),
        topRight: Radius.circular(Dimensions.h50 / 2));

    late Paint gradientPaint;

    if (currentPage == pageIndex) {
      if (isPlus) {
        gradientPaint = Paint()
          ..shader =
              LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
                  .createShader(rect);
      } else {
        gradientPaint = Paint()
          ..shader = LinearGradient(
                  colors: [Colors.black, Color(0xFF2E2B2B), Colors.black])
              .createShader(rect);
      }
    } else {
      gradientPaint = Paint()..color = Color(0xFFC5C5C7);
    }

    canvas.drawRRect(gradientBorder, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
