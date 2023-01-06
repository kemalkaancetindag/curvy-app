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

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController(chatService: Get.find()));
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
                          return Container(
                            width: Dimensions.w300,
                            height: Dimensions.h8 * 10,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chatController.newMatches != null
                                  ? chatController.newMatches!.length
                                  : 0,
                              itemBuilder: (context, index) {
                                return GetBuilder<UserOnlineController>(
                                    init: Get.find<UserOnlineController>(
                                        tag: chatController
                                                    .newMatches![index].user1 ==
                                                chatController.currentUserID
                                            ? chatController
                                                .newMatches![index].user2
                                            : chatController
                                                .newMatches![index].user2),
                                    global: false,
                                    builder: (userOnlineController) {
                                      return GestureDetector(
                                        onTap: () {
                                          chatController
                                              .startNewChatWithNewMatch(
                                                  chatController
                                                      .newMatches![index]
                                                      .chatID!);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.w8),
                                          width: Dimensions.h8 * 10,
                                          height: Dimensions.h8 * 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.h8 * 10 / 2),
                                              image: userOnlineController
                                                          .user !=
                                                      null
                                                  ? DecorationImage(
                                                      image: NetworkImage(
                                                          'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(userOnlineController.user!.images![0])}?alt=media'),
                                                      fit: BoxFit.cover)
                                                  : null),
                                        ),
                                      );
                                    });
                              },
                            ),
                          );
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
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: chatController.activeChats != null &&
                        chatController.unActiveChats != null &&
                        controller.activeChatPositions != null &&
                        controller.unActiveChatPositions != null
                    ? ListView.builder(
                        itemCount: chatController.isActiveMessages
                            ? chatController.activeChats!.length
                            : chatController.unActiveChats!.length,
                        itemBuilder: (context, index) {
                          print("builded");

                        

                          return GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              controller.slideMessageBox(
                                  index,
                                  details.delta.dx,
                                  chatController.isActiveMessages);
                            },
                            onHorizontalDragEnd: (details) {
                              controller.deactivateChat(
                                  chatController.activeChats![index].chatID!,
                                  index);
                            },
                            onTap: () {
                              if (chatController.isActiveMessages) {
                                
                                chatController.setCurrentChat(
                                    chatController.activeChats![index].chatID!);
                              } else {

                                chatController.setCurrentChat(chatController
                                    .unActiveChats![index].chatID!);
                              }
                            },
                            onPanDown: (details) {
                              if (chatController.isActiveMessages) {
                                chatController.setTappedChat(
                                    chatController.activeChats![index].chatID!);
                              } else {
                                chatController.setTappedChat(chatController
                                    .unActiveChats![index].chatID!);
                              }
                            },
                            onPanCancel: () {
                              chatController.setTappedChat(null);
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: Dimensions.h90,
                              width: double.maxFinite,
                              color: chatController.isActiveMessages
                                  ? (chatController.tappedChat ==
                                          chatController
                                              .activeChats![index].chatID!
                                      ? Color(0xFFC5C5C7)
                                      : null)
                                  : (chatController.tappedChat ==
                                          chatController
                                              .unActiveChats![index].chatID!
                                      ? Color(0xFFC5C5C7)
                                      : null),
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: chatController.isActiveMessages ? (
                                        controller.activeChatPositions == null ? -118 : controller.activeChatPositions![index][0]
                                      ) : (
                                        controller.unActiveChatPositions == null ? -118 : controller.unActiveChatPositions![index][0]
                                      ),
                                      right: chatController.isActiveMessages ? (
                                        controller.activeChatPositions == null ? -118 : controller.activeChatPositions![index][1]
                                      ) : (
                                        controller.unActiveChatPositions == null ? -118 : controller.unActiveChatPositions![index][1]
                                      ),
                                      child: GestureDetector(
                                        child: GetBuilder<UserOnlineController>(
                                          
                                          global: false,
                                          init: chatController.isActiveMessages
                                              ? Get.find<UserOnlineController>(
                                                  tag: chatController
                                                              .currentUserID ==
                                                          chatController
                                                              .activeChats![
                                                                  index]
                                                              .user1!
                                                      ? chatController
                                                          .activeChats![index]
                                                          .user2!
                                                      : chatController
                                                          .activeChats![index]
                                                          .user1!)
                                              : Get.find<UserOnlineController>(
                                                  tag: chatController
                                                              .currentUserID ==
                                                          chatController
                                                              .unActiveChats![
                                                                  index]
                                                              .user1!
                                                      ? chatController
                                                          .unActiveChats![index]
                                                          .user2!
                                                      : chatController
                                                          .unActiveChats![index]
                                                          .user1!),
                                          builder: (userOnlineController) {
                                            if(chatController.isActiveMessages){
                                              print("controller");
                                              print(userOnlineController.userID);
                                              
                                              if(chatController.currentUserID == chatController.activeChats![index].user1!){
                                                print("chat");
                                                print(chatController.activeChats![index].user2!);
                                              }
                                              else{
                                                print("chat");
                                                print(chatController.activeChats![index].user1!);
                                              }
                                            }
                                            else{
                                              print("controller3");
                                              print(userOnlineController.userID);
                                                   if(chatController.currentUserID == chatController.unActiveChats![index].user1!){
                                                print("chat");
                                                print(chatController.unActiveChats![index].user2!);
                                              }
                                              else{
                                                print("chat");
                                                print(chatController.unActiveChats![index].user1!);
                                              }
                                            }

                                            print("controller builded");

                                            return Container(
                                              height: Dimensions.h90,
                                              width: double.maxFinite,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: Dimensions.w111,
                                                    height: Dimensions.h7 * 10,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Color(0xFF1FE9BB),
                                                              Color(0xFF0D92E3)
                                                            ]),
                                                        borderRadius: BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .h40),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .h40))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Image.asset(
                                                            "assets/images/messages_report.png"),
                                                        Container(
                                                          width: Dimensions.w50,
                                                          child: Center(
                                                            child: Text(
                                                              "Profili Bildir",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Dimensions.w8 * 10,
                                                    height: Dimensions.w8 * 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions.w8 *
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
                                                  Container(
                                                    width: Dimensions.w267,
                                                    height: Dimensions.h90,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Color(
                                                                    0xFFC5C5C7),
                                                                width: 1),
                                                            bottom: BorderSide(
                                                                color: Color(
                                                                    0xFFC5C5C7),
                                                                width: 1))),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            userOnlineController
                                                                        .user !=
                                                                    null
                                                                ? Row(
                                                                    children: [
                                                                      userOnlineController
                                                                              .user!
                                                                              .online_status!
                                                                          ? Container(
                                                                              margin: EdgeInsets.only(top: Dimensions.h7, left: Dimensions.w8),
                                                                              width: Dimensions.h7,
                                                                              height: Dimensions.h7,
                                                                              decoration: BoxDecoration(color: Color(0xFF05ED00), borderRadius: BorderRadius.circular(Dimensions.h7 / 2)),
                                                                            )
                                                                          : Container(),
                                                                      Container(
                                                                        width: Dimensions
                                                                            .w99,
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                Dimensions.h7),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "${userOnlineController.user!.name!.split(" ")[0]}, ${DateTime.now().year - int.parse(userOnlineController.user!.birthdate!.split("/").last)}",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: Dimensions.h100 / 5),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                : Container(),
                                                            Container(
                                                              child: Center(
                                                                child: Text(
                                                                  chatController
                                                                          .isActiveMessages
                                                                      ? chatController.activeChats![index].lastMessageDate !=
                                                                              null
                                                                          ? chatController.getLastMessageDate(chatController
                                                                              .activeChats![
                                                                                  index]
                                                                              .lastMessageDate!)
                                                                          : ""
                                                                      : chatController.unActiveChats![index].lastMessageDate !=
                                                                              null
                                                                          ? chatController.getLastMessageDate(chatController
                                                                              .unActiveChats![index]
                                                                              .lastMessageDate!)
                                                                          : "",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .h14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top:
                                                                      Dimensions
                                                                          .h7),
                                                          width:
                                                              Dimensions.w226,
                                                          child: Text(
                                                            chatController
                                                                    .isActiveMessages
                                                                ? chatController
                                                                    .activeChats![
                                                                        index]
                                                                    .lastMessage!
                                                                : chatController
                                                                    .unActiveChats![
                                                                        index]
                                                                    .lastMessage!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF7B8491),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    Dimensions
                                                                        .h14),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: Dimensions.w111,
                                                    height: Dimensions.h7 * 10,
                                                    decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              Color(0xFFFF0000),
                                                              Color(0xFFFFB800)
                                                            ]),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .h40),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    Dimensions
                                                                        .h40))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          width: Dimensions.w50,
                                                          child: Center(
                                                            child: Text(
                                                              "Eşleşmeyi Bitir",
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                        Image.asset(
                                                            "assets/images/messages_delete.png"),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : null,
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
