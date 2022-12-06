

import 'package:curvy_app/ui/widgets/archive_liked.dart';
import 'package:curvy_app/ui/widgets/archive_likes.dart';
import 'package:curvy_app/ui/widgets/archive_vip_profiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArchivesController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget> pans = [ArchiveVipProfiles(), ArchiveLikes(),  ArchiveLiked()];

  void setPan(int index){
    _currentIndex = index;
    update();
  }


}