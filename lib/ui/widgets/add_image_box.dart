import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddImageBox extends StatelessWidget {
  const AddImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.w99,
        height: Dimensions.h137,
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [            
            Positioned(
              bottom: -10,
              right: -10,
              child: Container(
                width: Dimensions.w31,
                height: Dimensions.h31,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[Color(0xFFD51CFF), Color(0xFF00FFE1)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  ),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Dimensions.w31/2)
                ),
                child: Center(
                  child: Image.asset("assets/images/add_icon.png", width: Dimensions.w17, height: Dimensions.h17,),
                ),
              ),
            ),
          ],
        ));
  }
}
