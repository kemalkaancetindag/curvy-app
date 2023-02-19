import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/ui/widgets/matcher_style_user_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MatcherStyle extends StatelessWidget {
  MatcherStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatcherController>(builder: (controller) {
      
      if (Get.find<ExpandedMatcherStyleController>().user == null) {        

        return !controller.isLoading ?( controller.cards != null
            ? (controller.cards!.isEmpty
                ? Container(
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
                                                                  'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.notFoundCurrentUser!.images![0])}?alt=media'),
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
                                  "${controller.userDistancePreference!.toInt()}km",
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
                                    value: controller.userDistancePreference!,
                                    onChanged: (double value) {
                                      controller.setDistancePreference(value);
                                    },
                                  )),
                            ),
                          ]),
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.updateDistancePreference();
                            controller.getCards();
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
                  )
                : Stack(
                    children: controller.cards!,
                  ))
            : Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFD51CFF),
                  ),
                ),
              ) ) : Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFD51CFF),
                  ),
                ),
              );
      }

      return GetBuilder<ExpandedMatcherStyleController>(builder: (controller) {
        return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onPanDown: (details) {
                      controller.carouselController(details.globalPosition.dx);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.h42),
                      height: Dimensions.h520,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                      ),
                      child: Stack(
                          clipBehavior: Clip.none,
                          children: controller.imageCarousel ?? []),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.h14, bottom: Dimensions.h16),
                      padding: EdgeInsets.only(
                          left: Dimensions.w17, right: Dimensions.w17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: Dimensions.w120 / 10,
                                height: Dimensions.h12,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h12 / 2),
                                    color: Color(0xFF05ED00)),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(left: Dimensions.w8 / 2),
                                child: Center(
                                  child: Text(
                                    "${controller.user!.name!.split(" ")[0]},${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.h36,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: Dimensions.w8),
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/confirm_icon.png"),
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.h16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/home_icon.png"),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                        child: Text(
                                      "İstanbul, Bakırköy, İncirli",
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontSize: Dimensions.h16),
                                    )),
                                  )
                                ],
                              )),
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.h12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/location_icon.png"),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                        child: Text(
                                      "${controller.distance ?? ""} km uzaklıkta",
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontSize: Dimensions.h16),
                                    )),
                                  )
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: Dimensions.h16),
                            child: Text(
                              "HAKKIMDA",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: Dimensions.h8),
                            child: Text(
                              controller.user!.about!,
                              style: TextStyle(color: Color(0xFF7B8491)),
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    width: 340,
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.w17, right: Dimensions.w17),
                      margin: EdgeInsets.only(top: Dimensions.h16),
                      child: Row(
                        children: [
                          Text(
                            "İLGİ ALANLARIM",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: Dimensions.h21),
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: Dimensions.h16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: Dimensions.w155,
                                    height: Dimensions.h45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h300 / 10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/camera.png"),
                                        Text(
                                          "Photography",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Dimensions.h16),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: Dimensions.w155,
                                    height: Dimensions.h45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h300 / 10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/camera.png"),
                                        Text(
                                          "Photography",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Dimensions.h16),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                            bottom: BorderSide(
                                color: Color(0xFFC5C5C7), width: 1))),
                    width: 340,
                    height: Dimensions.h120,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              primary: Colors.black.withOpacity(0.2),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Profili Paylaş",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              primary: Colors.black.withOpacity(0.2),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Profili Paylaş",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.h27, bottom: Dimensions.h27),
                    width: 340,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(52 / 2),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child:
                                Image.asset("assets/images/matcher_back.png"),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child: Image.asset(
                                "assets/images/matcher_dislike.png"),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child: Image.asset(
                                "assets/images/matcher_superlike.png"),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child:
                                Image.asset("assets/images/matcher_like.png"),
                          ),
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(52 / 2),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 6,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child:
                                Image.asset("assets/images/matcher_turbo.png"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
      });
    });
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
