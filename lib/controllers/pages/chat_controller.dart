import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {

  ChatService chatService;

  List<Chat>? _chats;
  List<Chat>? get chats => _chats;

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



  @override
  Future<void> onInit() async {
    super.onInit();    

    await setCurrentUser();
    await chatService.getInitialChats();
    await chatService.listenUserChats();
    
  }

  Future setCurrentUser() async {
    _currentUser = await Get.find<FirestoreService>().getCurrentUser(currentUserID);
  }

  void setChats(List<Chat> updatedChats) {    
    _chats = updatedChats;
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
      print("sa");
      
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
    _currentChat = _chats!.where((chat) => chat.chatID == chatID).toList()[0];    
    Get.toNamed(Routes.chat);    
  }

  void setTypedMessage(String message){
    _typedMessage = message;    
  }

  Future likeMessage(int messageId) async {
    await chatService.likeMessage(_currentChat!.chatID!, messageId);
  }
  


}