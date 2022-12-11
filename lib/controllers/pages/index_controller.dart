import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
    UserService userService;

    UserModel? _user;
    UserModel? get user => _user;

    IndexPageController({
      required this.userService
    });

    @override
  Future<void> onInit() async {
    super.onInit();
    await setUser();
    
  }

    Future<void> setUser() async {
      UserModel? user = await userService.getUser('SHmcTGDSV1f0HmPV7QBPOGEixcW2');
      _user = user;
      update();
    }



  

}