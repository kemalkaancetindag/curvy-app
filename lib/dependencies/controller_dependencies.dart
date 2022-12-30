

import 'package:curvy_app/controllers/archives_controller.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:curvy_app/controllers/pages/archive_i_liked_controller.dart';
import 'package:curvy_app/controllers/pages/archive_vip_profiles_controller.dart';
import 'package:curvy_app/controllers/pages/archive_who_liked_me_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/pages/edit_profile_controller.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:curvy_app/controllers/pages/settings_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';

import 'package:get/get.dart';

Future<void> initControllers() async {
  
  Get.put(NavController());
  Get.put(ArchivesController());
  Get.put(MessagesController());
  Get.lazyPut(() => MatcherController(firestoreService: Get.find(), goApiClient: Get.find()));
  Get.put(SetupController());
  Get.lazyPut(() => IndexPageController(userService: Get.find()));
  Get.lazyPut(() => EditProfileController(userService: Get.find(), firestoreService: Get.find()));
  Get.lazyPut(() => SettingsController(userService: Get.find(), firestoreService: Get.find()));
  Get.put(ExpandedMatcherStyleController());
  Get.lazyPut(() => ChatController(chatService: Get.find()));
  Get.put(ArchiveWhoLikedMeController(archiveService: Get.find()));
  Get.put(ArchiveILikedController(archiveService: Get.find()));
  Get.put(ArchiveVipProfilesController(archiveService: Get.find()));
  
}