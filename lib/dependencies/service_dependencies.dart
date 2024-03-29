import 'package:curvy_app/api/services/archive_service.dart';
import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/bot_controll_service.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/general_app_state_service.dart';
import 'package:curvy_app/api/services/hub_service.dart';
import 'package:curvy_app/api/services/life_cycle_observer_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/api/services/notification_service.dart';
import 'package:curvy_app/api/services/recommendation_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put(SharedPreferenceService());
  Get.put(FirestoreService());
  Get.put(NotificationService());
  Get.put(UserService(firestoreService: Get.find()));
  Get.put(MatchService(firestoreService: Get.find()));
  Get.put(AuthService(firestoreService: Get.find()));  
  Get.put(ChatService(firestoreService: Get.find()));
  Get.lazyPut(() => ArchiveService(firestoreService: Get.find()));
  Get.put(HubService(firestoreService: Get.find()));
  Get.put(GeneralAppStateService(sharedPreferenceService: Get.find(), firestoreService: Get.find()));
  Get.lazyPut(() => GeneralAppStateService(sharedPreferenceService: Get.find(), firestoreService: Get.find()));
  Get.put(LifeCycleObserverService(firestoreService: Get.find())); 
  Get.put(RecommendationService(firestoreService: Get.find())); 
  Get.put(BotControllService(firestoreService: Get.find()));
 
  
}