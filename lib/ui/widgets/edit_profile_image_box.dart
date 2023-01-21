import 'dart:io';

import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPorfileImageBox extends StatelessWidget {
  String? image;
  EditPorfileImageBox({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w99,
      height: Dimensions.h137,

      decoration: BoxDecoration(
        image: image != null ? DecorationImage(
          image:  NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(image!)}?alt=media'),
          fit: BoxFit.cover
        ) : null
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -Dimensions.h31/2,
            right: -Dimensions.h31/2,
            child:   Container(
            width: Dimensions.h31,
            height:Dimensions.h31,
            decoration: BoxDecoration(
              
              color: Color(0xFFD446F4),
              borderRadius: BorderRadius.circular(Dimensions.h31/2)
            ),
            child: Center(
              child: Image.asset("assets/images/add_icon.png"),
            ),
          )
          )
        
        ],
      ),
    );
  }
}