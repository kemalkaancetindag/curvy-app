import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavController extends GetxController {

  int _currentIndex = 4; 
  
  
  int get currentIndex => _currentIndex;

  NavController();

  @override
  void onInit() {
    super.onInit();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();

  }




}