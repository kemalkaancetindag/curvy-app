import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  void listenChats() async {
    var chatController = Get.find<ChatController>();
    var messagesController = Get.find<MessagesController>();
    

    String userID = Get.find<SharedPreferenceService>().getUserID();
    var currentUserDoc =  (await firestoreService.getCollection('users').where('userID', isEqualTo: userID).get()).docs[0];

    Stream<DocumentSnapshot> userStream = firestoreService.getCollection('users').doc(currentUserDoc.id).snapshots();
    Stream<QuerySnapshot> chatStream = firestoreService.getCollection('chats').snapshots();
    
    await for(var user in userStream){
      
      var userObject = UserModel.fromJson(user.data() as Map<String,dynamic>);

      await for(var chats in chatStream) {
        List<Chat> activeChats = [];
        List<Chat> unActiveChats = [];
        List<Chat> newMatches = [];
        List<Chat> allChats = [];
        
        var filteredChats = chats.docs.where((chat) => userObject.chat!.active_chats!.contains(chat['chatID'])).toList();
        filteredChats.forEach((chatDoc) { 
          var currentChat = Chat.fromJson(chatDoc.data() as Map<String,dynamic>);

          if(currentChat.user1 == userID){
            Get.put(
              UserOnlineController(firestoreService: firestoreService, userID: currentChat.user2!),
              tag: currentChat.user2!,
              
            );
          }
          else{
             Get.put(
              UserOnlineController(firestoreService: firestoreService, userID: currentChat.user1!),
              tag: currentChat.user1!
            );
          }
          allChats.add(currentChat);

          if(currentChat.isActive!){
                        
            if(currentChat.isStarted!){
              activeChats.add(currentChat);
            }
            else{                            
              newMatches.add(currentChat);
            }
          }
          else{
            unActiveChats.add(currentChat);
          }          
        });
        
        

        messagesController.generatePositions(activeChats.length, true);
        messagesController.generatePositions(unActiveChats.length, false);

        chatController.setAllChats(allChats);
        chatController.setCurrentChats();
        
        
        chatController.setChats(activeChats, unActiveChats, newMatches);
      }



      
    }



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

  Future deactivateChat(String chatID) async {
    var updateData = Map<String, dynamic>();
    updateData['isActive'] = false;
    await firestoreService.updateChat(updateData, chatID);
  }
}
