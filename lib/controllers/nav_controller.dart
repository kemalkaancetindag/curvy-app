import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavController extends GetxController {

  int _currentIndex = 4; 
  List<Widget> _pages = <Widget>[];
  

  List<Widget> get pages => _pages;
  int get currentIndex => _currentIndex;

  NavController();

  @override
  void onInit() {
    super.onInit();
  }




}