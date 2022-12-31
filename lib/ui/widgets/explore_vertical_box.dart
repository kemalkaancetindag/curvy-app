import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExploreVerticalBox extends StatelessWidget {
  String image;
  String title;
  String text;
  String actionText;
  double? marginLeft;
  double? marginRight;
  double? marginTop;


  ExploreVerticalBox({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.actionText,
    this.marginLeft,
    this.marginRight,
    this.marginTop
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w17 * 10,
      height: Dimensions.h22 * 10,
      margin: marginLeft != null && marginRight != null && marginTop != null ? EdgeInsets.only(left: marginLeft!, right: marginRight!, top: marginTop!) : null,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.h16),
          image: DecorationImage(
              image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(image)}?alt=media'),
              fit: BoxFit.cover)),
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
                    gradient: LinearGradient(
                        stops: [0.3, 1],
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              )),
          Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.w17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Dimensions.w155,
                      margin: EdgeInsets.only(
                          top: Dimensions.h87, bottom: Dimensions.h21),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: Dimensions.h31,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: Dimensions.h8),
                      width: Dimensions.w140,
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(
                              fontSize: Dimensions.h14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),                    
                  ],
                ),
              )),
              Positioned(
                bottom: Dimensions.h100/10,
                left: Dimensions.w17,
                child: Container(
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => LinearGradient(
                                colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
                            .createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                        child: Text(
                          actionText,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
              )
        ],
      ),
    );
  }
}
