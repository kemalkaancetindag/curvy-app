import 'package:curvy_app/api/services/archive_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/ui/widgets/archive_vip_profile_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArchiveVipProfilesController extends GetxController {
  
  ArchiveService archiveService;
  List<dynamic>? _vipProfiles;  
  List<dynamic>? get vipProfiles => _vipProfiles;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;

  ArchiveVipProfilesController({required this.archiveService});
  

  @override
  Future<void> onInit() async {
    _vipProfiles = await archiveService.getVipProfiles();
    generateTiles();
    update();
  }

  void generateTiles() {
    _tiles = [];
    _vipProfiles!.forEach((userID) { 
      Get.put(UserOnlineController(firestoreService: Get.find(), userID: userID), permanent: true, tag: userID);
      _tiles!.add(GestureDetector(
        onTap: () async {
          var userDetailController = Get.put(UserDetailController(firestoreService: Get.find(), userID: userID));          
                    
          Get.toNamed(Routes.userDetail);
        },
        child: ArchiveVipProfileBox(userID: userID,),
      ));      
    });
  }


}