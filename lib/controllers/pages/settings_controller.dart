import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/enums/login_method_enums.dart';
import 'package:curvy_app/enums/settings_enum.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  FirestoreService firestoreService;

  UserModel? _user;
  UserModel? get user => _user;

  Map<String, dynamic>? _settings;
  Map<String, dynamic>? get settings => _settings;

  int? _tappedButton;
  int? get tappedButton => _tappedButton;

  bool _isUsernameTaken = false;
  bool get isUserNameTaken => _isUsernameTaken;

  SettingsController({required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();
    var userID = Get.find<SharedPreferenceService>().getUserID();
    var user = await firestoreService.getUserAsMap(userID!);

    if (user != null) {
      _user = UserModel.fromJson(user);
      _settings = user['settings'] as Map<String, dynamic>;
   
      
    }

    update();
  }

  //DISTANCE

  void updateDistancePreferenceDistance(int distance) {
    var keys = Settings.distancePreferenceDistance.value.split(".");
    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = distance;
    update();
  }

  void updateDistancePreferenceOnlyThisInterval(bool state) {
    var keys = Settings.distancePreferenceOnlyThisInterval.value.split(".");
    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  //DISTANCE

  //AGE

  void updateAgePreferenceAge(double min, double max) {
    var maxAgeKeys = Settings.agePreferenceMaxAge.value.split(".");
    var minAgeKeys = Settings.agePreferenceMinAge.value.split(".");

    (_settings![minAgeKeys[0]] as Map<String, dynamic>)[minAgeKeys[1]] =
        (min * 100).toInt();
    (_settings![maxAgeKeys[0]] as Map<String, dynamic>)[maxAgeKeys[1]] =
        (max * 100).toInt();

    update();
  }

  void updateAgePreferenceOnlyThisInterval(bool state) {
    var keys = Settings.agePreferenceOnlyThisInterval.value.split(".");
    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  //AGE

  // INLINE SWITCHES
  void updateGlobal(bool state) {
    var key = Settings.global.value;
    _settings![key] = state;

    update();
  }

  void updateHideMeOnVIP(bool state) {
    var keys = Settings.visibilityHideMeOnVIP.value.split(".");

    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  void updateRecommendMeOnTurbo(bool state) {
    var keys = Settings.visibilityRecommendMeOnTurbo.value.split(".");

    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  void updateHideMeOnFreestyle(bool state) {
    var keys = Settings.visibilityHideMeOnFreestyle.value.split(".");

    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  void updatePlayVideosAutomatically(bool state) {
    var key = Settings.playVideosAutomatically.value;
    _settings![key] = state;

    update();
  }

  void updateHideOnlineStatus(bool state) {
    var key = Settings.hideOnlineStatus.value;
    _settings![key] = state;
    update();
  }

  void updateHideLastOnlineStatus(bool state) {
    var key = Settings.hideLastOnlineStatus.value;
    _settings![key] = state;
    update();
  }

  void updateCloseCurvyTeamPromotions(bool state) {
    var keys = Settings.closeCurvyTeamPromotions.value.split(".");

    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  //INLINE SWITCHES

  //COLUMN SWITCHES

  void updateHideMeOnMatcherStyle(bool state) {
    var keys = Settings.visibilityHideMeOnMatcherstyle.value.split(".");

    (_settings![keys[0]] as Map<String, dynamic>)[keys[1]] = state;
    update();
  }

  void updateCloseReadingNotifications(bool state) {
    var key = Settings.closeReadingNotifications.value;
    _settings![key] = state;
  }
  //COLUMN SWITCHES

  //CURVY PLUS SELECT
  void updateRecommendationPreference(int preference) {
    if (_user!.plus_member! || _user!.platinum_member!) {
      var key = Settings.recommendationPreference.value;
      _settings![key] = preference;
      update();
    }
  }

  void updateViewerPreference(int preference) {
    if (_user!.plus_member! || _user!.platinum_member!) {
      var key = Settings.viewerPreference.value;
      _settings![key] = preference;
      update();
    }
  }
  //CURVY PLUS SELECT

  //LANGUAGE

  void updateLanguage(int preference) {  
    _settings![Settings.language.value] = preference;
    update();
  }
  //LANGUAGE

  //EMAIL NOTIFICATIONS
  void updateEmailNotifications(String settingName, bool value) async {
    var keys = settingName.split(".");
    (_settings![keys[0]] as Map<String,dynamic>)[keys[1]]= value;
    update();
  }

  void sendEmailNotifications() async {
    String? userID = Get.find<SharedPreferenceService>().getUserID();
    var updateData = Map<String,dynamic>();
    updateData["settings"] = _settings;
 
    if(userID != null) {
      await firestoreService.updateUser(updateData, userID);
      var mapUser = await firestoreService.getUserAsMap(userID);

      if(mapUser != null) {
        _settings = (mapUser["settings"] as Map<String,dynamic>);
        _user = UserModel.fromJson(mapUser);
      }
    }
    update();

  }
  //EMAIL NOTIFICATIONS

  //INSTANT NOTIFICATIONS
  void updateInstantNotifications(String settingName, dynamic value) {
    var keys = settingName.split(".");
    (_settings![keys[0]] as Map<String,dynamic>)[keys[1]] = value;
    update();
  }

  void sendInstantNotifications() async {
    String? userID = Get.find<SharedPreferenceService>().getUserID();    
    var updateData = Map<String,dynamic>();

    updateData['settings'] = _settings;

    if(userID != null){
      await firestoreService.updateUser(updateData, userID);
      var mapUser = await firestoreService.getUserAsMap(userID);

      if(mapUser != null) {
        _settings = (mapUser['settings'] as Map<String,dynamic>);
        _user = UserModel.fromJson(mapUser);
      }

    }

    update();
  }
  //INSTANT NOTIFICATIONS

  //PRIVACY PREFERENCES
  void updatePrivacyPreferences(String settingName, bool value) {
    var keys = settingName.split(".");

    if(keys.length == 2) {
      (_settings![keys[0]] as Map<String,dynamic>)[keys[1]] = value;
    }
    else if(keys.length == 3) {
      ((_settings![keys[0]] as Map<String,dynamic>)[keys[1]] as Map<String,dynamic>)[keys[2]] = value;
    }

    update();
  }

  void sendPrivacypreferences() async {
    String? userID = Get.find<SharedPreferenceService>().getUserID();
    var updateData = Map<String,dynamic>();

    updateData["settings"] = _settings;

    if(userID != null){
      await firestoreService.updateUser(updateData, userID);

      var mapUser = await firestoreService.getUserAsMap(userID);

      if(mapUser != null){
        _user = UserModel.fromJson(mapUser);
        _settings = mapUser["settings"] as Map<String,dynamic>;
      }


    }

    update();    
  }
  //PRIVACY PREFERENCES

  Future<void> updatePage() async {   
    
    var updateData = Map<String,dynamic>();
    updateData['settings'] = _settings;
    await firestoreService.updateUser(updateData, _user!.userID!);
    var mapUser = await firestoreService.getUserAsMap(_user!.userID!);
    if(user != null){
      _user = UserModel.fromJson(mapUser!);
          
      _settings = mapUser['settings'] as Map<String,dynamic>;            
      
    }    
    
    Get.back();
  }

  void setTappedButton(int? buttonID) {
    _tappedButton = buttonID;
    update();
  }

  

  

  void logout() async {
    await Get.find<SharedPreferenceService>().deleteUser();
    Get.offAllNamed(Routes.login);
  }
}
