

import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:curvy_app/api/services/setup_service.dart';
import 'package:curvy_app/controllers/archives_controller.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
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
  Get.lazyPut(() => MatcherController(firestoreService: Get.find()));
  Get.put(SetupController(setupService: Get.find()));
  Get.lazyPut(() => IndexPageController(userService: Get.find()));
  Get.lazyPut(() => EditProfileController(userService: Get.find(), firestoreService: Get.find()));
  Get.lazyPut(() => SettingsController(userService: Get.find(), firestoreService: Get.find()));
  Get.put(ExpandedMatcherStyleController());

  
}