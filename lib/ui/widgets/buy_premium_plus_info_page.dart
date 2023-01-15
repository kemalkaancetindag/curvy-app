import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuyPremiumPlusInfoPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final bool isWithImage;
  final bool isPlus;
  const BuyPremiumPlusInfoPage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.isWithImage,
    required this.isPlus
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: isPlus ? LinearGradient(
          colors: [
            Color(0xFFD51CFF),
            Color(0xFF6198EF)
          ]
        ) :  LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ])
      ),
      child: Column(
        children: [
          isWithImage ?
          Container(
            margin: EdgeInsets.only(top: Dimensions.h16, bottom: Dimensions.h9),
            child: Image.asset(image),
          ) : 
          Container(
            width: Dimensions.w60,
            height: Dimensions.h36,
            
            margin: EdgeInsets.only(top: Dimensions.h16,bottom: Dimensions.h31 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.h100/5)
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.w2),
                  width: Dimensions.h31,
                  height: Dimensions.h31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h31/2),
                    gradient: isPlus ?  LinearGradient(
                      colors: [
                        Color(0xFFD51CFF),
                        Color(0xFF6198EF)
                      ]
                    ) : LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ])
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.h50/2,
                fontWeight: FontWeight.bold
              ),
            ),            
          ),
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.h21,

              ),
            ),
          )
        ],
      ),
    );
  }
}