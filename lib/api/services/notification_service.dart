import 'package:curvy_app/constants/dimensions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _getPermission();
    await _startListening();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _getPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> _startListening() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        showDialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.9),
            context: Get.context!,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h160),
                          child: Center(
                            child: Image.asset(
                                "assets/images/match_dialog_logo.png"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h12),
                          child: Center(
                            child: Text(
                              "TEBRİKLER",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.h100 / 5,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h8),
                          child: Center(
                            child: Text(
                              "EŞLEŞTİNİZ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h16 * 2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          width: Dimensions.w320 + Dimensions.w200/10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomPaint(
                                child: Container(
                                  
                                  width: Dimensions.h16 * 10,
                                  height: Dimensions.h16 * 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h16 * 10 / 2)),
                                ),
                                painter: StyleChangerContainer(),
                              ),
                              CustomPaint(
                                child: Container(                                  
                                  width: Dimensions.h16 * 10,
                                  height: Dimensions.h16 * 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h16 * 10 / 2)),
                                ),
                                painter: StyleChangerContainer(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h12),
                          child: Center(
                            child: Text(
                              "Sen & Andrei",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h100 / 5),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h8),
                          child: Center(
                            child: Text(
                              "birbirinizden hoşlandınız!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h100 / 5),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h21, bottom: Dimensions.h21),
                          width: Dimensions.w320,
                          height: Dimensions.h50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 2),
                              gradient: LinearGradient(colors: [
                                Color(0xFFD51CFF),
                                Color(0xFF00FFE1)
                              ])),
                          child: Center(
                            child: Text(
                              "HEMEN MESAJ GÖNDER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h36 / 2),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child:    CustomPaint(
                          painter: ButtonBorder(),
                          child: Container(                            
                            width: Dimensions.w320,
                            height: Dimensions.h50,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h50 / 2),
                            ),
                            child: Center(
                              child: Text(
                                "KAYDIRMAYA DEVAM ET",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.h36 / 2),
                              ),
                            ),
                          ),
                        ),
                        ),
                     
                      ]),
                ),
              );
            });
      }
    });
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}

class StyleChangerContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = Dimensions.h16 * 10 / 2;
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



class ButtonBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = Dimensions.h50/2;
    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h),
      Radius.circular(r),
    );
    var paint1 = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
          .createShader(Rect.fromCenter(
              center: Offset(w / 2, h / 2), width: w, height: h))
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(fullRect, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}