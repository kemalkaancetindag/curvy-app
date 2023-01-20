enum Settings {
  distancePreferenceDistance("distance_preference.distance"),
  distancePreferenceOnlyThisInterval("distance_preference.only_this_interval"),
  agePreferenceMinAge("age_preference.min_age"),
  agePreferenceOnlyThisInterval("age_preference.only_this_interval"),
  global("global"),
  agePreferenceMaxAge("age_preference.max_age"),
  recommendationPreference("recommendation_preference"),
  viewerPreference("viewer_preference"),
  language("language"),
  visibilityHideMeOnVIP("visibility.hide_me_on_vip"),
  visibilityRecommendMeOnTurbo("visibility.recommend_me_on_turbo"),
  visibilityHideMeOnFreestyle("visibility.hide_me_on_freestyle"),
  visibilityHideMeOnMatcherstyle("visibility.hide_me_on_matcherstyle"),
  closeReadingNotifications("close_reading_notifications"),
  playVideosAutomatically("play_videos_automatically"),
  hideOnlineStatus("hide_online_status"),
  hideLastOnlineStatus("hide_last_online_status"),
  closeCurvyTeamPromotions("privacy_preferences.curvy_team_promotions"),
  emailNotificationOnMatch("email_notifications.on_match"),
  emailNotificationOnMessage("email_notifications.on_message"),
  emailNotificationOnMarketing("email_notifications.on_marketing"),
  instantNotificationsNewLikes("instant_notifications.new_likes"),
  instantNotificationsOnCurvyLike("instant_notifications.on_curvy_like"),
  instantNotificationsOnMatch("instant_notifications.on_match"),
  instantNotificationsOnMessage("instant_notifications.on_message"),
  instantNotificationsOnMessageLike("instant_notifications.on_message_like"),
  instantNotificationsSound("instant_notifications.sound"),
  instantNotificationsVibration("instant_notifications.vibration"),
  privacyPreferencesEnableMarketing("privacy_preferences.enable_marketing"),
  privacyPreferencesEnableAdvertising("privacy_preferences.enable_advertising"),
  privacyPreferencesCompulsoryPermissions("privacy_preferences.compulsory_permissions"),
  privacyPreferencesMarketingAppFlayer("privacy_preferences.marketing_permissions.app_flayer"),
  privacyPreferencesMarketingBranch("privacy_preferences.marketing_permissions.branch"),
  privacyPreferencesMarketingNewMarketingPermissions("privacy_preferences.marketing_permissions.new_marketing_permissions"),
  privacyPreferencesAdvertisingCurvyDirectAds("privacy_preferences.advertising_permissions.curvy_direct_ads"),
  privacyPreferencesAdvertisingCurvyPromotions("privacy_preferences.advertising_permissions.curvy_promotions"),
  privacyPreferencesAdvertisingFacebookAds("privacy_preferences.advertising_permissions.facebook_ads"),
  privacyPreferencesAdvertisingGoogleAds("privacy_preferences.advertising_permissions.google_ads"),
  privacyPreferencesAdvertisingNewAdvertisingPermissions("privacy_preferences.advertising_permissions.new_advertising_permissions");
  
  
  
  

  const Settings(this.value);
  final dynamic value;
}