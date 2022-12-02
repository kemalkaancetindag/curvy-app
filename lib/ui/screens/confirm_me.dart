import 'package:camera/camera.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ConfirmMePage extends StatelessWidget {
  final List<CameraDescription> cameras;

  ConfirmMePage({super.key, required this.cameras});

  

  @override
  Widget build(BuildContext context) {
    CameraController controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            await controller.dispose();
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 222,
              height: Dimensions.h8*10,
              child: Center(
                child: Text(                  
                  "Hadi seni doğrulayalım...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.h31
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)
              ),
              child: CameraPreview(controller),
            )
          ],
        ),

      ),
    );
  }
}