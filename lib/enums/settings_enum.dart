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
  closeCurvyTeamPromotions("privacy_preferences.curvy_team_promotions");
  
  
  
  

  const Settings(this.value);
  final dynamic value;
}