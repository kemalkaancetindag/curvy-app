import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/setup_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put(SharedPreferenceService());
  Get.put(FirestoreService());
  Get.put(UserService(firestoreService: Get.find()));
  Get.put(AuthService(firestoreService: Get.find()));
  Get.put(SetupService(mobileApiClient: Get.find()));
 
  
}