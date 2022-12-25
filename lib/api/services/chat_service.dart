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

    await Future.forEach(user.chat!.active_chats!, (chatID) async {
      var chatSnapshot =
          await firestoreService.getCollection('chats').doc(chatID).get();
      var chat = Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);
      if (userID == chat.user1) {
        
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user2!),
            tag: chat.user2!!);
      } else {
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user1!),
            tag: chat.user1!);
      }

      if(chat.isStarted!){
        activeChats.add(chat);
      }
      else{
        newMatches.add(chat);
      }

      
    });

     await Future.forEach(user.chat!.trash_chats!, (chatID) async {
      var chatSnapshot =
          await firestoreService.getCollection('chats').doc(chatID).get();
      var chat = Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);
      if (userID == chat.user1) {
        
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user2!),
            tag: chat.user2!!);
      } else {
        Get.put(
            UserOnlineController(
                firestoreService: firestoreService, userID: chat.user1!),
            tag: chat.user1!);
      }



      unActiveChats.add(chat);
    });

    Get.find<ChatController>().setChats(activeChats, unActiveChats, newMatches);
  }

  Future listenUserChats() async {
    String userID = Get.find<SharedPreferenceService>().getUserID();
    UserModel user = await firestoreService.getCurrentUser(userID);
    firestoreService
        .getCollection('chats')
        .where("chatID", whereIn: user.chat!.active_chats!)
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.modified:
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
                    tag: chat.user2!);
              } else {
                Get.put(
                    UserOnlineController(
                        firestoreService: firestoreService,
                        userID: chat.user1!),
                    tag: chat.user1!);
              }

              if(chat.isActive!){
                if(chat.isStarted!){
                  activeChats.add(chat);
                }else{
                  newMatches.add(chat);
                }
                
              }
              else{
                unActiveChats.add(chat);
              }

              
            });
            Get.find<ChatController>().setChats(activeChats,unActiveChats,newMatches);
            Get.find<ChatController>().setCurrentChat(Get.find<ChatController>().currentChat!.chatID!);            
            break;
          case DocumentChangeType.added:
            break;
          case DocumentChangeType.removed:
            break;
        }
      }
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
      isSeen: false
    );

    chat.lastMessage = message;
    chat.lastMessageDate = DateTime.now().millisecondsSinceEpoch;

    chat.messages!.add(messageData); 
    var chatData = chat.toJson();



    await firestoreService.sendMessageToChat(chatData, chatID);
    

  }

  Future likeMessage(String chatID, int messageId) async{
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
}
