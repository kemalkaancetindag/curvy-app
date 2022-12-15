import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  late SharedPreferences sharedPreferences;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadSharedPreferences();    
  }  

  Future<void> loadSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    await loadSharedPreferences();
    String jsonData = jsonEncode(userData);
    sharedPreferences.setString('user', jsonData);
  }

  bool checkIsUserLoggedIn()  {    
    String? user = sharedPreferences.getString('user');

    if(user != null){
      return true;      
    }

    return false;

  }

  String getUserID()  {
    var userData = (jsonDecode(sharedPreferences.getString('user')!) as Map<String,dynamic>);
    
    return userData["userID"];
  }

}