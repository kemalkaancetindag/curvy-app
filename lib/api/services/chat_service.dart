import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class ChatService extends GetxService {
  FirestoreService firestoreService;

  ChatService({required this.firestoreService});

  Future getInitialChats() async {
    String userID = Get.find<SharedPreferenceService>().getUserID();
    UserModel user = await firestoreService.getCurrentUser(userID);
    List<Chat> activeChats = [];
    List<Chat> unActiveChats = [];
    List<Chat> newMatches = [];
    List<String> chatIDS = [];

    await Future.forEach(user.chat!.active_chats!, (chatID) async {
      chatIDS.add(chatID);
      var chatSnapshot =
          await firestoreService.getCollection('chats').doc(chatID).get();
      var chat = Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);
      if (userID == chat.user1) {
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user2!),
            tag: chat.user2!,
            permanent: true);
      } else {
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user1!),
            tag: chat.user1!,
            permanent: true);
      }

      if (chat.isActive!) {
        if (chat.isStarted!) {
          activeChats.add(chat);
        } else {
          print("neeeeeeeeeeeeeeeeeeeeeeeeeee");
          print(chat.chatID);
          newMatches.add(chat);
        }
      } else {
        unActiveChats.add(chat);
      }
    });

    chatIDS.forEach((element) {
      print(element);
    });
    print("----------------------------------");
    activeChats.forEach((element) {
      print(element.chatID!);
    });
    print("----------------------------------");

    Get.find<ChatController>().setChats(activeChats, unActiveChats, newMatches);
  }

  Future listenUserChats() async {
    String userID = Get.find<SharedPreferenceService>().getUserID();

    firestoreService
        .getCollection("users")
        .where("userID", isEqualTo: userID)
        .snapshots()
        .listen((userEvent) {
      var user = UserModel.fromJson(
          userEvent.docChanges[0].doc.data() as Map<String, dynamic>);
          
      firestoreService
          .getCollection('chats')
          .where("chatID", whereIn: user.chat!.active_chats!)
          .snapshots()
          .listen((event) {
        for (var change in event.docChanges) {
          switch (change.type) {
            case DocumentChangeType.modified:
              print("GELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
              List<Chat> activeChats = [];
              List<Chat> unActiveChats = [];
              List<Chat> newMatches = [];
              event.docs.forEach((chatSnapshot) {
                var chat =
                    Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);

                if (userID == chat.user1!) {
                  Get.put(
                      UserOnlineController(
                          firestoreService: firestoreService,
                          userID: chat.user2!),
                      tag: chat.user2!,
                      permanent: true);
                } else {
                  Get.put(
                      UserOnlineController(
                          firestoreService: firestoreService,
                          userID: chat.user1!),
                      tag: chat.user1!,
                      permanent: true);
                }

                if (chat.isActive!) {
                  if (chat.isStarted!) {
                    activeChats.add(chat);
                  } else {
                    newMatches.add(chat);
                  }
                } else {
                  unActiveChats.add(chat);
                }
              });
              Get.find<ChatController>()
                  .setChats(activeChats, unActiveChats, newMatches);
              if (Get.find<ChatController>().currentChat != null) {
                Get.find<ChatController>().setCurrentChat(
                    Get.find<ChatController>().currentChat!.chatID!);
              }
              break;
            case DocumentChangeType.added:
              print("GELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL2");
              List<Chat> activeChats = [];
              List<Chat> unActiveChats = [];
              List<Chat> newMatches = [];
              event.docs.forEach((chatSnapshot) {
                var chat =
                    Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);

                if (userID == chat.user1!) {
                  print("neeeeeeeeeeeeeeeeeeeeeeeeeee1");
                  Get.put(
                      UserOnlineController(
                          firestoreService: firestoreService,
                          userID: chat.user2!),
                      tag: chat.user2!,
                      permanent: true);
                } else {
                  print("neeeeeeeeeeeeeeeeeeeeeeeeeee2");
                  Get.put(
                      UserOnlineController(
                          firestoreService: firestoreService,
                          userID: chat.user1!),
                      tag: chat.user1!,
                      permanent: true);
                }

                if (chat.isActive!) {
                  if (chat.isStarted!) {
                    activeChats.add(chat);
                  } else {
                    
                    print(chat.chatID);
                    newMatches.add(chat);
                  }
                } else {
                  unActiveChats.add(chat);
                }
              });
              Get.find<ChatController>()
                  .setChats(activeChats, unActiveChats, newMatches);
              if (Get.find<ChatController>().currentChat != null) {
                Get.find<ChatController>().setCurrentChat(
                    Get.find<ChatController>().currentChat!.chatID!);
              }

              break;
            case DocumentChangeType.removed:
              break;
          }
        }
      });
    });
  }

  Future sendMessageToChat(String chatID, String message) async {
    String userID = Get.find<SharedPreferenceService>().getUserID();
    var currentDate = DateTime.now().millisecondsSinceEpoch;
    var chat = await firestoreService.getChat(chatID);

    var messageData = Message(
        messageId: chat.messages!.length,
        senderId: userID,
        content: message,
        type: 0,
        sendingDate: currentDate,
        isLiked: false,
        isSeen: false);

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

  Future startNewChat(String message, String user2, int startingType) async {
    var userID = Get.find<SharedPreferenceService>().getUserID();
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

    var currentUser = await firestoreService.getCurrentUser(userID);
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
  }
}
