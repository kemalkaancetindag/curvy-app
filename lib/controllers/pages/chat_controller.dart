import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
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

  String currentUserID = Get.find<SharedPreferenceService>().getUserID();
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  Chat? _currentChat;
  Chat? get currentChat => _currentChat;

  ChatController({required this.chatService});

  String? _typedMessage;
  String? get typedMessage => _typedMessage;

  List<Chat>? _currentChats;
  List<Chat>? get currentChats => _currentChats;





  @override
  Future<void> onInit() async {
    super.onInit();  

    await setCurrentUser();
    chatService.listenChats(); 
    
    
  }

  void setCurrentChats(List<Chat> currentChatsData) {
      _currentChats = currentChatsData;
      
  }



  

  Future setCurrentUser() async {
    _currentUser = await Get.find<FirestoreService>().getCurrentUser(currentUserID);
  }

  void setChats(List<Chat> activeChats, List<Chat> unActiveChats, List<Chat> newMatches) { 

        
    _activeChats = activeChats;
    _unActiveChats = unActiveChats;
    _newMatches = newMatches;      
  
      
    update();
  }

  String getLastMessageDate(int messageDate) {
    var sendingDate = DateTime.fromMillisecondsSinceEpoch(messageDate);
    var currentDate = DateTime.now();

    if(
      (sendingDate.day == currentDate.day)
      &&
      (sendingDate.month == currentDate.month)
      &&
      (sendingDate.year == currentDate.year)
    ){      
      
      return "${sendingDate.hour}:${sendingDate.minute}";
    }
  

    return "";
  }

  Future sendMessageToChat(String message) async {
    await chatService.sendMessageToChat(_currentChat!.chatID!, message);
    update();
  }

  void setTappedChat(String? chatID) {
    if(chatID != null){
      _tappedChat = chatID;  
    }
    else{
      _tappedChat = null;
    }

    update();
    
  }

  void setCurrentChat(String chatID) {
    chatService.listenCurrentChat(chatID);
    
    if(_isActiveMessages){
      _currentChat = _activeChats!.where((chat) => chat.chatID == chatID).toList()[0];    
    }
    else{
      _currentChat = _unActiveChats!.where((chat) => chat.chatID == chatID).toList()[0];    
    }    
    
    Get.toNamed(Routes.chat);    
  }

  void updateCurrentChat(Chat updatedChat) {
    _currentChat = updatedChat;
    update();
  }

  void setTypedMessage(String message){
    _typedMessage = message;    
  }

  Future likeMessage(int messageId) async {
    await chatService.likeMessage(_currentChat!.chatID!, messageId);
    update();
  }

  void setIsActiveMessages(bool state){
    var messagesController = Get.find<MessagesController>();
    
    _isActiveMessages = state;
    update();
  }

  Future startNewChatWithNewMatch(String chatID) async {
    await chatService.startNewChatWithNewMatch(chatID);
    setCurrentChat(chatID);
    update();
  }
  void clearCurrentChat() {
    _currentChat = null;
    update();
  }

  
  


}