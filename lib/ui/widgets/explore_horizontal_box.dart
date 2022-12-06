import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExploreHorizontalBox extends StatelessWidget {
  const ExploreHorizontalBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
      
      width: double.maxFinite,
      height: Dimensions.h230,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.h16),
        image: DecorationImage(
          image: AssetImage("assets/images/explore_3.png"),
          fit: BoxFit.cover
          

        )
      ),
      child: Stack(
        children: [
          Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      gradient:  LinearGradient(
                            stops: [0.3, 1],
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                    ),
                )
              ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: Dimensions.w17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h137),
                      child: Text(
                    "Kahve Buluşması",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.h31),
                  )),
                  Container(
                     margin: EdgeInsets.only(bottom: Dimensions.h7),
                    child: Text(
                      "Beni en sevdiğin kafeye götür",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
                          .createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                      child: Text(
                        "Göz at",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )),
              
        ],
      ),
    );
  }
}
