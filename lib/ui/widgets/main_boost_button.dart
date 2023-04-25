import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBoostButton extends StatelessWidget {
  final double width;
  final String icon;
  final String text;
  final int count;
  final LinearGradient background;
  MainBoostButton(
      {super.key,
      required this.width,
      required this.icon,
      required this.text,
      required this.count,
      required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.h8 * 10,
      width: width,
      margin: EdgeInsets.only(bottom: Dimensions.h100 / 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.h90), bottomRight: Radius.circular(Dimensions.h90)),
        border: Border.all(color: Colors.white, width: 2),

        gradient: background
      ),
      child: Center(
          child: Stack(
        children: [
          Positioned(
            top: Dimensions.h17,
            right: Dimensions.w2*10,
            child:Container(
              width: Dimensions.w9*2,
              height: Dimensions.h9,
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.h9
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.w9/2),
                color: Color(0xFFFF0000)
              ),
            ), 
          ),
          
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Container(
                height: Dimensions.h40,
                width: Dimensions.h40,
                child: SvgPicture.asset(icon),
               ),
                RichText(
                    text: TextSpan(
                        text: "Curvy", children: [TextSpan(text: text)])),
              ],
            ),
          )
        ],
      )),
    );
  }
}
