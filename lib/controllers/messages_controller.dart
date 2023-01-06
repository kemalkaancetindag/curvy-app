import 'package:curvy_app/api/services/chat_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class MessagesController extends GetxController {
  bool _isMessages = true;
  bool get isMessages => _isMessages;

  List<List<double>>? _activeChatPositions;
  List<List<double>>? get activeChatPositions => _activeChatPositions;

  List<List<double>>? _unActiveChatPositions;
  List<List<double>>? get unActiveChatPositions => _unActiveChatPositions;

  double? lastDirection;

  void setIsMessages(bool isMessages, int chatLength) {    
    _isMessages = isMessages;
    update();
  }

  void slideMessageBox(int boxIndex, double xChange, bool isActiveMessages) {
    if (isActiveMessages) {
      if (xChange < 0) {
        if (_activeChatPositions![boxIndex][1] < -10) {
          _activeChatPositions![boxIndex][0] =
              _activeChatPositions![boxIndex][0] + xChange;
          _activeChatPositions![boxIndex][1] =
              _activeChatPositions![boxIndex][1] - xChange;
        }
      } else {
        if (_activeChatPositions![boxIndex][0] < -10) {
          _activeChatPositions![boxIndex][0] =
              _activeChatPositions![boxIndex][0] + xChange;
          _activeChatPositions![boxIndex][1] =
              _activeChatPositions![boxIndex][1] - xChange;
        }
      }
    }
    else{
      if (xChange < 0) {
        if (_unActiveChatPositions![boxIndex][1] < -10) {
          _unActiveChatPositions![boxIndex][0] =
              _unActiveChatPositions![boxIndex][0] + xChange;
          _unActiveChatPositions![boxIndex][1] =
              _unActiveChatPositions![boxIndex][1] - xChange;
        }
      } else {
        if (_unActiveChatPositions![boxIndex][0] < -10) {
          _unActiveChatPositions![boxIndex][0] =
              _unActiveChatPositions![boxIndex][0] + xChange;
          _unActiveChatPositions![boxIndex][1] =
              _unActiveChatPositions![boxIndex][1] - xChange;
        }
      }
    }

    update();
  }

  Future<void> deactivateChat(String chatID, int boxIndex) async {
    if (_activeChatPositions![boxIndex][1] > -10) {
      await Get.find<ChatService>().deactivateChat(chatID);
    } else {
      _activeChatPositions![boxIndex][0] = -118;
      _activeChatPositions![boxIndex][1] = -118;
    }
    update();
  }

  void generatePositions(int chatLength, bool isActiveMessages) {
    List<List<double>> tempPositions = [];
    for (int i = 0; i < chatLength; i++) {
      tempPositions.add([-118, -118]);
    }

    if(isActiveMessages){
      _activeChatPositions = tempPositions;  
    }
    else{
      _unActiveChatPositions = tempPositions;  
    }
    
  }
}
