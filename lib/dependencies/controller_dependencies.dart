

import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:curvy_app/api/services/setup_service.dart';
import 'package:curvy_app/controllers/archives_controller.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:curvy_app/controllers/pages/edit_profile_controller.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:curvy_app/controllers/pages/settings_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';

import 'package:get/get.dart';

Future<void> initControllers() async {
  
  Get.put(NavController());
  Get.put(ArchivesController());
  Get.put(MessagesController());
  Get.put(MatcherController());
  Get.put(SetupController(setupService: Get.find()));
  Get.put(IndexPageController(userService: Get.find()));
  Get.put(EditProfileController(userService: Get.find(), firestoreService: Get.find()));
  Get.put(SettingsController(userService: Get.find(), firestoreService: Get.find()));

  
}