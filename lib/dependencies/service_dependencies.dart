import 'package:curvy_app/api/services/setup_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  
 Get.put(SetupService(mobileApiClient: Get.find()));
 
  
}