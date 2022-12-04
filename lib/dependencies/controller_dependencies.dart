

import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:curvy_app/api/services/setup_service.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:get/get.dart';

Future<void> initControllers() async {
  Get.put(MatcherController());
  Get.put(SetupController(setupService: Get.find()));
  
}