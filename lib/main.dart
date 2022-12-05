import 'package:curvy_app/dependencies/client_dependencies.dart';
import 'package:curvy_app/dependencies/controller_dependencies.dart';
import 'package:curvy_app/dependencies/service_dependencies.dart';
import 'package:curvy_app/ui/screens/chat.dart';
import 'package:curvy_app/ui/screens/delete_account_last_chance.dart';
import 'package:curvy_app/ui/screens/delete_account_why.dart';
import 'package:curvy_app/ui/screens/edit_profile.dart';
import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/login.dart';
import 'package:curvy_app/ui/screens/matching.dart';
import 'package:curvy_app/ui/screens/messages.dart';
import 'package:curvy_app/ui/screens/save_account.dart';
import 'package:curvy_app/ui/screens/send_feedback.dart';
import 'package:curvy_app/ui/screens/settings.dart';
import 'package:curvy_app/ui/screens/setup_add_image.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/screens/setup_interests.dart';
import 'package:curvy_app/ui/screens/setup_name.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/screens/setup_showme.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/screens/validation_number.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  
  await initClients();
  await initServices();
  await initControllers();
  WidgetsFlutterBinding.ensureInitialized();
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
      home:  const ChatScreen(),
    );
  }
}
