import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/enums/login_method_enums.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  UserService userService;
  FirestoreService firestoreService;
  TextEditingController usernameFieldController = TextEditingController();
  String? _userID;

  UserModel? _user;
  UserModel? get user => _user;

  double? _distancePreferenceDistance;
  double? get distancePreferenceDistance => _distancePreferenceDistance;

  bool? _distancePreferenceOnlyThisInterval;
  bool? get distancePreferenceOnlyThisInterval =>
      _distancePreferenceOnlyThisInterval;

  int? _showme;
  int? get showme => _showme;

  int? _minAge;
  int? _maxAge;
  bool? _agePreferenceOnlyThisInterval;

  int? get minAge => _minAge;
  int? get maxAge => _maxAge;
  bool? get agePreferenceOnlyThisInterval => _agePreferenceOnlyThisInterval;

  bool? _global;
  bool? get global => _global;

  int? _viewerPreference;
  int? get viewerPreference => _viewerPreference;

  int? _recommendationPreference;
  int? get recommendationPreference => _recommendationPreference;

  int? _language;
  int? get language => _language;

  bool? _hideMeOnVip;
  bool? get hideMeOnVip => _hideMeOnVip;
  bool? _hideMeOnMatcherStyle;
  bool? get hideMeOnMatcherStyle => _hideMeOnMatcherStyle;
  bool? _hideMeOnFreeStyle;
  bool? get hideMeOnFreeStyle => _hideMeOnFreeStyle;
  bool? _recommendMeOnTurbo;
  bool? get recommendMeOnTurbo => _recommendMeOnTurbo;

  bool? _closeReadingNotifications;
  bool? get closeReadingNotifications => _closeReadingNotifications;

  bool? _playVideosAutomatically;
  bool? get playVideosAutomatically => _playVideosAutomatically;

  bool? _hideOnlineStatus;
  bool? get hideOnlineStatus => _hideOnlineStatus;
  bool? _hideLastOnlineStatus;
  bool? get hideLastOnlineStatus => _hideLastOnlineStatus;

  String? _username;
  String? get username => _username;
  int _leftChar = 20;
  int get leftChar => _leftChar;
  int _maxChar = 20;
  int get maxChar => _maxChar;

  bool? _emailOnMatch;
  bool? get emailOnMatch => _emailOnMatch;
  bool? _emailOnMessage;
  bool? get emailOnMessage => _emailOnMessage;
  bool? _emailOnMarketing;
  bool? get emailOnMarketing => _emailOnMarketing;

  int? _instantNewLikes;
  int? get instantNewLikes => _instantNewLikes;
  bool? _instantOnCurvyLike;
  bool? get instantOnCurvyLike => _instantOnCurvyLike;
  bool? _instantOnMatch;
  bool? get instantOnMatch => _instantOnMatch;
  bool? _instantOnMessage;
  bool? get instantOnMessage => _instantOnMessage;
  bool? _instantOnMessageLike;
  bool? get instantOnMessageLike => _instantOnMessageLike;
  bool? _instantSound;
  bool? get instantSound => _instantSound;
  bool? _instantVibration;
  bool? get instantVibration => _instantVibration;

  bool? _curvyTeamPromotions;
  bool? get curvyTeamPromotions => _curvyTeamPromotions;

  bool? _privacyEnableMarketing;
  bool? get privacyEnableMarketing => _privacyEnableMarketing;
  bool? _privacyEnableAdvertising;
  bool? get privacyEnableAdvertising => _privacyEnableAdvertising;
  bool? _privacyCompulsoryPermissions;
  bool? get privacyCompulsoryPermissions => _privacyCompulsoryPermissions;

  bool? _appFlayer;
  bool? get appFlayer => _appFlayer;
  bool? _branch;
  bool? get branch => _branch;
  bool? _newMarketingPermissions;
  bool? get newMarketingPermissions => _newMarketingPermissions;

  bool? _curvyDirectAds;
  bool? get curvyDirectAds => _curvyDirectAds;
  bool? _googleAds;
  bool? get googleAds => _googleAds;
  bool? _curvyPromotions;
  bool? get curvyPromotions => _curvyPromotions;
  bool? _facebookAds;
  bool? get facebookAds => _facebookAds;
  bool? _newAdvertisingPermissions;
  bool? get newAdvertisingPermissions => _newAdvertisingPermissions;

  SettingsController(
      {required this.userService, required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();
    _userID = await Get.find<SharedPreferenceService>().getUserID();

    await setUser();
           
    setInitialSettings(
      _user!.settings!.distance_preference!.distance!,
      _user!.settings!.distance_preference!.only_this_interval!,
      _user!.show_me!,
      _user!.settings!.age_preference!.min_age!,
      _user!.settings!.age_preference!.max_age!,
      _user!.settings!.age_preference!.only_this_interval!,
      _user!.settings!.global!,
      _user!.settings!.viewer_preference!,
      _user!.settings!.recommendation_preference!,
      _user!.settings!.language!,
      _user!.settings!.visibility!.hide_me_on_vip!,
      _user!.settings!.visibility!.hide_me_on_matcherstyle!,
      _user!.settings!.visibility!.hide_me_on_freestyle!,
      _user!.settings!.visibility!.recommend_me_on_turbo!,
      _user!.settings!.close_reading_notifications!,
      _user!.settings!.play_videos_automatically!,
      _user!.settings!.hide_online_status!,
      _user!.settings!.hide_last_online_status!,
      _user!.username,
      _user!.settings!.email_notifications!.on_match!,
      _user!.settings!.email_notifications!.on_message!,
      _user!.settings!.email_notifications!.on_marketing!,
      _user!.settings!.instant_notifications!.new_likes!,
      _user!.settings!.instant_notifications!.on_curvy_like!,
      _user!.settings!.instant_notifications!.on_match!,
      _user!.settings!.instant_notifications!.on_message!,
      _user!.settings!.instant_notifications!.on_message_like!,
      _user!.settings!.instant_notifications!.sound!,
      _user!.settings!.instant_notifications!.vibration!,
      _user!.settings!.privacy_preferences!.enable_advertising!,
      _user!.settings!.privacy_preferences!.enable_marketing!,
      _user!.settings!.privacy_preferences!.marketing_permissions!.app_flayer!,
      _user!.settings!.privacy_preferences!.marketing_permissions!.branch!,
      _user!.settings!.privacy_preferences!.marketing_permissions!
          .new_marketing_permissions!,
      _user!.settings!.privacy_preferences!.advertising_permissions!
          .curvy_direct_ads!,
      _user!
          .settings!.privacy_preferences!.advertising_permissions!.google_ads!,
      _user!.settings!.privacy_preferences!.advertising_permissions!
          .curvy_promotions!,
      _user!.settings!.privacy_preferences!.advertising_permissions!
          .facebook_ads!,
      _user!.settings!.privacy_preferences!.advertising_permissions!
          .new_advertising_permissions!,
    );
  }

  Future<void> setUser() async {
    UserModel? userModel =
        await userService.getUser(_userID!);
    _user = userModel;
  }

  void setInitialSettings(
      double distancePreferenceDistance,
      bool distancePreferenceOnlyThisInterval,
      int showme,
      int minAge,
      int maxAge,
      bool agePreferenceOnlyThisInterval,
      bool global,
      int viewerPreference,
      int recommendationPreference,
      int language,
      bool hideMeOnVip,
      bool hideMeOnMatcherStyle,
      bool hideMeOnFreeStyle,
      bool recommendMeOnTurbo,
      bool closeReadingNotifications,
      bool playVideosAutomatically,
      bool hideOnlineStatus,
      bool hideLastOnlineStatus,
      String? username,
      bool emailOnMatch,
      bool emailOnMessage,
      bool emailOnMarketing,
      int instantNewLikes,
      bool instantOnCurvyLike,
      bool instantOnMatch,
      bool instantOnMessage,
      bool instantOnMessageLike,
      bool instantSound,
      bool instantVibration,
      bool privacyEnableAdvertising,
      bool privacyEnableMarketing,
      bool appFlayer,
      bool branch,
      bool newMarketingPermissions,
      bool curvyDirectAds,
      bool googleAds,
      bool curvyPromotions,
      bool facebookAds,
      bool newAdvertisingPermissions) {
    _distancePreferenceDistance = distancePreferenceDistance;
    _distancePreferenceOnlyThisInterval = distancePreferenceOnlyThisInterval;
    _showme = showme;
    _minAge = minAge;
    _maxAge = maxAge;
    _agePreferenceOnlyThisInterval = agePreferenceOnlyThisInterval;
    _global = global;
    _viewerPreference = viewerPreference;
    _recommendationPreference = recommendationPreference;
    _language = language;
    _hideMeOnVip = hideMeOnVip;
    _hideMeOnMatcherStyle = hideMeOnMatcherStyle;
    _hideMeOnFreeStyle = hideMeOnFreeStyle;
    _recommendMeOnTurbo = recommendMeOnTurbo;
    _closeReadingNotifications = closeReadingNotifications;
    _playVideosAutomatically = playVideosAutomatically;
    _hideOnlineStatus = hideOnlineStatus;
    _hideLastOnlineStatus = hideLastOnlineStatus;
    _emailOnMatch = emailOnMatch;
    _emailOnMessage = emailOnMessage;
    _emailOnMarketing = emailOnMarketing;
    _instantNewLikes = instantNewLikes;
    _instantOnCurvyLike = instantOnCurvyLike;
    _instantOnMatch = instantOnMatch;
    _instantOnMessage = instantOnMessage;
    _instantOnMessageLike = instantOnMessageLike;
    _instantSound = instantSound;
    _instantVibration = instantVibration;
    _privacyEnableAdvertising = privacyEnableAdvertising;
    _privacyEnableMarketing = privacyEnableMarketing;
    _appFlayer = appFlayer;
    _branch = branch;
    _newMarketingPermissions = newMarketingPermissions;
    _curvyDirectAds = curvyDirectAds;
    _googleAds = googleAds;
    _curvyPromotions = curvyPromotions;
    _facebookAds = facebookAds;
    _newAdvertisingPermissions = newAdvertisingPermissions;
   



    if (username != null) {
      usernameFieldController.text = username;
      _leftChar = _leftChar - username.length;
    }

    update();
  }

  void setDistance(double distance) {
    _distancePreferenceDistance = distance;
    update();
  }

  void setOnlyThisInterval(bool value) {
    _distancePreferenceOnlyThisInterval = value;
    update();
  }

  void setAgePreferenceRange(double min, double max) {
    
    if (max > min) {
      
      _minAge = min.toInt();
      _maxAge = max.toInt();
      update();
    }
  }

  void setAgePreferenceOnlyThisInterval(bool value) {
    _agePreferenceOnlyThisInterval = value;
    update();
  }

  void setGlobal(bool value) {
    _global = value;
    update();
  }

  void setViewerPreference(int value) {
    _viewerPreference = value;
    update();
  }

  void setRecommendationPreference(int value) {
    _recommendationPreference = value;
    update();
  }

  void setLanguage(int value) {
    _language = value;
    update();
  }

  void setHideMeOnVip(bool value) {
    _hideMeOnVip = value;
    update();
  }

  void setRecommendMeOnTurbo(bool value) {
    _recommendMeOnTurbo = value;
    update();
  }

  void setHideMeOnFreeStyle(bool value) {
    _hideMeOnFreeStyle = value;
    update();
  }

  void setHideMeOnMatcherStyle(bool value) {
    _hideMeOnMatcherStyle = value;
    update();
  }

  void setCloseReadingNotifications(bool value) {
    _closeReadingNotifications = value;
    update();
  }

  void setPlayVideosAutomatically(bool value) {
    _playVideosAutomatically = value;
    update();
  }

  void setHideOnlineStatus(bool value) {
    _hideOnlineStatus = value;
    update();
  }

  void setHideLastOnlineStatus(bool value) {
    _hideLastOnlineStatus = value;
    update();
  }

  void setUsername(String value) {
    _username = value;
    _leftChar = _maxChar - value.length;
    update();
  }

  void setEmailOnMatch(bool value) {
    _emailOnMatch = value;
    update();
  }

  void setEmailOnMessage(bool value) {
    _emailOnMessage = value;
    update();
  }

  void setEmailOnMarketing(bool value) {
    _emailOnMarketing = value;
    update();
  }

  void setInstantOnMatch(bool value) {
    _instantOnMatch = value;
    update();
  }

  void setInstantOnMessage(bool value) {
    _instantOnMessage = value;
    update();
  }

  void setInstantOnMessageLike(bool value) {
    _instantOnMessageLike = value;
    update();
  }

  void setInstantOnCurvyLike(bool value) {
    _instantOnCurvyLike = value;
    update();
  }

  void setInstantNewLikes(int value) {
    _instantNewLikes = value;
    update();
  }

  void setInstantVibration(bool value) {
    _instantVibration = value;
    update();
  }

  void setInstantSound(bool value) {
    _instantSound = value;
    update();
  }

  void setCurvyTeamPromotions(bool value) {
    _curvyTeamPromotions = value;
    update();
  }

  void setPrivacyEnableMarketing(bool value) {
    _privacyEnableMarketing = value;
    update();
  }

  void setPrivacyEnableAdvertising(bool value) {
    _privacyEnableAdvertising = value;
    update();
  }

  void setPrivacyCompulsoryPermissions(bool value) {
    _privacyCompulsoryPermissions = value;
    update();
  }

  void setAppFlayer(bool value) {
    _appFlayer = value;
    update();
  }

  void setBranch(bool value) {
    _branch = value;
    update();
  }

  void setNewMarketingPermissions(bool value) {
    _newMarketingPermissions = value;
    update();
  }

  void setCurvyDirectAds(bool value) {
    _curvyDirectAds = value;
    update();
  }

  void setGoogleAds(bool value) {
    _googleAds = value;
    update();
  }

  void setCurvyPromotions(bool value) {
    _curvyPromotions = value;
    update();
  }

  void setFacebookAds(bool value) {
    _facebookAds = value;
    update();
  }

  void setNewAdvertisingPermissions(bool value) {
    _newAdvertisingPermissions = value;
    update();
  }

  Future<void> updatePrivacyPreferences() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.privacy_preferences.enable_marketing'] =
        _privacyEnableMarketing;
    data['settings.privacy_preferences.compulsory_permissions'] =
        _privacyCompulsoryPermissions;
    data['settings.privacy_preferences.enable_advertising'] =
        _privacyEnableAdvertising;

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updatePrivacyPersonalizedMarketing() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.privacy_preferences.marketing_permissions.app_flayer'] =
        _appFlayer;
    data['settings.privacy_preferences.marketing_permissions.branch'] = _branch;
    data['settings.privacy_preferences.marketing_permissions.new_marketing_permissions'] =
        _newMarketingPermissions;

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updatePrivacyPersonalizedAdvertising() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.privacy_preferences.advertising_permissions.curvy_direct_ads'] =
        _curvyDirectAds;
    data['settings.privacy_preferences.advertising_permissions.google_ads'] =
        _googleAds;
    data['settings.privacy_preferences.advertising_permissions.curvy_promotions'] =
        _curvyPromotions;
    data['settings.privacy_preferences.advertising_permissions.facebook_ads'] =
        _facebookAds;
    data['settings.privacy_preferences.advertising_permissions.new_advertising_permissions'] =
        _newAdvertisingPermissions;

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updateEmailNotifications() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.email_notifications.on_match'] = _emailOnMatch;
    data['settings.email_notifications.on_marketing'] = _emailOnMarketing;
    data['settings.email_notifications.on_message'] = _emailOnMessage;

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updateInstantNotifications() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.instant_notifications.on_match'] = _instantOnMatch;
    data['settings.instant_notifications.on_curvy_like'] = _instantOnCurvyLike;
    data['settings.instant_notifications.on_message'] = _instantOnMessage;
    data['settings.instant_notifications.on_message_like'] = _instantOnMessageLike;
    data['settings.instant_notifications.sound'] = _instantSound;
    data['settings.instant_notifications.vibration'] = _instantVibration;
    data['settings.instant_notifications.new_likes'] = _instantNewLikes;
    

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updateUsername() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['username'] = _username;  

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  Future<void> updateLanguage() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['settings.language'] = _language;  

    await firestoreService.updateUser(data, _userID!);
    Get.back();
  
  }

  Future<void> updateFieldsOnSettingsPage() async {
    Map<String, dynamic> data = Map<String, dynamic>();

    //DISTANCE PREFERENCE
    data['settings.distance_preference.distance'] = _distancePreferenceDistance;
    data['settings.distance_preference.only_this_interval'] = _distancePreferenceOnlyThisInterval;


    //AGE PREFERENCE
    data['settings.age_preference.min_age'] = _minAge;
    data['settings.age_preference.max_age'] = _maxAge;
    data['settings.age_preference.only_this_interval'] = _agePreferenceOnlyThisInterval;

    data['settings.global'] = _global;

    data['settings.recommendation_preference'] = _recommendationPreference;
    data['settings.viewer_preference'] =  _viewerPreference;

    //VISIBILITY
    data['settings.visibility.hide_me_on_vip'] = _hideMeOnVip;
    data['settings.visibility.hide_me_on_matcherstyle'] = _hideMeOnMatcherStyle;
    data['settings.visibility.hide_me_on_freestyle'] = _hideMeOnFreeStyle;
    data['settings.visibility.recommend_me_on_turbo'] = _recommendMeOnTurbo;


    data['settings.close_reading_notifications'] = _closeReadingNotifications;

    data['settings.play_videos_automatically'] = _playVideosAutomatically;

    data['settings.hide_online_status'] = _hideOnlineStatus;
    data['settings.hide_last_online_status'] = _hideLastOnlineStatus;

    data['settings.privacy_preferences.curvy_team_promotions'] = _curvyTeamPromotions;


    await firestoreService.updateUser(data, _userID!);
    Get.back();
  }

  void logout() async {
    
    await Get.find<SharedPreferenceService>().deleteUser();
    Get.offAllNamed(Routes.login);
  }
}
