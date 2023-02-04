import 'package:camera/camera.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isMessagesControllerRegistred = Get.isRegistered<MessagesController>();
    var isChatControllerRegistred = Get.isRegistered<ChatController>();

    if(!isMessagesControllerRegistred) {
      Get.put(MessagesController());      
    }

    if(!isChatControllerRegistred) {
      Get.put(ChatController(chatService: Get.find()));
    }
    
    return GetBuilder<MessagesController>(builder: (controller) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimensions.h100 * 2.3),
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Dimensions.h52, bottom: Dimensions.h12),
                    width: Dimensions.w325 + Dimensions.w31,
                    height: Dimensions.h120 + Dimensions.h12,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.h100 / 5),
                            topRight: Radius.circular(Dimensions.h100 / 5),
                            bottomLeft: Radius.circular(Dimensions.h100 / 2),
                            bottomRight: Radius.circular(Dimensions.h100 / 2)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.h8, bottom: Dimensions.h8),
                          child: Text(
                            "Yeni Eşleşmeler",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.h100 / 5),
                          ),
                        ),
                        GetBuilder<ChatController>(builder: (chatController) {
                          return chatController.newMatches != null
                              ? Container(
                                  width: Dimensions.w300,
                                  height: Dimensions.h8 * 10,
                                  child: chatController.newMatches!.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              chatController.newMatches != null
                                                  ? chatController
                                                      .newMatches!.length
                                                  : 0,
                                          itemBuilder: (context, index) {
                                            return GetBuilder<
                                                    UserOnlineController>(
                                                init: Get.find<
                                                        UserOnlineController>(
                                                    tag: chatController
                                                                .newMatches![
                                                                    index]
                                                                .user1 ==
                                                            chatController
                                                                .currentUserID
                                                        ? chatController
                                                            .newMatches![index]
                                                            .user2
                                                        : chatController
                                                            .newMatches![index]
                                                            .user2),
                                                global: false,
                                                builder:
                                                    (userOnlineController) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      chatController
                                                          .startNewChatWithNewMatch(
                                                              chatController
                                                                  .newMatches![
                                                                      index]
                                                                  .chatID!);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: Dimensions.w8),
                                                      width: Dimensions.h8 * 10,
                                                      height:
                                                          Dimensions.h8 * 10,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimensions
                                                                          .h8 *
                                                                      10 /
                                                                      2),
                                                          image: userOnlineController
                                                                      .user !=
                                                                  null
                                                              ? DecorationImage(
                                                                  image: NetworkImage(
                                                                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(userOnlineController.user!.images![0])}?alt=media'),
                                                                  fit: BoxFit
                                                                      .cover)
                                                              : null),
                                                    ),
                                                  );
                                                });
                                          },
                                        )
                                      : Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: Dimensions.h8 * 10,
                                                height: Dimensions.h8 * 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (Dimensions.h8 *
                                                                    10) /
                                                                2)),
                                              ),
                                              Container(
                                                width: Dimensions.h8 * 10,
                                                height: Dimensions.h8 * 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (Dimensions.h8 *
                                                                    10) /
                                                                2)),
                                              ),
                                              Container(
                                                width: Dimensions.h8 * 10,
                                                height: Dimensions.h8 * 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (Dimensions.h8 *
                                                                    10) /
                                                                2)),
                                              ),
                                              Container(
                                                width: Dimensions.h8 * 10,
                                                height: Dimensions.h8 * 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            (Dimensions.h8 *
                                                                    10) /
                                                                2)),
                                              ),
                                            ],
                                          ),
                                        ),
                                )
                              : Container();
                        })
                      ],
                    ),
                  ),
                  CustomPaint(
                    painter: SwitchPainter(),
                    child: Container(
                        width: Dimensions.w300,
                        height: Dimensions.h50,
                        child: GetBuilder<ChatController>(
                          builder: (chatController) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    chatController.setIsActiveMessages(true);
                                  },
                                  child: Container(
                                    width: chatController.isActiveMessages
                                        ? Dimensions.w17 * 10
                                        : Dimensions.w120,
                                    height: Dimensions.h36,
                                    decoration: BoxDecoration(
                                        color: chatController.isActiveMessages
                                            ? null
                                            : Color(0xFFC5C5C7),
                                        gradient:
                                            chatController.isActiveMessages
                                                ? LinearGradient(colors: [
                                                    Color(0xFFD51CFF),
                                                    Color(0xFF00FFE1)
                                                  ])
                                                : null,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h100 / 5)),
                                    child: Center(
                                      child: Text(
                                        "Mesajlar",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h16),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      chatController.setIsActiveMessages(false);
                                    },
                                    child: Container(
                                      width: chatController.isActiveMessages
                                          ? Dimensions.w120
                                          : Dimensions.w17 * 10,
                                      height: Dimensions.h36,
                                      decoration: BoxDecoration(
                                          color: chatController.isActiveMessages
                                              ? Color(0xFFC5C5C7)
                                              : null,
                                          gradient:
                                              chatController.isActiveMessages
                                                  ? null
                                                  : LinearGradient(colors: [
                                                      Color(0xFFD51CFF),
                                                      Color(0xFF00FFE1)
                                                    ]),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h100 / 5)),
                                      child: Center(
                                        child: Text(
                                          "Çöp Kutusu",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Dimensions.h16),
                                        ),
                                      ),
                                    ))
                              ],
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ),
          body: GetBuilder<ChatController>(
            builder: (chatController) {
              return chatController.currentChats != null
                  ? (chatController.currentChats!.isNotEmpty
                      ? SingleChildScrollView(
                          child: Column(children: chatController.tiles ?? []),
                        )
                      : Container(
                        margin: EdgeInsets.only(top: Dimensions.h52),
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                      child: Container(
                                    width: Dimensions.w180,
                                    height: Dimensions.h230 + Dimensions.h12,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD0D0D0),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h27)),
                                  )),
                                  Positioned(
                                      child: Transform.rotate(
                                    angle: math.pi / 20,
                                    child: Container(
                                        width: Dimensions.w180,
                                        height:
                                            Dimensions.h230 + Dimensions.h12,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE3E3E3),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.h27)),
                                        child: Center(
                                          child: Transform.rotate(
                                              angle: -math.pi / 20,
                                              child: Container(
                                                width: Dimensions.w120,
                                                child: ShaderMask(
                                                  blendMode: BlendMode.srcIn,
                                                  shaderCallback: (bounds) =>
                                                      LinearGradient(colors: [
                                                    Color(0xFFD51CFF),
                                                    Color(0xFF00FFE1)
                                                  ]).createShader(
                                                    Rect.fromLTWH(
                                                        0,
                                                        0,
                                                        bounds.width,
                                                        bounds.height),
                                                  ),
                                                  child: Text(
                                                      "Yeni Birilerine Şans Ver",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize:
                                                              Dimensions.h100 /
                                                                  5,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              )),
                                        )),
                                  ))
                                ],
                              ),
                              Container(
                                 margin: EdgeInsets.only(top: Dimensions.h52),
                                width: Dimensions.w254,
                                child: Text(
                                  "Henüz kimseyi beğenmedin gibi görünüyor. Birilerini sağa kardırarak başlaya bilirsin bizce",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF7B8491),
                                    fontSize: Dimensions.h100/5,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            ],
                          )))
                  : Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFD51CFF),
                        ),
                      ),
                    );
            },
          ));
    });
  }
}

class SwitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    var r = 25.0;
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
