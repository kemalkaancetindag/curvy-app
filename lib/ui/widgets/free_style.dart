import 'package:curvy_app/ui/widgets/free_style_box.dart';
import 'package:curvy_app/ui/widgets/free_style_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FreeStyle extends StatelessWidget {
  FreeStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FreeStylePopup(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                FreeStyleBox(), 
                FreeStyleBox(), 
                FreeStyleBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
