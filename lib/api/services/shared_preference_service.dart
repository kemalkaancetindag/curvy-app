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
    print(userData);
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

  Future<void> setLastUserID(String userID) async {
    sharedPreferences.setString("last_user_id", userID);
  }

  Future<void> deleteUser() async {
    await sharedPreferences.remove('user');
    
  }

  String? getLastUserID() {
    return sharedPreferences.getString('last_user_id');
  }

}