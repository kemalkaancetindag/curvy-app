import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


class MessagesController extends GetxController {
  bool _isMessages = true;
  bool get isMessages => _isMessages;
  List<List<double>> positions = [[-118, -118],[-118,-118]];
  double? lastDirection;


  void setIsMessages(bool isMessages) {
    _isMessages = isMessages;
    update();
  }

  void setPosition(int index, int side, double value, double oppositeValue, int oppositeIndex, double currentDirection){

    if(lastDirection != null){
      if(currentDirection > 0 && lastDirection! < 0){
        print("changed");
        positions[index][0] = -118;
        positions[index][1] = -118;
      }
      else{
        if(value < 0){
          positions[index][side] = value;
          positions[index][oppositeIndex] = oppositeValue;
        }
     
      }


    }
      

     
          
      update();
  }

  void resetPosition(int index) {
    positions[index][0] = -118;
    positions[index][1] = -118;
  }

  
    
    

  

}