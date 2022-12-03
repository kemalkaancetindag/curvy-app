

import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:curvy_app/api/services/setup_service.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:get/get.dart';

Future<void> initControllers() async {
  Get.put(MobileApiClient(baseUrl: "http://10.0.2.2:3000"));
  Get.put(SetupService(mobileApiClient: Get.find()));
  Get.put(SetupController(setupService: Get.find()));
  
}