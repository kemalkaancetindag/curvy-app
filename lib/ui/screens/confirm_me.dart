import 'package:camera/camera.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/confirm_me_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ConfirmMePage extends StatelessWidget {
  final List<CameraDescription> cameras;

 

  ConfirmMePage({super.key, required this.cameras});

  

  @override
  Widget build(BuildContext context) {
    
        
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {            
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      body:GetBuilder<ConfirmMeController>(
        builder: (controller) {

          if(controller.processing){
            return Container(
              color:  Colors.white,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Center(
                child: CircularProgressIndicator(
                color: Color(0xFFD51CFF),
              ),
              )
            );
          }

          if(controller.confrimed == true && controller.processing == false) {
            return Container(

              color: Colors.white,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h27*10),
                    width: Dimensions.w140,
                    height: Dimensions.w140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.w140/2),
                      gradient: LinearGradient(
                        colors: [
                    Color(0xFFD51CFF),
                    Color(0xFF00FFE1)
                  ]
                      )
                    ),
                    child: Center(
                      child: Container(
                        width: Dimensions.w140/2,
                        height: Dimensions.w140/2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/confirm_tick_me.png"),
                            fit: BoxFit.contain
                          )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h17),
                    width: Dimensions.w120 + Dimensions.w11/2,
                    child: Text(
                      "Doğrulama Başarılı",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7B8491),
                        fontSize: Dimensions.h230/10,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h209),
                    width: Dimensions.w120 + Dimensions.w11,
                    height: Dimensions.h42,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/confirm_me_curvy_logo.png",),
                        fit:  BoxFit.contain
                      )
                    ),
                  )
                ],
              ),
            );
          }
          
          return  Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.h31),
              width: Dimensions.w222,
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
            CustomPaint(
              painter: StyleChangerContainer(),
              child:  ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.h100 + Dimensions.h50),
                child:  Container(
              width: Dimensions.w300,
              height: Dimensions.h300 + Dimensions.h100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h100 + Dimensions.h50)
              ),
              child: controller.isCameraInitialized ? AspectRatio(
        aspectRatio: controller.cameraController.value.aspectRatio,
        child: CameraPreview(controller.cameraController)) : Container()
            ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h31),
              width: Dimensions.w222,
              child: Text(
                "Yüzünü kadraja ortaladığına emin ol",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7B8491),
                  fontSize: Dimensions.h230/10,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            GestureDetector(
              onPanDown: (details){
                controller.buttonAnimation(0);
              },
              onPanCancel: (){
                controller.buttonAnimation(null);
              },
              onTap: (){
                controller.createConfirmRequest();
              },
              child:   Container(
              margin: EdgeInsets.only(top: Dimensions.h31),
              width: controller.tappedButton == 0 ? Dimensions.w320/1.2 : Dimensions.w320,
              height: controller.tappedButton == 0 ? Dimensions.h50/1.2 : Dimensions.h50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h50/2),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFD51CFF),
                    Color(0xFF00FFE1)
                  ]
                )
              ),
              child: Center(
                child: Text(
                  "HAZIRIM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.h21,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            ),
          
            Container(
              margin: EdgeInsets.only(top: Dimensions.h17),
              width: Dimensions.w120 + Dimensions.w11,
              height: Dimensions.h42,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/confirm_me_curvy_logo.png"),
                  fit: BoxFit.cover
                )
              ),
            )
           
          ],
        ),

      );
        },
      )
    );
  }
}




class StyleChangerContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = Dimensions.h100 + Dimensions.h50;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      Radius.circular(r),
    );
    var paint1 = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
          .createShader(Rect.fromCenter(
              center: Offset(w / 2, h / 2), width: w, height: h))
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(fullRect, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
