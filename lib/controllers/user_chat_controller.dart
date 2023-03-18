import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class UserChatController extends GetxController {
  FirestoreService firestoreService;
  String userID;

  UserModel? _user;
  UserModel? get user => _user;

  List<double>? _chatCurrentPosition;
  List<double>? get chatCurrentPosition => _chatCurrentPosition;

  bool _isTapping = false;
  bool get isTapping => _isTapping;

  UserChatController({required this.firestoreService, required this.userID});

  @override
  Future<void> onInit() async {
    _chatCurrentPosition = [-Dimensions.w11 * 10, -Dimensions.w11 * 10];
    startListening();
  }

  void startListening() async {
    var userDoc = (await firestoreService
            .getCollection('users')
            .where('userID', isEqualTo: userID)
            .get())
        .docs[0];

    Stream<DocumentSnapshot> userStream =
        firestoreService.getCollection('users').doc(userDoc.id).snapshots();

    await for (var user in userStream) {
      _user = UserModel.fromJson(user.data() as Map<String, dynamic>);

      update();
    }
  }

  void slideTile(double xChange, String chatID) async {
    if (xChange < 0) {
      var nextRightPosition = _chatCurrentPosition![1] - xChange;

      if (nextRightPosition < 0) {
        _chatCurrentPosition![0] = _chatCurrentPosition![0] + xChange;
        _chatCurrentPosition![1] = _chatCurrentPosition![1] - xChange;
      }
    } else if (xChange > 0) {
      var nexLeftPosition = _chatCurrentPosition![0] + xChange;
      if (nexLeftPosition < 0) {
        _chatCurrentPosition![0] = _chatCurrentPosition![0] + xChange;
        _chatCurrentPosition![1] = _chatCurrentPosition![1] - xChange;
      }
    } else {}

    update();
  }

  void setBackgroundColor(bool state) {
    _isTapping = state;
    update();
  }

  void resetPosition() {
    _chatCurrentPosition![0] = -Dimensions.w11 * 10;
    _chatCurrentPosition![1] = -Dimensions.w11 * 10;
    _isTapping = false;
    update();
  }

  Future decideSlideAction(String chatID) async {
    var chatController = Get.find<ChatController>();
    var chatService = Get.find<ChatService>();
    if (chatCurrentPosition![1] > -5) {
      if (chatController.isActiveMessages) {
        await chatService.deactivateChat(chatID);
      } else {
        await chatService.deleteChat(chatID);
      }
    } else if (chatCurrentPosition![0] > -5) {
      if (chatController.isActiveMessages) {
      } else {
        await chatService.activateChat(chatID);
      }
    }
  }

  Future deleteChat(String chatID) async {
    var chatController = Get.find<ChatController>();
    var chatService = Get.find<ChatService>();
    if (chatController.isActiveMessages) {
      await chatService.deactivateChat(chatID);
    } else {
      await chatService.deleteChat(chatID);
    }

    update();
  }

  Future activateOrReportChat(String chatID) async {
        var chatController = Get.find<ChatController>();
    var chatService = Get.find<ChatService>();
     if (chatController.isActiveMessages) {
      } else {
        await chatService.activateChat(chatID);
      }
  }
}
