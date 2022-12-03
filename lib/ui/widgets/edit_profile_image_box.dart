import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditPorfileImageBox extends StatelessWidget {
  const EditPorfileImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w99,
      height: Dimensions.h137,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -Dimensions.h31/2,
            right: -Dimensions.w31/2,
            child:   Container(
            width: Dimensions.w31,
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