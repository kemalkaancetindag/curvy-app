import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final messageFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.maxFinite, Dimensions.h140),
            child: GetBuilder<ChatController>(
              builder: (controller) {
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.h16),
                            bottomRight: Radius.circular(Dimensions.h16)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    width: Dimensions.w35 * 10,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    controller.clearCurrentChat();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: Dimensions.w11,
                                        left: Dimensions.w8 / 2),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/chevron_left_white.png"),
                                    ),
                                  )),
                              Container(
                                height: Dimensions.h8 * 10,
                                width: Dimensions.w316,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        left: Dimensions.w2 * 20,
                                        top: Dimensions.h8 / 2.2,
                                        child: Container(
                                            width: Dimensions.w254,
                                            height: Dimensions.h300 / 10,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.h8 * 5)),
                                            child:
                                                controller.currentChat != null
                                                    ? GetBuilder<
                                                        UserOnlineController>(
                                                        init: Get.find<
                                                                UserOnlineController>(
                                                            tag: controller
                                                                        .currentChat!
                                                                        .user1 ==
                                                                    controller
                                                                        .currentUserID
                                                                ? controller
                                                                    .currentChat!
                                                                    .user2
                                                                : controller
                                                                    .currentChat!
                                                                    .user1),
                                                        global: false,
                                                        builder:
                                                            (userOnlineController) {
                                                          return Row(
                                                            children: [
                                                              userOnlineController
                                                                      .user!
                                                                      .online_status!
                                                                  ? Container(
                                                                      width:
                                                                          Dimensions
                                                                              .h8,
                                                                      height:
                                                                          Dimensions
                                                                              .h8,
                                                                      margin: EdgeInsets.only(
                                                                          left: Dimensions
                                                                              .w35,
                                                                          right:
                                                                              Dimensions.w8 / 2),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(Dimensions.h8 /
                                                                              2),
                                                                          color:
                                                                              Color(0xFF05ED00)),
                                                                    )
                                                                  : Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                      left: Dimensions
                                                                          .w35,
                                                                    )),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: Dimensions
                                                                            .w8 /
                                                                        2),
                                                                child: Center(
                                                                    child:
                                                                        RichText(
                                                                  text: TextSpan(
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              Dimensions.h16),
                                                                      children: [
                                                                        TextSpan(
                                                                            text:
                                                                                "${userOnlineController.user!.name!.split(" ").first},",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w800,
                                                                            )),
                                                                        TextSpan(
                                                                            text:
                                                                                "${DateTime.now().year - int.parse(userOnlineController.user!.birthdate!.split("/").last)}")
                                                                      ]),
                                                                )),
                                                              ),
                                                              Container(
                                                                child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/confirm_small.png"),
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      )
                                                    : null)),
                                    Positioned(
                                        left: Dimensions.w2 * 20,
                                        bottom: Dimensions.h8 / 2.2,
                                        child: Container(
                                          width: Dimensions.w140,
                                          height: Dimensions.h300 / 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.h8 * 5),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: Dimensions.w31),
                                                child: Center(
                                                  child: Image.asset(
                                                      "assets/images/chat_chip.png"),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.w2 * 10),
                                                child: GetBuilder<CurrentUserOnlineController>(
                                                  builder: (cuoc) {
                                                    return Center(
                                                  child: Text(
                                                    cuoc.userModel!.curvy_chip!.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Dimensions.h16),
                                                  ),
                                                );
                                                  },
                                                )
                                              )
                                            ],
                                          ),
                                        )),
                                    GetBuilder<UserOnlineController>(
                                        global: false,
                                        init: controller.currentChat != null
                                            ? Get.find<UserOnlineController>(
                                                tag: controller.currentChat!
                                                            .user1 ==
                                                        controller.currentUserID
                                                    ? controller
                                                        .currentChat!.user2
                                                    : controller
                                                        .currentChat!.user1)
                                            : null,
                                        builder: (userOnlineController) {
                                          return Positioned(
                                              child: Container(
                                            width: Dimensions.h8 * 10,
                                            height: Dimensions.h8 * 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.h8 * 10 / 2),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(userOnlineController.user!.images![0])}?alt=media'),
                                                    fit: BoxFit.cover)),
                                          ));
                                        }),
                                    GetBuilder<UserOnlineController>(
                                        init: controller.currentChat != null
                                            ? Get.find<UserOnlineController>(
                                                tag: controller.currentChat!
                                                            .user1 ==
                                                        controller.currentUserID
                                                    ? controller
                                                        .currentChat!.user2
                                                    : controller
                                                        .currentChat!.user1)
                                            : null,
                                        global: false,
                                        builder: (userOnlineController) {
                                          return Positioned(
                                              right: 0,
                                              bottom: (Dimensions.h8 / 2.2) +
                                                  (Dimensions.h300 / 35),
                                              child: Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: Dimensions.w8),
                                                      child: Center(
                                                        child: Image.asset(
                                                            "assets/images/location_white.png"),
                                                      ),
                                                    ),
                                                    Text(
                                                      "${userOnlineController.distance} km uzaklıkta",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        }),
                                  ],
                                ),
                              ),
                              Container(
                                height: Dimensions.h8 * 10,
                                width: Dimensions.w8 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/report.png"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        controller.isShareCPOpen
                            ? Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.setIsShareCPOpen(false);
                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                ))
                            : Container(),
                      ],
                    ));
              },
            )),
        body: GetBuilder<ChatController>(
          builder: (controller) {
            return Stack(
              children: [
                Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    padding: EdgeInsets.only(
                        left: Dimensions.w8 * 2, right: Dimensions.w8 * 2),
                    child: ListView.builder(  
                      controller: controller.scrollController,                    
                      itemCount: controller.currentChat != null
                          ? controller.currentChat!.messages!.length
                          : 0,
                      itemBuilder: (context, index) {
                        if (controller.currentChat!.messages![index].senderId ==
                            controller.currentUserID) {
                          return Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(top: Dimensions.h16, bottom: index == controller.currentChat!.messages!.length - 1 ? Dimensions.h100 : 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.likeMessage(controller
                                          .currentChat!
                                          .messages![index]
                                          .messageId!);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: Dimensions.w11),
                                      child: Center(
                                        child: controller.currentChat!
                                                .messages![index].isLiked!
                                            ? Image.asset(
                                                "assets/images/chat_like.png")
                                            : Image.asset(
                                                "assets/images/chat_unliked.png"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: Dimensions.h8,
                                        bottom: Dimensions.h8,
                                        right: Dimensions.w8,
                                        left: Dimensions.w8),
                                    width: Dimensions.w200,
                                   decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h16),
                                          color: Color(0xFFE4E4E4)),
                                    child: Center(
                                      child: Text(
                                        controller.currentChat!.messages![index]
                                            .content,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: Dimensions.h16,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        } else {
                          return Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(top: Dimensions.h16, bottom: index == controller.currentChat!.messages!.length - 1 ? Dimensions.h100 : 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Container(
                                  
                                      padding: EdgeInsets.only(
                                          top: Dimensions.h8,
                                          bottom: Dimensions.h8,
                                          right: Dimensions.w8,
                                          left: Dimensions.w8),
                                      width: Dimensions.w200,
                                       decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.h16),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF6198EF)
                                        ])),
                                    
                                      child: Center(
                                        child: Text(
                                          controller.currentChat!
                                              .messages![index].content,
                                          style: TextStyle(
                                              fontSize: Dimensions.h16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  GestureDetector(
                                     onTap: () {
                                      controller.likeMessage(controller
                                          .currentChat!
                                          .messages![index]
                                          .messageId!);
                                    },
                                    child:   Container(
                                    margin:
                                        EdgeInsets.only(left: Dimensions.w11),
                                    child: Center(
                                      child: controller.currentChat!
                                              .messages![index].isLiked!
                                          ? Image.asset(
                                              "assets/images/chat_like.png")
                                          : Image.asset(
                                              "assets/images/chat_unliked.png"),
                                    ),
                                  ),
                                  )
                                
                                ],
                              ));
                        }
                      },
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.h8 * 10,                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.h16),
                            topRight: Radius.circular(Dimensions.h16)),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setIsShareCPOpen(true);
                          },
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/chat_share_cp.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: Dimensions.w270 + Dimensions.w17,
                          height: Dimensions.h27,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h300 / 10)),
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.w8, right: Dimensions.w8),
                                child: TextField(
                                  controller: messageFieldController,
                                  onChanged: (val) {
                                    controller.setTypedMessage(val);
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller
                                .sendMessageToChat(messageFieldController.text);
                          },
                          child: Container(
                            child: Center(
                              child: Image.asset("assets/images/chat_send.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                controller.isShareCPOpen
                    ? Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            controller.setIsShareCPOpen(false);
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            color: Colors.black.withOpacity(0.4),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: Dimensions.h40*2,
                                  left: Dimensions.w2 * 5,
                                  child: Container(
                                    width: Dimensions.w35 * 10,
                                    height: Dimensions.h100 + Dimensions.h87,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              Dimensions.h16 * 2),
                                          topRight: Radius.circular(
                                              Dimensions.h16 * 2),
                                          bottomRight: Radius.circular(
                                              Dimensions.h16 * 2),
                                        ),
                                        gradient: LinearGradient(colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF6198EF)
                                        ])),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Text(
                                                "Kaç adet CurvyCHIP paylaşmak istersiniz?",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Dimensions.h17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.buyCurvyChip);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.sendCurvyChip(10);
                                                  },
                                                  child: Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimensions.w11 / 2),
                                                  width: Dimensions.h87,
                                                  height: Dimensions.h87,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      topRight: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      bottomRight:
                                                          Radius.circular(
                                                              Dimensions.h16 *
                                                                  2),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: ShaderMask(
                                                      blendMode:
                                                          BlendMode.srcIn,
                                                      shaderCallback:
                                                          (bounds) =>
                                                              LinearGradient(
                                                                  colors: [
                                                            Color(0xFFD51CFF),
                                                            Color(0xFF6198EF)
                                                          ]).createShader(
                                                        Rect.fromLTWH(
                                                            0,
                                                            0,
                                                            bounds.width,
                                                            bounds.height),
                                                      ),
                                                      child: Text("10",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .h40,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.sendCurvyChip(30);
                                                  },
                                                  child:     Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimensions.w11 / 2),
                                                  width: Dimensions.h87,
                                                  height: Dimensions.h87,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      topRight: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      bottomRight:
                                                          Radius.circular(
                                                              Dimensions.h16 *
                                                                  2),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                    child: Center(
                                                    child: ShaderMask(
                                                      blendMode:
                                                          BlendMode.srcIn,
                                                      shaderCallback:
                                                          (bounds) =>
                                                              LinearGradient(
                                                                  colors: [
                                                            Color(0xFFD51CFF),
                                                            Color(0xFF6198EF)
                                                          ]).createShader(
                                                        Rect.fromLTWH(
                                                            0,
                                                            0,
                                                            bounds.width,
                                                            bounds.height),
                                                      ),
                                                      child: Text("30",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .h40,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.sendCurvyChip(90);
                                                  },
                                                  child: 
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimensions.w11 / 2),
                                                  width: Dimensions.h87,
                                                  height: Dimensions.h87,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      topRight: Radius.circular(
                                                          Dimensions.h16 * 2),
                                                      bottomRight:
                                                          Radius.circular(
                                                              Dimensions.h16 *
                                                                  2),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                    child: Center(
                                                    child: ShaderMask(
                                                      blendMode:
                                                          BlendMode.srcIn,
                                                      shaderCallback:
                                                          (bounds) =>
                                                              LinearGradient(
                                                                  colors: [
                                                            Color(0xFFD51CFF),
                                                            Color(0xFF6198EF)
                                                          ]).createShader(
                                                        Rect.fromLTWH(
                                                            0,
                                                            0,
                                                            bounds.width,
                                                            bounds.height),
                                                      ),
                                                      child: Text("90",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  Dimensions
                                                                      .h40,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                ),
                                                ),
                                                
                                            
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    : Container(),
              ],
            );
          },
        ));
  }
}
