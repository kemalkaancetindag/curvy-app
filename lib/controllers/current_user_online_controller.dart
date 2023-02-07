import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class CurrentUserOnlineController extends GetxController {
  FirestoreService firestoreService;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  int _unAnsweredMessages = 0;
  int get unAnsweredMessages => _unAnsweredMessages;

  CurrentUserOnlineController({required this.firestoreService});

  @override
  Future<void> onInit() async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    var user = (await firestoreService
            .getCollection("users")
            .where("userID", isEqualTo: currentUserID)
            .get())
        .docs[0];
    Stream<DocumentSnapshot> userStream =
        firestoreService.getCollection("users").doc(user.id).snapshots();
    listenUserChats();    
    
    await for (var userSnapshot in userStream) {
      _userModel =
          UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      update();
    }
  }

  void listenUserChats() {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID()!;
    firestoreService
        .getCollection("chats")
        .where("user1", isEqualTo: currentUserID)
      ..snapshots().listen((event) {
        _unAnsweredMessages = 0;
        event.docs.forEach((element) {
          _unAnsweredMessages = 0;
          var chat = Chat.fromJson(element.data() as Map<String, dynamic>);
          chat.messages!.forEach((message) {
            if (!message.isSeen! && message.senderId != currentUserID) {
              _unAnsweredMessages += 1;
            }
          });
          update();
        });
      });

    firestoreService
        .getCollection("chats")
        .where("user2", isEqualTo: currentUserID)
      ..snapshots().listen((event) {
        
        event.docs.forEach((element) {
          _unAnsweredMessages = 0;
          var chat = Chat.fromJson(element.data() as Map<String, dynamic>);
          chat.messages!.forEach((message) {
            if (!message.isSeen! && message.senderId != currentUserID) {
              _unAnsweredMessages += 1;
            }
          });
          update();
        });
      });
  }
}
