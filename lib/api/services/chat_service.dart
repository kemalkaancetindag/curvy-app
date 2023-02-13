import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/enums/chat_start_types.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatService extends GetxService {
  FirestoreService firestoreService;

  ChatService({required this.firestoreService});

  Future listenCurrentChat(String chatID) async {
    firestoreService
        .getCollection('chats')
        .doc(chatID)
        .snapshots()
        .listen((event) {
      var currentUpdatedChat =
          Chat.fromJson(event.data() as Map<String, dynamic>);

      Get.find<ChatController>().updateCurrentChat(currentUpdatedChat);
    });
  }

  Future listenChats() async {
    print("dinliyor");
    var chatController = Get.find<ChatController>();
    var messagesController = Get.find<MessagesController>();

    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUserDoc = (await firestoreService
            .getCollection('users')
            .where('userID', isEqualTo: userID)
            .get())
        .docs[0];

    firestoreService
        .getCollection('users')
        .doc(currentUserDoc.id)
        .snapshots()
        .listen((event) async {
      print("listening");
      var userObject = UserModel.fromJson(event.data() as Map<String, dynamic>);
      Stream<QuerySnapshot> chatStream =
          firestoreService.getCollection('chats').snapshots();

      await for (var chats in chatStream) {
        print("chatttt");
        List<Chat> activeChats = [];
        List<Chat> unActiveChats = [];
        List<Chat> newMatches = [];
        List<Chat> allChats = [];

        var filteredChats = chats.docs
            .where((chat) =>
                userObject.chat!.active_chats!.contains(chat['chatID']))
            .toList();
        filteredChats.forEach((chatDoc) {
          var currentChat =
              Chat.fromJson(chatDoc.data() as Map<String, dynamic>);

          if (currentChat.user1! == userID) {
            Get.put(
                UserOnlineController(
                    firestoreService: firestoreService,
                    userID: currentChat.user2!),
                tag: currentChat.user2!);
          } else {
            Get.put(
                UserOnlineController(
                    firestoreService: firestoreService,
                    userID: currentChat.user1!),
                tag: currentChat.user1!);
          }

          allChats.add(currentChat);

          if (currentChat.isActive!) {
            if (currentChat.isStarted!) {
              activeChats.add(currentChat);
            } else {
              newMatches.add(currentChat);
            }
          } else {
            unActiveChats.add(currentChat);
          }
        });

        messagesController.generatePositions(activeChats.length, true);
        messagesController.generatePositions(unActiveChats.length, false);

        chatController.setAllChats(allChats);
        chatController.setCurrentChats();

        chatController.setChats(activeChats, unActiveChats, newMatches);
      }
    });
  }

  Future sendMessageToChat(String chatID, String message) async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    UserModel user = await firestoreService.getUser(userID);
    var currentDate = DateTime.now().millisecondsSinceEpoch;
    var chat = await firestoreService.getChat(chatID);

    if (chat.startingType == ChatStart.curvyChip.value) {
      var result = await firestoreService.spendCurvyChip(userID, 1);

      if (!result) {
        return;
      }
    }

    var isSeen;

    if (userID == chat.user1) {
      if (chat.isUser2InChat != null) {
        if (chat.isUser2InChat!) {
          isSeen = true;
        } else {
          isSeen = false;
        }
      } else {
        isSeen = false;
      }
    } else {
      if (chat.isUser1InChat != null) {
        if (chat.isUser1InChat!) {
          isSeen = true;
        } else {
          isSeen = false;
        }
      } else {
        isSeen = false;
      }
    }

    var messageData = Message(
        messageId: chat.messages!.length,
        senderId: userID,
        content: message,
        type: 0,
        sendingDate: currentDate,
        isLiked: false,
        isSeen: isSeen);

    chat.lastMessage = message;
    chat.lastMessageDate = DateTime.now().millisecondsSinceEpoch;

    chat.messages!.add(messageData);
    var chatData = chat.toJson();

    await firestoreService.sendMessageToChat(chatData, chatID);
  }

  Future likeMessage(String chatID, int messageId) async {
    var chat = await firestoreService.getChat(chatID);
    chat.messages![messageId].isLiked = !chat.messages![messageId].isLiked!;
    var chatData = chat.toJson();
    await firestoreService.sendMessageToChat(chatData, chatID);
  }

  Future startNewChatWithNewMatch(String chatID) async {
    var chat = await firestoreService.getChat(chatID);
    chat.isStarted = true;
    var chatData = chat.toJson();
    await firestoreService.updateChat(chatData, chatID);
  }

  Future<String?> checkChatWithUserIDS(String currentUserID, String user2) async {
    var e1Chats = await firestoreService.getCollection("chats").where("user1", isEqualTo: currentUserID).where("user2", isEqualTo: user2).get();
    var e2Chats = await firestoreService.getCollection("chats").where("user1", isEqualTo: user2).where("user2", isEqualTo: currentUserID).get();

    if(e1Chats.docs.isNotEmpty) {
      return e1Chats.docs[0].id;
    } else if(e2Chats.docs.isNotEmpty){
      return e2Chats.docs[0].id;
    }

    return null;
  }

  Future<bool> startNewChat(
      String message, String user2, int startingType) async {
    var userID = Get.find<SharedPreferenceService>().getUserID();

    var existingChat = await checkChatWithUserIDS(userID!, user2);

    if(existingChat != null) {
      await sendMessageToChat(existingChat, message);
      return true;
    }



    if (startingType == ChatStart.curvyLike.value) {
      var result = await firestoreService.spendCurvyLike(userID!, 1);

      if (!result) {
        return false;
      }
    }

    if (startingType == ChatStart.curvyChip.value) {
      var result = await firestoreService.spendCurvyChip(userID!, 1);
      print("as");
      if (!result) {
        print("sa");
        return false;
      }
    }

    List<Message> messages = [];
    var newMessage = Message(
        senderId: userID,
        content: message,
        sendingDate: DateTime.now().millisecondsSinceEpoch,
        type: 0,
        messageId: 0,
        isLiked: false,
        isSeen: false);
    messages.add(newMessage);

    var documentRef = firestoreService.getCollection('chats').doc();


    var newChat = Chat(
        isActive: true,
        isStarted: true,
        user1: userID,
        user2: user2,
        startingType: startingType,
        lastMessage: message,
        lastMessageDate: DateTime.now().microsecondsSinceEpoch,
        messages: messages,
        chatID: documentRef.id);

    await documentRef.set(newChat.toJson());

    var updateData = Map<String, dynamic>();

    var currentUser = await firestoreService.getCurrentUser(userID!);
    var currentUserActiveChats = currentUser.chat!.active_chats!;

    currentUserActiveChats.add(documentRef.id);

    updateData["chat.active_chats"] = currentUserActiveChats;

    if (startingType == 1) {
      updateData["curvy_like"] = currentUser.curvy_like! - 1;
    } else if (startingType == 2) {
      updateData["curvy_chip"] = currentUser.curvy_chip! - 1;
    }

    updateData["chat.active_chats"] = currentUserActiveChats;

    await firestoreService.updateUser(updateData, userID);

    return true;
  }

  Future deactivateChat(String chatID) async {
    var chat = await firestoreService.getChat(chatID);
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var deactivatedChatOpositeUserDoc;

    if (chat.user1! == currentUserID) {
      deactivatedChatOpositeUserDoc = (await firestoreService
              .getCollection('users')
              .where('userID', isEqualTo: chat.user2!)
              .get())
          .docs[0];
    } else {
      deactivatedChatOpositeUserDoc = (await firestoreService
              .getCollection('users')
              .where('userID', isEqualTo: chat.user1!)
              .get())
          .docs[0];
    }

    var opositeUser = UserModel.fromJson(
        deactivatedChatOpositeUserDoc.data() as Map<String, dynamic>);

    var newOpositeUserChats =
        opositeUser.chat!.active_chats!.where((id) => id != chatID).toList();

    var opositeUserUpdateData = Map<String, dynamic>();

    opositeUserUpdateData['chat.active_chats'] = newOpositeUserChats;

    await firestoreService.updateUser(
        opositeUserUpdateData, opositeUser.userID!);

    var updateData = Map<String, dynamic>();
    updateData['isActive'] = false;
    await firestoreService.updateChat(updateData, chatID);
  }

  Future activateChat(String chatID) async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var chat = await firestoreService.getChat(chatID);
    var activatedUserDoc;

    if (chat.user1! == currentUserID) {
      activatedUserDoc = (await firestoreService
              .getCollection('users')
              .where('userID', isEqualTo: chat.user2!)
              .get())
          .docs[0];
    } else {
      activatedUserDoc = (await firestoreService
              .getCollection('users')
              .where('userID', isEqualTo: chat.user1!)
              .get())
          .docs[0];
    }

    var activatedUser =
        UserModel.fromJson(activatedUserDoc.data() as Map<String, dynamic>);

    var newActivatedUserChatList = activatedUser.chat!.active_chats!;
    newActivatedUserChatList.add(chatID);

    var activatedUserUpdateData = Map<String, dynamic>();

    activatedUserUpdateData['chat.active_chats'] = newActivatedUserChatList;

    await firestoreService.updateUser(
        activatedUserUpdateData, activatedUser.userID!);

    var updateData = Map<String, dynamic>();
    updateData['isActive'] = true;
    await firestoreService.updateChat(updateData, chatID);
  }

  Future deleteChat(String chatID) async {
    var chatDoc =
        await firestoreService.getCollection('chats').doc(chatID).get();
    var chat = Chat.fromJson(chatDoc.data() as Map<String, dynamic>);

    var user1 = await firestoreService.getUser(chat.user1!);
    var user2 = await firestoreService.getUser(chat.user2!);

    var newActiveChatListUser1 =
        user1.chat!.active_chats!.where((id) => id != chatID).toList();
    var newActiveChatListUser2 =
        user2.chat!.active_chats!.where((id) => id != chatID).toList();

    var user1UpdateData = Map<String, dynamic>();
    var user2UpdateData = Map<String, dynamic>();

    user1UpdateData['chat.active_chats'] = newActiveChatListUser1;
    user2UpdateData['chat.active_chats'] = newActiveChatListUser2;

    await firestoreService.updateUser(user1UpdateData, user1.userID!);
    await firestoreService.updateUser(user2UpdateData, user2.userID!);

    await firestoreService.getCollection('chats').doc(chatDoc.id).delete();
  }

  Future setMessagesAsSeen(String chatID) async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    var chat = await firestoreService.getChat(chatID);
    var messages = chat.messages!;
    var newMessages = <Message>[];

    messages.forEach((message) {
      if (!message.isSeen! && message.senderId! != currentUserID) {
        print(message.senderId);
        var jsonMessage = message.toJson();
        jsonMessage['isSeen'] = true;
        newMessages.add(Message.fromJson(jsonMessage));
      } else {
        newMessages.add(message);
      }
    });

    chat.messages = newMessages;

    await firestoreService.updateChat(chat.toJson(), chatID);
  }

  Future setIsUserInChat(String userID, String chatID, bool isIn) async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    var chat = await firestoreService.getChat(chatID);

    if (isIn) {
      if (currentUserID == chat.user1) {
        var jsonChat = chat.toJson();
        jsonChat['isUser1InChat'] = true;
        await firestoreService.updateChat(jsonChat, chatID);
      } else {
        var jsonChat = chat.toJson();
        jsonChat['isUser2InChat'] = true;
        await firestoreService.updateChat(jsonChat, chatID);
      }
    } else {
      if (currentUserID == chat.user1) {
        var jsonChat = chat.toJson();
        jsonChat['isUser1InChat'] = false;
        await firestoreService.updateChat(jsonChat, chatID);
      } else {
        var jsonChat = chat.toJson();
        jsonChat['isUser2InChat'] = false;
        await firestoreService.updateChat(jsonChat, chatID);
      }
    }
  }

  Future sendCurvyChip(String to, String from, int amount) async {
    var fromUser = await firestoreService.getUser(from);
    var toUser = await firestoreService.getUser(to);

    if(fromUser.curvy_chip! < amount) {
      Get.snackbar(
        "Hata",
        "Yeterli CurvyCHIP bakiyeniz bulunmamaktadır.",
        colorText: Colors.white,
        backgroundColor: Color(0xFFD51CFF) 
      );
      return;
    }

    var updatedFromUser = Map<String,dynamic>();
    var updatedToUser = Map<String,dynamic>();

    updatedFromUser["curvy_chip"] = fromUser.curvy_chip! - amount;
    updatedToUser["curvy_chip"] = toUser.curvy_chip! + amount;

    await firestoreService.updateUser(updatedFromUser, from);
    await firestoreService.updateUser(updatedToUser, to);

     Get.snackbar(
        "Başarılı",
        "${amount} CurvyCHIP gönderildi.",
        colorText: Colors.white,
        backgroundColor: Color(0xFFD51CFF) 
      );

  }
}
