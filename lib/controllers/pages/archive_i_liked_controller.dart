import 'package:curvy_app/api/services/archive_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/widgets/archive_liked_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ArchiveILikedController extends GetxController {
  ArchiveService archiveService;

  List<dynamic>? _usersILiked;
  List<dynamic>? get usersILiked => _usersILiked;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;

  ArchiveILikedController({required this.archiveService});

  @override
  Future<void> onInit() async {
    _usersILiked = await archiveService.getUsersILiked();    
    generateRows();
    update();
  }

  void generateRows() {
    _tiles = [];
    List<Widget> tempRow = [];
    int counter = 0;
    print(_usersILiked!.length);

    for(int i = _usersILiked!.length-1; i >= 0; i--) {
         Get.put(UserOnlineController(firestoreService: Get.find(), userID: _usersILiked![i]), tag: _usersILiked![i], permanent: true);
      _tiles!.add(
        GestureDetector(
          onTap: (){
            var userDetailController = Get.lazyPut(() => UserDetailController(firestoreService: Get.find(), userID: _usersILiked![i],matchService: Get.find()));          
            
                    
            Get.toNamed(Routes.userDetail);
          },
          child: ArchiveLikedBox(userID: _usersILiked![i]),
        )
      );    
    }

    
  }
}
