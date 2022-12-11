import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SharedPreferenceService());
  }

}