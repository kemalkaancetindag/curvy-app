import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
    UserService userService;
    String? _userID;

    UserModel? _user;
    UserModel? get user => _user;

    IndexPageController({
      required this.userService
    });

    @override
  Future<void> onInit() async {
    super.onInit();
    _userID = Get.find<SharedPreferenceService>().getUserID();
    await setUser();
    
  }

    Future<void> setUser() async {
      UserModel? user = await userService.getUser(_userID!);
      _user = user;
      update();
    }



  

}