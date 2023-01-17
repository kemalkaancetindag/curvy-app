import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui' as ui;

class BuyBoostPackageCard extends StatelessWidget {
  final String title;
  final String mainImage;
  final int amount;
  final String packageName;
  final String cost;
  final bool withBorder;
  final ui.Image packageCustomBorderActiveImage;
  final ui.Image? packageCustomBorderPassiveImage;
  final LinearGradient? borderGradient;
  final List<Color>? borderWithImageGradient;
  final int pageIndex;
  final int currentPage;
  final Color? borderWithImageColor;

  const BuyBoostPackageCard(
      {super.key,
      required this.title,
      required this.mainImage,
      required this.amount,
      required this.packageName,
      required this.cost,
      required this.withBorder,
      required this.packageCustomBorderActiveImage,
      this.packageCustomBorderPassiveImage,
      this.borderGradient,
      this.borderWithImageGradient,
      required this.currentPage,
      required this.pageIndex,
      this.borderWithImageColor});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: currentPage == pageIndex ? 0.95 : 0.85,
        child: CustomPaint(
          painter: GradientBorder(
              gradient: borderGradient,
              strokeWidth: 4,
              currentPage: currentPage,
              pageIndex: pageIndex,
              withBorder: withBorder),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h16),
                gradient: !withBorder
                    ? LinearGradient(
                        colors: [Colors.black, Color(0xFF2E2B2B), Colors.black])
                    : null),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: Dimensions.h9, top: Dimensions.h9),
                  child: currentPage == pageIndex
                      ? (withBorder
                          ? ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) =>
                                  borderGradient!.createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height),
                              ),
                              child: Text(title,
                                  style: TextStyle(
                                      fontSize: Dimensions.h16,
                                      fontWeight: FontWeight.bold)),
                            )
                          : Text(title,
                              style: TextStyle(
                                  fontSize: Dimensions.h16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCC9933))))
                      : (withBorder
                          ? Text(title,
                              style: TextStyle(
                                  fontSize: Dimensions.h16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC5C5C7)))
                          : Text(title,
                              style: TextStyle(
                                  fontSize: Dimensions.h16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCC9933)))),
                ),
                CustomPaint(
                  painter: BorderWithImage(
                      withBorder: withBorder,
                      isActive: currentPage == pageIndex,
                      activeImage: packageCustomBorderActiveImage,
                      passiveImage: packageCustomBorderPassiveImage,
                      borderWithImageGradient: borderWithImageGradient,
                      borderWithImageColor: borderWithImageColor),
                  child: Container(
                    width: Dimensions.w140,
                    height: Dimensions.h209 + (Dimensions.h100 / 10),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(mainImage),
                        ),
                        Container(
                          child: currentPage == pageIndex
                              ? (withBorder
                                  ? ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) =>
                                          borderGradient!.createShader(
                                        Rect.fromLTWH(
                                            0, 0, bounds.width, bounds.height),
                                      ),
                                      child: Text(amount.toString(),
                                          style: TextStyle(
                                              fontSize: Dimensions.h36,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  : Text(amount.toString(),
                                      style: TextStyle(
                                          fontSize: Dimensions.h36,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFCC9933))))
                              : ( withBorder ? Text(amount.toString(),
                                  style: TextStyle(
                                      fontSize: Dimensions.h36,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC5C5C7))) :Text(amount.toString(),
                                  style: TextStyle(
                                      fontSize: Dimensions.h36,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFCC9933))) ),
                        ),
                        Container(
                          child: currentPage == pageIndex
                              ? (withBorder
                                  ? ShaderMask(
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (bounds) =>
                                          borderGradient!.createShader(
                                        Rect.fromLTWH(
                                            0, 0, bounds.width, bounds.height),
                                      ),
                                      child: Text(packageName,
                                          style: TextStyle(
                                              fontSize: Dimensions.h100 / 5,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  : Text(packageName,
                                      style: TextStyle(
                                          fontSize: Dimensions.h100 / 5,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFCC9933))))
                              : ( withBorder ? Text(packageName,
                                  style: TextStyle(
                                      fontSize: Dimensions.h100 / 5,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC5C5C7))) : Text(packageName,
                                  style: TextStyle(
                                      fontSize: Dimensions.h100 / 5,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFCC9933)))),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h100 / 9),
                  child: currentPage == pageIndex
                      ? (withBorder
                          ? ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) =>
                                  borderGradient!.createShader(
                                    Rect.fromLTWH(
                                        0, 0, bounds.width, bounds.height),
                                  ),
                              child: RichText(
                                text: TextSpan(
                                    text: "₺",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.h230 / 10),
                                    children: [TextSpan(text: cost)]),
                              ))
                          : RichText(
                              text: TextSpan(
                                  text: "₺",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFCC9933),
                                      fontSize: Dimensions.h230 / 10),
                                  children: [TextSpan(text: cost)]),
                            ))
                      : ( withBorder ? RichText(
                          text: TextSpan(
                              text: "₺",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC5C5C7),
                                  fontSize: Dimensions.h230 / 10),
                              children: [TextSpan(text: cost)]),
                        ) : RichText(
                          text: TextSpan(
                              text: "₺",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFCC9933),
                                  fontSize: Dimensions.h230 / 10),
                              children: [TextSpan(text: cost)]),
                        )),
                )
              ],
            ),
          ),
        ));
  }
}

class GradientBorder extends CustomPainter {
  double strokeWidth;
  LinearGradient? gradient;
  int currentPage;
  int pageIndex;
  bool withBorder;

  GradientBorder(
      {required this.strokeWidth,
      this.gradient,
      required this.withBorder,
      required this.currentPage,
      required this.pageIndex});

  @override
  void paint(Canvas canvas, Size size) {
    if (withBorder) {
      Rect rect = Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height);
      RRect rRect =
          RRect.fromRectAndRadius(rect, Radius.circular(Dimensions.h16));

      Paint paint;

      paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..shader = gradient!.createShader(rect);

      if (currentPage != pageIndex) {
        paint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = Color(0xFFC5C5C7);
      }

      canvas.drawRRect(rRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BorderWithImage extends CustomPainter {
  bool isActive;
  List<Color>? borderWithImageGradient;
  Color? borderWithImageColor;
  Color? color;
  ui.Image activeImage;
  ui.Image? passiveImage;
  bool withBorder;

  BorderWithImage(
      {required this.isActive,
      this.borderWithImageGradient,
      this.color,
      required this.activeImage,
      this.passiveImage,
      this.borderWithImageColor,
      required this.withBorder});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint;

    if (borderWithImageGradient != null) {
      paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..shader = ui.Gradient.linear(Offset(0, 0),
            Offset(size.width, size.height), borderWithImageGradient!);
    } else {
      paint = Paint()
        ..color = borderWithImageColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
    }

    if (!isActive) {
      if (withBorder) {
        paint = Paint()
          ..color = Color(0xFFC5C5C7)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
      } else {
        paint = Paint()
          ..color = Color(0xFFCC9933)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
      }
    }

    Path path = Path();

    if (isActive) {
      path.moveTo(0, size.height - (size.height / 1.05));
      path.lineTo(0, size.height / 1.05);
      path.moveTo(size.width / 13, size.height);
      //(width/3)-11

      path.lineTo((size.width * 5) / 13, size.height);
      path.moveTo((size.width * 8) / 13, size.height);
      path.lineTo(size.width - (size.width / 13), size.height);

      path.moveTo(size.width, size.height / 1.05);
      path.lineTo(size.width, size.height - (size.height / 1.05));

      path.moveTo(size.width / 13, 0);
      path.lineTo((size.width * 8) / 13, 0);
      path.lineTo(size.width - (size.width / 13), 0);
      path.moveTo(size.width / 13, 0);

      path.cubicTo(0, 0, 0, 0, 0, size.height - (size.height / 1.05));
      path.moveTo(size.width - (size.width / 13), 0);
      path.cubicTo(size.width, 0, size.width, 0, size.width,
          size.height - (size.height / 1.05));
      path.moveTo(size.width, size.height / 1.05);
      path.cubicTo(size.width, size.height, size.width, size.height,
          size.width - (size.width / 13), size.height);
      path.moveTo(0, size.height / 1.05);
      path.cubicTo(
          0, size.height, 0, size.height, size.width / 13, size.height);
    } else {
      path.moveTo(0, size.height);
      path.lineTo((size.width * 5) / 13, size.height);
      path.moveTo((size.width * 8) / 13, size.height);
      path.lineTo(size.width, size.height);
    }

    canvas.drawPath(path, paint);

    if (isActive) {
      canvas.drawImage(
          activeImage,
          Offset(((size.width * 5.5) / 13),
              size.height - (activeImage.height / 2)),
          paint);
    } else {
      if (withBorder) {
        canvas.drawImage(
            passiveImage!,
            Offset(((size.width * 5.5) / 13),
                size.height - (activeImage.height / 2)),
            paint);
      } else {
        canvas.drawImage(
            activeImage,
            Offset(((size.width * 5.5) / 13),
                size.height - (activeImage.height / 2)),
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
