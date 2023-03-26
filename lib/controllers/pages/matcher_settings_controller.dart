import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/controllers/pages/new_matcher_controller.dart';

import 'package:get/get.dart';

class MatcherSettingsController extends GetxController {
  FirestoreService firestoreService;

  bool _isTapped = false;
  bool get isTapped => _isTapped;

  bool _isEveryThingSet = false;
  bool get isEveryThingSet => _isEveryThingSet;

  double? _distancePreference;
  double? get distancePreference => _distancePreference;

  int? _minAgePreference;
  int? get minAgePreference => _minAgePreference;
  int? _maxAgePreference;
  int? get maxAgePreference => _maxAgePreference;

  int? _showmePreference;
  int? get showmePreference =>  _showmePreference;

  bool? _ageOnlyThisInterval;
  bool? get ageOnlyThisInterval => _ageOnlyThisInterval;

  bool? _distanceOnlyThisInterval;
  bool? get distanceOnlyThisInterval =>_distanceOnlyThisInterval;

  bool? _globalPreference;
  bool? get globalPreference => _globalPreference;

  bool? _onlyConfirmedProfiles;
  bool? get onlyConfirmedProfiles => _onlyConfirmedProfiles;


  MatcherSettingsController({
    required this.firestoreService
  });

  @override
  Future<void> onInit() async {
    await setInitialValues();
  }

  Future setInitialValues() async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var user = await firestoreService.getUser(userID);

    _distancePreference = user.settings!.distance_preference!.distance!;
    _distanceOnlyThisInterval = user.settings!.distance_preference!.only_this_interval!;

    _minAgePreference = user.settings!.age_preference!.min_age!;
    _maxAgePreference = user.settings!.age_preference!.max_age!;
    _ageOnlyThisInterval = user.settings!.age_preference!.only_this_interval!;


    _showmePreference = user.show_me!;

    _globalPreference = user.settings!.global!;

    _isEveryThingSet = true;
    _onlyConfirmedProfiles  = true;
    update();

  }


  void setDistancePreference( double value) {
    _distancePreference = value;    
    
    update();
  }

  void setShowMe(int pref) {
    _showmePreference = pref;
    update();    
  }

  void setAgePreference(double min, double max) {


    _minAgePreference = (min*100).toInt();
    _maxAgePreference = (max*100).toInt();
    update();
  }

  void setGlobal(bool state){
    _globalPreference = state;
    update();
  }

  void setAgeOnlyThisInterval(bool state){
    _ageOnlyThisInterval = state;
    update();
  }
  
  void setDistanceOnlyThisInterval(bool state) {
    _distanceOnlyThisInterval = state;
    update();
  }

  void setIsTapped(bool state) {
    _isTapped = state;
    update();
  }

  Future updateMatcherSettings() async {
    
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var data = Map<String,dynamic>();
    data['settings.distance_preference.distance'] = _distancePreference;
    data['settings.distance_preference.only_this_interval'] = _distanceOnlyThisInterval;
    data['settings.age_preference.min_age'] = _minAgePreference;
    data['settings.age_preference.max_age'] = _maxAgePreference;
    data['settings.age_preference.only_this_interval'] = _ageOnlyThisInterval;
    data['settings.global'] = _globalPreference;

    await firestoreService.updateUser(data, userID);
    

    
    Get.back();
  }

  Future updateShowme() async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var data = Map<String,dynamic>();

    data['show_me']  = _showmePreference;

    await firestoreService.updateUser(data, userID);
    Get.back();
    Get.find<NewMatcherController>().updatePageBySexPreference();
    
  }




}