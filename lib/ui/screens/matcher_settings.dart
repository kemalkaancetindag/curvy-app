import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MatcherSettingsScreen extends StatelessWidget {
  const MatcherSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black.withOpacity(0.4),
            size: Dimensions.h27,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Keşfet Ayarları",
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.h21,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.black.withOpacity(0.4)),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Tamam",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: Dimensions.h16,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: Dimensions.h66,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h12, left: Dimensions.h100 / 10),
                        child: Text(
                          "Konum",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimensions.h40,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Şu Anki Konumum",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.h16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Muratpaşa, Antalya",
                                style: TextStyle(
                                    color: Color(0xFF7B8491),
                                    fontSize: Dimensions.h16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.h100 / 10,
                            right: Dimensions.h100 / 10),
                        child: Center(
                          child: Image.asset("assets/images/chevron_right.png"),
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),
            Container(
              height: Dimensions.h148,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.h100 / 10),
              margin: EdgeInsets.only(bottom: Dimensions.h16),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.h21, bottom: Dimensions.h100 / 10),
                    child: Row(
                      children: [
                        Text(
                          "Mesafe Tercihi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: SliderTheme(
                        data: SliderThemeData(
                          inactiveTrackColor: Color(0xFFC5C5C7),
                          thumbColor: Colors.white,                          
                          trackShape: GradientRectSliderTrackShape(                            
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFD51CFF),
                                  Color(0xFF00FFE1)
                                ]
                              ),
                              
                            ),
                        ),
                        child: Slider(
                          min: 0,
                          max: 10,
                          value: 2,
                          onChanged: (double value) {},
                        )),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sadece bu aralıktaki kişileri göster",
                          style: TextStyle(
                            color: Color(0xFF7B8491),
                            fontSize: Dimensions.h16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        CupertinoSwitch(
                          value: true, 
                          onChanged: (value){

                          }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
                SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),

            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.h100/10),
              margin: EdgeInsets.symmetric(vertical: Dimensions.h16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bana Göster",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.h16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                   children: [
                    Text(
                      "Kadın",
                      style: TextStyle(
                        color: Color(0xFF7B8491),
                        fontSize: Dimensions.h16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Dimensions.h100/10),
                      child: Image.asset("assets/images/chevron_right.png"),
                    )
                    
                   ],
                  )
                ],
              ),
            ),
             SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),
                          Container(
              height: Dimensions.h148,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.h100 / 10),
              margin: EdgeInsets.only(bottom: Dimensions.h16),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.h21, bottom: Dimensions.h100 / 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mesafe Tercihi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "22-90+",
                          style: TextStyle(
                             color: Color(0xFF7B8491),
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: SliderTheme(
                        data: SliderThemeData(
                          inactiveTrackColor: Color(0xFFC5C5C7),
                          thumbColor: Colors.white,                          
                          rangeTrackShape: GradientRectRangeSliderTrackShape(                            
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFD51CFF),
                                  Color(0xFF00FFE1)
                                ]
                              ),
                              
                            ),
                        ),
                        child: RangeSlider(

                          values: RangeValues(0.2,0.5),
                          onChanged: (value) {
                            
                          },
                          
                          onChangeEnd: (value) {
                            
                          },
                          onChangeStart: (value) {
                            
                          },
                        )),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sadece bu aralıktaki kişileri göster",
                          style: TextStyle(
                            color: Color(0xFF7B8491),
                            fontSize: Dimensions.h16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        CupertinoSwitch(
                          value: true, 
                          onChanged: (value){

                          }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          
              SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.h16),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.h100/10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Küresel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.h16,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      CupertinoSwitch(
                        value: true, 
                        onChanged: (value){
                          
                        }
                      )
                    ],
                  ),
                ),
                 SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.h16),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.h100/10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sadece Doğrulanmış Profiller",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.h16,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      CupertinoSwitch(
                        value: true, 
                        onChanged: (value){
                          
                        }
                      )
                    ],
                  ),
                ),
                   SizedBox(
                height: 1,
                width: Dimensions.w35 * 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                )),
          ],
        ),
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

class GradientRectRangeSliderTrackShape extends RangeSliderTrackShape {
  const GradientRectRangeSliderTrackShape({
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
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    assert(
      sliderTheme.overlayShape != null,
      'sliderTheme.overlayShape is required'
    );
    assert(
      sliderTheme.trackHeight != null,
      'sliderTheme.trackHeight is required'
    );

    final double overlayWidth = sliderTheme.overlayShape!
      .getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight!;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop = offset.dy
        + (parentBox.size.height - trackHeight) / 2;
    final double trackRight = trackLeft + parentBox.size.width - overlayWidth;
    final double trackBottom = trackTop + trackHeight;
    return Rect.fromLTRB(
      math.min(
        trackLeft,
        trackRight
      ),
      trackTop,
      math.max(
        trackLeft,
        trackRight
      ),
      trackBottom
    );
  }

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required Offset startThumbCenter,
        required Offset endThumbCenter,
        bool isEnabled = false,
        bool isDiscrete = false,
        required TextDirection textDirection,
        double additionalActiveTrackHeight = 2,
      }) {
    assert(
      sliderTheme.disabledActiveTrackColor != null,
      'sliderTheme.disabledActiveTrackColor is required'
    );
    assert(
      sliderTheme.disabledInactiveTrackColor != null,
      'sliderTheme.disabledInactiveTrackColor is required'
    );
    assert(
      sliderTheme.activeTrackColor != null,
      'sliderTheme.activeTrackColor is required'
    );
    assert(
      sliderTheme.inactiveTrackColor != null,
      'sliderTheme.inactiveTrackColor is required'
    );
    assert(
      sliderTheme.rangeThumbShape != null,
      'sliderTheme.rangeThumbShape iss required'
    );
    assert(
      sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0,
      'sliderTheme.trackHeight != null and sliderTheme.trackHeight! > 0'
        'are required'
    );

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
          begin: sliderTheme.disabledInactiveTrackColor,
          end: sliderTheme.inactiveTrackColor,
        )
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Offset leftThumbOffset;
    final Offset rightThumbOffset;
    switch (textDirection) {
      case TextDirection.ltr:
        leftThumbOffset = startThumbCenter;
        rightThumbOffset = endThumbCenter;
        break;
      case TextDirection.rtl:
        leftThumbOffset = endThumbCenter;
        rightThumbOffset = startThumbCenter;
        break;
    }
    final Size thumbSize = sliderTheme.rangeThumbShape!
      .getPreferredSize(
        isEnabled,
        isDiscrete
      );
    final double thumbRadius = thumbSize.width / 2;
    assert(thumbRadius > 0);

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        leftThumbOffset.dx,
        trackRect.bottom,
        topLeft: trackRadius,
        bottomLeft: trackRadius,
      ),
      inactivePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        leftThumbOffset.dx,
        trackRect.top - (additionalActiveTrackHeight / 2),
        rightThumbOffset.dx,
        trackRect.bottom + (additionalActiveTrackHeight / 2),
      ),
      activePaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        rightThumbOffset.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
      ),
      inactivePaint,
    );
  }
}
