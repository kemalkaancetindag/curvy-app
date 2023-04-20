import 'package:curvy_app/ui/screens/archives.dart';
import 'package:curvy_app/ui/screens/explore.dart';
import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/matching.dart';
import 'package:curvy_app/ui/screens/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavController extends GetxController {

  int _currentIndex = 2; 
  int? tappedButton;
  List<Widget> mainPages = [ExploreScreen(),ArchivesScreen(),MatchingScreen(),MessagesScreen(),IndexScreen()];
  
  
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

  void buttonTapAnimation(int? id) {
    print("ID");
    print(id);
    tappedButton = id;
    update();
  }




}