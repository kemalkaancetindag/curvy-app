import 'package:curvy_app/api/services/general_app_state_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/pages.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/matcher_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/dependencies/client_dependencies.dart';
import 'package:curvy_app/dependencies/controller_dependencies.dart';
import 'package:curvy_app/dependencies/service_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<void> main() async {
  
  
  
  Get.put(SharedPreferenceService());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initClients();
  await initServices();    

  var token = await FirebaseMessaging.instance.getToken();  
  await initControllers();
    
  Get.find<SetupController>().setInstanceToken(token!);
  
  
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
