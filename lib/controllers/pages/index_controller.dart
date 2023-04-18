import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/general_app_state_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';

import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
    UserService userService;
    String? _userID;

    UserModel? _user;
    UserModel? get user => _user;

    int? _compilation;
    int? get compilation => _compilation;

    IndexPageController({
      required this.userService
    });

    @override
  Future<void> onInit() async {    
    super.onInit();
    
    _userID = Get.find<SharedPreferenceService>().getUserID();
    _compilation = await calculateCompilationPercent();
    update();
    await Get.find<GeneralAppStateService>().setUserStatusOnline();    
    
    await setUser();
    
    await Get.find<GeneralAppStateService>().updateLocation();
    await Get.find<GeneralAppStateService>().updateInstanceToken();
    
    
    
  }

    Future<void> setUser() async {
      UserModel? user = await userService.getUser(_userID!);
      _user = user;
      update();
    }
  
  Future<int> calculateCompilationPercent() async {
    double percentPerField = 100/13;
    double compilation = 0;
    var user = await Get.find<FirestoreService>().getUser(_userID!);

    if(user.zodiac != null) {
      compilation += percentPerField;
    }

    if(user.person_type != null) {
      compilation += percentPerField;
    }

    if(user.pet_preference != null) {
      compilation += percentPerField;
    }

    if(user.smoke_preference != null) {
      compilation += percentPerField;
    }

    if(user.alchol_preference != null) {
      compilation += percentPerField;
    }

    if(user.job != null && user.job!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.city != null && user.city!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.about != null && user.about!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.interests != null && user.interests!.isNotEmpty) {
      compilation += percentPerField;
    }

    compilation += (3 * percentPerField);

    



    return compilation.toInt();
    
  }



  

}