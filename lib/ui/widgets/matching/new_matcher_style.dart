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
          return !controller.isLoading ? ( !controller.recommendedUsers!.isEmpty  ? Stack(
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
                  top: -Dimensions.h300,
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
                  bottom: -Dimensions.h300,
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
          ) : Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.h300 + Dimensions.h21,
                          
                          child: Stack(
                            children: [
                              Positioned(
                                left: (Get.width/2)-(Dimensions.h100/2),
                                top: Dimensions.h50,
                                child: CustomPaint(
                                  painter: CircleWaves(),
                                  child: Container(
                                    width: Dimensions.h100,
                                    height: Dimensions.h100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.h100/2),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                                                  'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent("")}?alt=media'),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                )
                              ),
                              Positioned(
                                top: Dimensions.h148+Dimensions.h40,
                                left: (Get.width/2) - ((Dimensions.w300 - Dimensions.w11)/2),
                                child: Container(
                                  color: Colors.white.withOpacity(0.8),
                                  width: Dimensions.w300 - Dimensions.w11,
                                  

                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Bulunduğunuz konum ve tercih ettiğiniz kapsama alanı içerisindeki kriterlerinize uygun adaylarımızın tamamını gördünüz. Kapsama alanınızı",
                                      style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " genişleterek",
                                           style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14,
                                        fontWeight: FontWeight.bold
                                      ),
                                        ),
                                        TextSpan(
                                      text: " veya kriterlerinizi ",
                                      style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14
                                      )
                                      ),
                                       TextSpan(
                                          text: "değiştirerek",
                                           style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14,
                                        fontWeight: FontWeight.bold
                                      ),
                                        ),
                                         TextSpan(
                                      text: " yeni birileriyle tanışabilirsiniz yada ",
                                      style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14
                                      )
                                      ),
                                      TextSpan(
                                      text: "FREESTYLE",
                                      style: TextStyle(
                                        color: Color(0xFFD51CFF),
                                        fontSize: Dimensions.h14,
                                        decoration: TextDecoration.underline
                                      )
                                      ),
                                      TextSpan(
                                      text: " modunu deneyebiliriz",
                                      style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h14
                                      )
                                      ),
                                      ]
                                    ),
                                    
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          padding:
                              EdgeInsets.symmetric(horizontal: Dimensions.w17),
                          margin: EdgeInsets.only(top: Dimensions.h27),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kapsama alanını genişlet:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${controller.currentUserDistancePreference!.toInt()}km",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Container(
                              width: double.maxFinite,
                              child: SliderTheme(
                                  data: SliderThemeData(
                                    inactiveTrackColor: Color(0xFFC5C5C7),
                                    thumbColor: Colors.white,
                                    trackShape: GradientRectSliderTrackShape(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF00FFE1)
                                      ]),
                                    ),
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: controller.currentUserDistancePreference!,
                                    onChanged: (double value) {
                                     controller.setCurrentUserDistancePreference(value);
                                    },
                                  )),
                            ),
                          ]),
                        ),
                        GestureDetector(
                          onTap: (){  
                              controller.changeDistanceAndReload();     
                          },
                          child:    Container(
                          margin: EdgeInsets.only(top: Dimensions.h27),
                          width: Dimensions.w300,
                          height: Dimensions.h50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 2),
                              gradient: LinearGradient(colors: [
                                Color(0xFFD51CFF),
                                Color(0xFF00FFE1)
                              ])),
                          child: Center(
                            child: Text(
                              "TAMAM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.settings);
                          },
                          child:   Container(
                          margin: EdgeInsets.only(top: Dimensions.h17),
                          width: Dimensions.w300,
                          height: Dimensions.h50,
                          child: CustomPaint(
                            painter: GradientBorder(),
                            child: Center(
                                child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Color(0xFFD51CFF),
                                    Color(0xFF6198EF)
                                  ]).createShader(
                                Rect.fromLTWH(
                                    0, 0, bounds.width, bounds.height),
                              ),
                              child: Text("AYARLARA GİT",
                                  style: TextStyle(
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold)),
                            )),
                          ),
                        ),
                        ),
                      
                      ],
                    ),
                  ) ):  Center(
            child: CircularProgressIndicator(
              color: Color(0xFFD51CFF),
            ),
          );
        },
      ),
     
    );
  }
}


class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const GradientRectSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
    Offset? secondaryOffset = null
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0);

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor)
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}

class GradientBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect gradientRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height);
    RRect gradientBorder = RRect.fromRectAndRadius(
        gradientRect, Radius.circular(Dimensions.h50 / 2));
    Paint paint = new Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
          .createShader(gradientRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRRect(gradientBorder, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleWaves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint()
    ..color = Color(0xFFC5C5C7)    
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

    Rect gradientRect = Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: size.height/2);
    RRect gradientBorder = RRect.fromRectAndRadius(gradientRect, Radius.circular(size.height/2));
    

    Paint circleBorderPaint = Paint()
    ..shader = LinearGradient(
      colors: [
        Color(0xFFD51CFF),
        Color(0xFF00FFE1)
      ]
    ).createShader(gradientRect)
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;


    canvas.drawRRect(gradientBorder, circleBorderPaint);
    canvas.drawCircle(Offset(size.width/2, size.height/2), (size.height/2)+Dimensions.h16, circlePaint);
    canvas.drawCircle(Offset(size.width/2, size.height/2), (size.height/2)+(Dimensions.h16*2), circlePaint);
    canvas.drawCircle(Offset(size.width/2, size.height/2), (size.height/2)+(Dimensions.h16*3), circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
