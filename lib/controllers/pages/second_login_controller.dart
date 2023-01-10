import 'dart:convert';

import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:get/get.dart';

class SecondLoginController extends GetxController {

  FirestoreService firestoreService;
  SharedPreferenceService sharedPreferenceService;

  String? _name;
  String? get name => _name;

  SecondLoginController({
    required this.firestoreService,
    required this.sharedPreferenceService
  });

  @override
  Future<void> onInit() async {
    await setLastUserName();
  }

  Future login() async {
    var lastUserID = sharedPreferenceService.getLastUserID();

    var userDocument = await firestoreService.getCollection('users').doc(lastUserID).get();
    
    var userData = (userDocument.data() as Map<String,dynamic>);

    await sharedPreferenceService.saveUser(userData);

    Get.offAllNamed(Routes.index);
  }

  Future setLastUserName() async {
    var lastUserID = sharedPreferenceService.getLastUserID();
    var lastUserDocument = await firestoreService.getCollection('users').doc(lastUserID).get();

    _name = (lastUserDocument.data() as Map<String,dynamic>)['name'].split(" ").first;
    update();
    
  }




}