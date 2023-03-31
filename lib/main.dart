import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/general_app_state_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/pages.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/dependencies/client_dependencies.dart';
import 'package:curvy_app/dependencies/controller_dependencies.dart';
import 'package:curvy_app/dependencies/service_dependencies.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';






Future<void> main() async {
  
  
  
  Get.put(SharedPreferenceService());
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initClients();
  await initServices();    

  var token = await FirebaseMessaging.instance.getToken(); 
  print("TOKENNNNNNNNN");
  print(token);
  await initControllers();
  var userID = Get.find<SharedPreferenceService>().getUserID();
  var updateData = Map<String,dynamic>();
  updateData['instance_token'] = token;
  updateData['online_status'] = true;
  

  var locationPermission = await GeolocatorPlatform.instance.checkPermission();
  if(locationPermission == LocationPermission.denied || locationPermission == LocationPermission.unableToDetermine || locationPermission == LocationPermission.deniedForever) {
    await GeolocatorPlatform.instance.requestPermission();
  }
   

  
  if(userID != null) {
    Get.find<FirestoreService>().updateUser(updateData, userID);
    Get.put(CurrentUserOnlineController(firestoreService: Get.find()));
    Get.find<FirestoreService>().updateUsersGeoHash();
  }
  
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(     
      theme: ThemeData(
        fontFamily: 'Gilroy'
      ),    
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: pages,
      
    );
  }
}
