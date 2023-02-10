

import 'package:curvy_app/controllers/archives_controller.dart';
import 'package:curvy_app/controllers/buy_curvy_chip_controller.dart';
import 'package:curvy_app/controllers/buy_curvy_like_controller.dart';
import 'package:curvy_app/controllers/buy_curvy_turbo_controller.dart';
import 'package:curvy_app/controllers/expanded_matcherstyle_controller.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/messages_controller.dart';
import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:curvy_app/controllers/pages/archive_i_liked_controller.dart';
import 'package:curvy_app/controllers/pages/archive_vip_profiles_controller.dart';
import 'package:curvy_app/controllers/pages/archive_who_liked_me_controller.dart';
import 'package:curvy_app/controllers/pages/chat_controller.dart';
import 'package:curvy_app/controllers/pages/edit_profile_controller.dart';
import 'package:curvy_app/controllers/pages/hub_controller.dart';
import 'package:curvy_app/controllers/pages/index_controller.dart';
import 'package:curvy_app/controllers/pages/second_login_controller.dart';
import 'package:curvy_app/controllers/pages/settings_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';

import 'package:get/get.dart';

Future<void> initControllers() async {
  
  Get.lazyPut(() => NavController());
  Get.lazyPut(() => ArchivesController());
  Get.lazyPut(() => MessagesController());
  Get.lazyPut(() => MatcherController(firestoreService: Get.find(), goApiClient: Get.find()));
  Get.put(SetupController());
  Get.lazyPut(() => IndexPageController(userService: Get.find()));
  Get.lazyPut(() => EditProfileController(userService: Get.find(), firestoreService: Get.find()));
  Get.lazyPut(() => SettingsController(firestoreService: Get.find()));
  Get.put(ExpandedMatcherStyleController());
  Get.lazyPut(() => ChatController(chatService: Get.find()));
  Get.lazyPut(() => ArchiveWhoLikedMeController(archiveService: Get.find()));
  Get.lazyPut(() => ArchiveILikedController(archiveService: Get.find()));
  Get.lazyPut(() => ArchiveVipProfilesController(archiveService: Get.find()));
  Get.put(HubController(hubService: Get.find()));
  Get.lazyPut(() => SecondLoginController(firestoreService: Get.find(), sharedPreferenceService: Get.find()));
  Get.put(BuyCurvyTurboCotroller());
  Get.put(BuyCurvyLikeController());
  Get.put(BuyCurvyChipController());
  
  
}