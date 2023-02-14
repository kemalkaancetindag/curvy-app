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
    String jsonData = jsonEncode(userData);
    sharedPreferences.setString('user', jsonData);
  }

  bool checkIsUserLoggedIn()  {    
    String? user = sharedPreferences.getString('user');
    print("USERRRRRRRRRR");
    print(user);

    if(user != null){
      return true;      
    }

    return false;

  }

  String? getUserID()  {
    var userJsonData = sharedPreferences.getString('user');
    if(userJsonData != null){
      var userData = (jsonDecode(userJsonData) as Map<String,dynamic>);
      return userData["userID"];
    }    
    
    return null;
  }

  Future<void> setLastUserID(String userID) async {
    sharedPreferences.setString("last_user_id", userID);
  }

  Future<void> deleteUser(bool isDeleting) async {
    await sharedPreferences.remove('user');
    if(isDeleting) {
      await sharedPreferences.remove('last_user_id');
    }
    
    
  }

  String? getLastUserID() {
    return sharedPreferences.getString('last_user_id');
  }

}