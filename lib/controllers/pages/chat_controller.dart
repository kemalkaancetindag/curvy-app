import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/user_chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatService chatService;

  List<Chat>? _activeChats;
  List<Chat>? get activeChats => _activeChats;

  List<Chat>? _unActiveChats;
  List<Chat>? get unActiveChats => _unActiveChats;

  List<Chat>? _newMatches;
  List<Chat>? get newMatches => _newMatches;

  bool _isActiveMessages = true;
  bool get isActiveMessages => _isActiveMessages;

  String? _tappedChat;
  String? get tappedChat => _tappedChat;

  String currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Chat? _currentChat;
  Chat? get currentChat => _currentChat;

  ChatController({required this.chatService});

  String? _typedMessage;
  String? get typedMessage => _typedMessage;

  List<Chat>? _currentChats;
  List<Chat>? get currentChats => _currentChats;

  List<Chat>? _allChats;
  List<Chat>? get allChats => _allChats;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;

  bool _isShareCPOpen = false;
  bool get isShareCPOpen => _isShareCPOpen;

  ScrollController scrollController = ScrollController();

  final messageFieldController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();

    await setCurrentUser();
    await chatService.listenChats();
    super.onInit();
  }

  void setIsShareCPOpen(bool state) {
    _isShareCPOpen = state;
    update();
  }

  void generateTiles() {
    print("MESAJ ÇAĞIRDI");
    _tiles = [];

    for (int i = 0; i < _currentChats!.length; i++) {
      var currentUserControllerTag = _currentChats![i].user1 == currentUserID
          ? _currentChats![i].user2
          : _currentChats![i].user1;

      Get.put<UserChatController>(
          UserChatController(
              firestoreService: Get.find(), userID: currentUserControllerTag!),
          tag: currentUserControllerTag);

      _tiles!.add(GetBuilder<UserChatController>(
        key: Key(currentUserControllerTag),
        tag: currentUserControllerTag,
        global: false,
        init: Get.find<UserChatController>(tag: currentUserControllerTag),
        builder: (controller) {
          return controller.user != null
              ? GestureDetector(

                  child: Container(
                    width: Get.width,
                    height: Dimensions.h100,
                    color: controller.isTapping ? Color(0xFFC5C5C7) : null,
                    child: Stack(
                      children: [
                        Positioned(
                            left: controller.chatCurrentPosition![0],
                            right: controller.chatCurrentPosition![1],
                            child: Container(
                                height: Dimensions.h100,
                                width: Get.width + (Dimensions.w11 * 20),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        left: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){
                                            controller.activateOrReportChat(_currentChats![i].chatID!);
                                          },
                                          child: Container(
                                              height: double.maxFinite,
                                              width: Dimensions.w11 * 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  Dimensions
                                                                      .w42),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  Dimensions
                                                                      .w42)),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFF1FE9BB),
                                                        Color(0xFF0D92E3)
                                                      ])),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                      "assets/images/messages_report.png"),
                                                  Container(
                                                    width: Dimensions.w50,
                                                    child: Text(
                                                      isActiveMessages
                                                          ? "Profili Bildir"
                                                          : "Bir Şans Daha",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Dimensions.h14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )),
                                    Positioned(
                                        child: GestureDetector(
                                        
                                      onHorizontalDragUpdate: (details) {     
                                        print("UPDATE");
                                        controller.slideTile(details.delta.dx,
                                            _currentChats![i].chatID!);
                                      },
                                      onHorizontalDragEnd: (details) {
                                        print("BİTTİ");
                                        controller.setBackgroundColor(false);
                                        if ((controller
                                                    .chatCurrentPosition![0] <
                                                -Dimensions.w200) ||
                                            controller.chatCurrentPosition![0] >
                                                -Dimensions.w2) {
                                          return;
                                        }
                                        controller.resetPosition();
                                      },  
                                      onPanCancel: () {
                                        print("CANCEL");
                                        controller.setBackgroundColor(false);
                                        controller.resetPosition();
                                      },
                                      onTap: () {
                                        setCurrentChat(
                                            _currentChats![i].chatID!);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: Dimensions.w11 * 10,
                                            right: Dimensions.w11 * 10),
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: Dimensions.w16),
                                              width: Dimensions.h8 * 10,
                                              height: Dimensions.h8 * 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.h8 /
                                                              2 *
                                                              10),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.user!.images![0])}?alt=media'),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.w2 * 10),
                                              margin: EdgeInsets.only(
                                                  right: Dimensions.w16),
                                              width: Get.width -
                                                  Dimensions.h8 * 10 -
                                                  (Dimensions.w16 * 2),
                                              height: double.maxFinite,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                top: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFC5C5C7)),
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFC5C5C7)),
                                              )),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          top: Dimensions.h7),
                                                      child: Row(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: Dimensions
                                                                            .w8 /
                                                                        2),
                                                                width: Dimensions
                                                                        .h60 /
                                                                    10,
                                                                height: Dimensions
                                                                        .h60 /
                                                                    10,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            (Dimensions.h60 / 10) /
                                                                                2),
                                                                    color: controller
                                                                            .user!
                                                                            .online_status!
                                                                        ? Color(
                                                                            0xFF05ED00)
                                                                        : Color(
                                                                            0xFFFF0000)),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: Dimensions
                                                                            .w8 /
                                                                        2),
                                                                child: Text(
                                                                  "${controller.user!.name}, ${DateTime.now().year - int.parse(controller.user!.birthdate!.split("/").last)}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          Dimensions
                                                                              .h21,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/confirm_small.png"),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      )),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: Dimensions.h60 /
                                                            20),
                                                    width: double.maxFinite,
                                                    child: Text(
                                                      _currentChats![i]
                                                              .lastMessage ??
                                                          "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF7B8491),
                                                          fontSize:
                                                              Dimensions.h14),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                    Positioned(
                                        right: 0,
                                        top: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            print("sa");
                                            controller.deleteChat(
                                                _currentChats![i].chatID!);
                                          },
                                          child: Container(
                                              height: double.maxFinite,
                                              width: Dimensions.w11 * 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  Dimensions
                                                                      .w42),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  Dimensions
                                                                      .w42)),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFFFF0000),
                                                        Color(0xFFFFB800)
                                                      ])),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width: Dimensions.w50,
                                                    child: Text(
                                                      isActiveMessages
                                                          ? "İlişkiyi Çöpe At"
                                                          : "Eşleşmeyi Bitir",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Dimensions.h14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                      "assets/images/messages_delete.png"),
                                                ],
                                              )),
                                        )),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                )
              : Container();
        },
      ));
    }

    update();
  }

  void setAllChats(List<Chat> allChats) {
    _allChats = allChats;

    update();
  }

  void setCurrentChats() {  
    var chatsWithMessageDates =
        _allChats!.where((chat) => chat.lastMessageDate != null).toList();
    
    
    var chatsWithoutMessageDates =
        _allChats!.where((chat) => chat.lastMessageDate == null).toList();
    
    
    chatsWithMessageDates
        .sort((b, a) => a.lastMessageDate!.compareTo(b.lastMessageDate!));
    chatsWithMessageDates.addAll(chatsWithoutMessageDates);

    _currentChats = chatsWithMessageDates
        .where((chat) => chat.isActive! == isActiveMessages && chat.isStarted!)
        .toList();

    generateTiles();

    update();
  }

  Future setCurrentUser() async {
    _currentUser =
        await Get.find<FirestoreService>().getCurrentUser(currentUserID);
  }

  void setChats(
      List<Chat> activeChats, List<Chat> unActiveChats, List<Chat> newMatches) {
    _activeChats = activeChats;
    _unActiveChats = unActiveChats;
    _newMatches = newMatches;

    update();
  }

  String getLastMessageDate(int messageDate) {
    var sendingDate = DateTime.fromMillisecondsSinceEpoch(messageDate);
    var currentDate = DateTime.now();

    if ((sendingDate.day == currentDate.day) &&
        (sendingDate.month == currentDate.month) &&
        (sendingDate.year == currentDate.year)) {
      return "${sendingDate.hour}:${sendingDate.minute}";
    }

    return "";
  }

  Future sendMessageToChat(String message) async {
    if (message.length == 0) {
      return;
    }
    await chatService.sendMessageToChat(_currentChat!.chatID!, message);
    _typedMessage = "";
    messageFieldController.text = "";
    print(scrollController.position.maxScrollExtent);
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + Dimensions.h100,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );

    update();
  }

  void setTappedChat(String? chatID) {
    if (chatID != null) {
      _tappedChat = chatID;
    } else {
      _tappedChat = null;
    }

    update();
  }

  void setCurrentChat(String chatID) {
    chatService.listenCurrentChat(chatID);
    chatService.setIsUserInChat(currentUserID, chatID, true);

    if (_isActiveMessages) {
      _currentChat =
          _activeChats!.where((chat) => chat.chatID == chatID).toList()[0];
    } else {
      _currentChat =
          _unActiveChats!.where((chat) => chat.chatID == chatID).toList()[0];
    }

    chatService.setMessagesAsSeen(chatID);
    generateTiles();
    Get.toNamed(Routes.chat);
  }

  void updateCurrentChat(Chat updatedChat) {
    _currentChat = updatedChat;
    update();
  }

  void setTypedMessage(String message) {
    _typedMessage = message;
  }

  Future likeMessage(int messageId) async {
    var messageWantedToLike = _currentChat!.messages!
        .where((message) => message.messageId == messageId)
        .toList()[0];
    var currentUserID = Get.find<SharedPreferenceService>().getUserID()!;

    if (messageWantedToLike.senderId == currentUserID) {
      print("BENİM");
      return;
    }

    await chatService.likeMessage(_currentChat!.chatID!, messageId);
    update();
  }

  void deleteLastControllers() async {
    await Future.forEach(_currentChats!, (chat) async {
      if (currentUserID == chat.user1) {
        await Get.delete<UserChatController>(tag: chat.user2!);
      } else {
        await Get.delete<UserChatController>(tag: chat.user1!);
      }
    });
  }

  void setIsActiveMessages(bool state) async {
    _isActiveMessages = state;    
    var chatsWithMessageDates =
        _allChats!.where((chat) => chat.lastMessageDate != null).toList();
    
    
    var chatsWithoutMessageDates =
        _allChats!.where((chat) => chat.lastMessageDate == null).toList();
    
    
    chatsWithMessageDates
        .sort((b, a) => a.lastMessageDate!.compareTo(b.lastMessageDate!));
    chatsWithMessageDates.addAll(chatsWithoutMessageDates);

    _currentChats = chatsWithMessageDates
        .where((chat) => chat.isActive! == isActiveMessages && chat.isStarted!)
        .toList();
    generateTiles();
    update();
  }

  Future startNewChatWithNewMatch(String chatID) async {
    await chatService.startNewChatWithNewMatch(chatID);
    setCurrentChat(chatID);
    update();
  }

  void clearCurrentChat() {
    chatService.setIsUserInChat(currentUserID, _currentChat!.chatID!, false);
    _currentChat = null;
    update();
  }

  Future sendCurvyChip(int amount) async {
    if (currentChat!.user1 == currentUserID) {
      await chatService.sendCurvyChip(
          currentChat!.user2!, currentUserID, amount);
    } else {
      await chatService.sendCurvyChip(
          currentChat!.user1!, currentUserID, amount);
    }
  }
}
