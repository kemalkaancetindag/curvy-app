class UserModel {
  String? userID;
  int? login_method;
  String? phone_number;
  String? email;
  String? name;
  String? birthdate;
  int? sex;
  bool? show_sex;
  int? show_me;
  String? username;
  List<String>? images;
  String? about;
  List<int>? interests;
  int? zodiac;
  int? person_type;
  int? pet_preference;
  int? smoke_preference;
  int? alchol_preference;
  String? job;
  String? graduation;
  String? city;
  List<int>? sexual_preference;
  bool? show_sexual_preference;
  bool? show_age;
  bool? show_distance;
  int? curvy_chip;
  int? curvy_turbo;
  int? curvy_like;
  bool? plus_member;
  bool? platinum_member;
  bool? email_confirmation;
  bool? phone_confirmation;
  bool? is_paused;
  _Chat? chat;
  List<String>? likes;
  List<String>? likeds;
  _Settings? settings;

  UserModel(
      {this.userID,
      this.login_method,
      this.phone_number,
      this.email,
      this.name,
      this.birthdate,
      this.sex,
      this.show_sex,
      this.show_me,
      this.username,
      this.images,
      this.about,
      this.interests,
      this.zodiac,
      this.person_type,
      this.pet_preference,
      this.smoke_preference,
      this.alchol_preference,
      this.job,
      this.graduation,
      this.city,
      this.sexual_preference,
      this.show_sexual_preference,
      this.show_age,
      this.show_distance,
      this.curvy_chip,
      this.curvy_turbo,
      this.curvy_like,
      this.plus_member,
      this.platinum_member,
      this.email_confirmation,
      this.phone_confirmation,
      this.is_paused,
      this.chat,
      this.likes,
      this.likeds,
      this.settings});

  fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    login_method = json['login_method'];
    phone_number = json['phone_number'];
    email = json['email'];
    name = json['name'];
    birthdate = json['birthdate'];
    sex = json['sex'];
    show_sex = json['show_sex'];
    show_me = json['show_me'];
    username = json['username'];
    images = json['images'];
    about = json['about'];
    interests = json['interests'];
    zodiac = json['zodiac'];
    person_type = json['person_type'];
    pet_preference = json['pet_preference'];
    smoke_preference = json['smoke_preference'];
    alchol_preference = json['alchol_preference'];
    job = json['job'];
    graduation = json['graduation'];
    city = json['city'];
    sexual_preference = json['sexual_preference'];
    show_sexual_preference = json['show_sexual_preference'];
    show_age = json['show_age'];
    show_distance = json['show_distance'];
    curvy_chip = json['curvy_chip'];
    curvy_turbo = json['curvy_turbo'];
    curvy_like = json['curvy_like'];
    plus_member = json['plus_member'];
    platinum_member = json['platinum_member'];
    email_confirmation = json['email_confirmation'];
    phone_confirmation = json['phone_confirmation'];
    is_paused = json['is_paused'];
    chat = _Chat().fromJson(json['chat']);
    likes = json['likes'];
    likeds = json['likeds'];
    settings = _Settings().fromJson(json['settings']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = userID;
    data['login_method'] = login_method;
    data['phone_number'] = phone_number;
    data['email'] = email;
    data['name'] = name;
    data['birthdate'] = birthdate;
    data['sex'] = sex;
    data['show_sex'] = show_sex;
    data['show_me'] = show_me;
    data['username'] = username;
    data['images'] = images;
    data['about'] = about;
    data['interests'] = interests;
    data['zodiac'] = zodiac;
    data['person_type'] = person_type;
    data['pet_preference'] = pet_preference;
    data['smoke_preference'] = smoke_preference;
    data['alchol_preference'] = alchol_preference;
    data['job'] = job;
    data['graduation'] = graduation;
    data['city'] = city;
    data['sexual_preference'] = sexual_preference;
    data['show_sexual_preference'] = show_sexual_preference;
    data['show_age'] = show_age ?? true;
    data['show_distance'] = show_distance ?? true;
    data['curvy_chip'] = curvy_chip ?? 0;
    data['curvy_turbo'] = curvy_turbo ?? 0;
    data['curvy_like'] = curvy_like ?? 0;
    data['plus_member'] = plus_member ?? false;
    data['platinum_member'] = platinum_member ?? false;
    data['email_confirmation'] = email_confirmation ?? false;
    data['phone_confirmation'] = phone_confirmation ?? false;
    data['is_paused'] = is_paused ?? false;
    data['chat'] = chat ?? _Chat().toJson();
    data['likes'] = likes ?? [];
    data['likeds'] = likeds ?? [];
    data['settings'] = settings ?? _Settings().toJson();
    return data;
  }
}

class _Chat {
  List<String>? active_chats = [];
  List<String>? trash_chats = [];

  _Chat({this.active_chats, this.trash_chats});

  fromJson(Map<String, dynamic> json) {
    active_chats = json['active_chats'];
    trash_chats = json['trash_chats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_chats'] = active_chats ?? [];
    data['trash_chats'] = trash_chats ?? [];
    return data;
  }
}

class _Settings {
  List<String>? connected_accounts;
  __Location? location;
  __DistancePreference? distance_preference;
  bool? global;
  int? recommendation_preference;
  int? viewer_preference;
  int? language;
  __Visibility? visibility;
  bool? close_reading_notifications;
  bool? play_videos_automatically;
  bool? hide_online_status;
  bool? hide_last_online_status;
  __EmailNotifications? email_notifications;
  __InstantNotifications? instant_notifications;
  __PrivacyPreferences? privacy_preferences;

  _Settings(
      {this.connected_accounts,
      this.location,
      this.distance_preference,
      this.global,
      this.recommendation_preference,
      this.viewer_preference,
      this.language,
      this.visibility,
      this.close_reading_notifications,
      this.play_videos_automatically,
      this.hide_last_online_status,
      this.email_notifications,
      this.instant_notifications,
      this.privacy_preferences,
      this.hide_online_status});

  fromJson(Map<String, dynamic> json) {
    connected_accounts = json['connected_accounts'];
    location = __Location().fromJson(json['location']);
    distance_preference =
        __DistancePreference().fromJson(json['distance_preference']);
    global = json['global'];
    recommendation_preference = json['recommendation_preference'];
    viewer_preference = json['viewer_preference'];
    language = json['language'];
    visibility = __Visibility().fromJson(json['visibility']);
    close_reading_notifications = json['close_reading_notifications'];
    play_videos_automatically = json['play_videos_automatically'];
    hide_last_online_status = json['hide_last_online_status'];
    email_notifications =
        __EmailNotifications().fromJson(json['email_notifications']);
    instant_notifications =
        __InstantNotifications().fromJson(json['instant_notifications']);
    privacy_preferences =
        __PrivacyPreferences().fromJson(json['privacy_preferences']);
    hide_online_status = json['hide_online_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['connected_accounts'] = connected_accounts ?? [];
    data['location'] = location ?? __Location().toJson();
    data['distance_preference'] = distance_preference ?? __DistancePreference().toJson();
    data['global'] = global ?? true;
    data['recommendation_preference'] = recommendation_preference ?? 0;
    data['viewer_preference'] = viewer_preference ?? 0;
    data['language'] = language ?? 0;
    data['visibility'] = visibility ?? __Visibility().toJson();
    data['close_reading_notifications'] = close_reading_notifications ?? false;
    data['play_videos_automatically'] = play_videos_automatically ?? true;
    data['hide_last_online_status'] = hide_last_online_status ?? false;
    data['email_notifications'] = email_notifications ?? __EmailNotifications().toJson();
    data['instant_notifications'] = instant_notifications ?? __InstantNotifications().toJson();
    data['privacy_preferences'] = privacy_preferences ?? __PrivacyPreferences().toJson();
    data['hide_online_status'] = hide_online_status ?? false;

    return data;
  }
}

class __Location {
  __Location();

  fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

class __DistancePreference {
  double? distance;
  bool? only_this_interval;

  __DistancePreference({this.distance, this.only_this_interval});

  fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    only_this_interval = json['only_this_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = distance ?? 15.0;
    data['only_this_interval'] = only_this_interval ?? false;

    return data;
  }
}

class __Visibility {
  bool? hide_me_on_vip;
  bool? recommend_me_on_turbo;
  bool? hide_me_on_freestyle;
  bool? hide_me_on_matcherstyle;

  __Visibility(
      {this.hide_me_on_freestyle,
      this.recommend_me_on_turbo,
      this.hide_me_on_matcherstyle,
      this.hide_me_on_vip});

  fromJson(Map<String, dynamic> json) {
    hide_me_on_vip = json['hide_me_on_vip'];
    recommend_me_on_turbo = json['recommend_me_on_turbo'];
    hide_me_on_freestyle = json['hide_me_on_freestyle'];
    hide_me_on_matcherstyle = json['hide_me_on_matcherstyle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hide_me_on_vip'] = hide_me_on_vip ?? false;
    data['recommend_me_on_turbo'] = recommend_me_on_turbo ?? true;
    data['hide_me_on_freestyle'] = hide_me_on_freestyle ?? false;
    data['hide_me_on_matcherstyle'] = hide_me_on_matcherstyle ?? false;
    return data;
  }
}

class __EmailNotifications {
  bool? on_match;
  bool? on_message;
  bool? on_marketing;

  __EmailNotifications({this.on_match, this.on_message, this.on_marketing});

  fromJson(Map<String, dynamic> json) {
    on_match = json['on_match'];
    on_message = json['on_message'];
    on_marketing = json['on_marketing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['on_match'] = on_match ?? true;
    data['on_message'] = on_message ?? true;
    data['on_marketing'] = on_marketing ?? true;

    return data;
  }
}

class __InstantNotifications {
  bool? on_match;
  bool? on_message;
  bool? on_message_like;
  bool? on_curvy_like;
  int? new_likes;
  bool? vibration;
  bool? sound;

  __InstantNotifications(
      {this.on_match,
      this.on_message,
      this.on_message_like,
      this.on_curvy_like,
      this.new_likes,
      this.vibration,
      this.sound});

  fromJson(Map<String, dynamic> json) {
    on_match = json['on_match'];
    on_message = json['on_message'];
    on_message_like = json['on_message_like'];
    on_curvy_like = json['on_curvy_like'];
    new_likes = json['new_likes'];
    vibration = json['vibration'];
    sound = json['sound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['on_match'] = on_match ?? true;
    data['on_message'] = on_message ?? true;
    data['on_message_like'] = on_message_like ?? true;
    data['on_curvy_like'] = on_curvy_like ?? true;
    data['new_likes'] = new_likes ?? 1;
    data['vibration'] = vibration ?? true;
    data['sound'] = sound ?? true;

    return data;
  }
}

class __PrivacyPreferences {
  bool? compulsory_permissions;
  bool? curvy_team_promotions;
  ____MarketingPermissions? marketing_permissons;
  ____SocialMediaPermissions? social_media_permissions;
  ____AdvertisingPermissions? advertising_permissions;

  __PrivacyPreferences(
      {this.compulsory_permissions,
      this.curvy_team_promotions,
      this.marketing_permissons,
      this.social_media_permissions,
      this.advertising_permissions});

  fromJson(Map<String, dynamic> json) {
    compulsory_permissions = json['compulsory_permissions'];
    curvy_team_promotions = json['curvy_team_promotions'];
    marketing_permissons =
        ____MarketingPermissions().fromJson(json['marketing_permissons']);
    social_media_permissions =
        ____SocialMediaPermissions().fromJson(json['social_media_permissions']);
    advertising_permissions =
        ____AdvertisingPermissions().fromJson(json['advertising_permissions']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compulsory_permissions'] = compulsory_permissions ?? true;
    data['curvy_team_promotions'] = curvy_team_promotions ?? true;
    data['marketing_permissons'] = marketing_permissons ?? ____MarketingPermissions().toJson();
    data['social_media_permissions'] = social_media_permissions ?? ____SocialMediaPermissions().toJson();
    data['advertising_permissions'] = advertising_permissions ?? ____AdvertisingPermissions().toJson();

    return data;
  }
}

class ____MarketingPermissions {
  bool? app_flayer;
  bool? branch;
  bool? new_marketing_permissions;

  ____MarketingPermissions(
      {this.app_flayer, this.branch, this.new_marketing_permissions});

  fromJson(Map<String, dynamic> json) {
    app_flayer = json['app_flayer'];
    branch = json['branch'];
    new_marketing_permissions = json['new_marketing_permissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_flayer'] = app_flayer ?? true;
    data['branch'] = branch ?? true;
    data['new_marketing_permissions'] = new_marketing_permissions ?? true;

    return data;
  }
}

class ____SocialMediaPermissions {
  fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}

class ____AdvertisingPermissions {
  bool? curvy_direct_ads;
  bool? google_ads;
  bool? curvy_promotions;
  bool? facebook_ads;
  bool? new_advertising_permissions;

  ____AdvertisingPermissions(
      {this.curvy_direct_ads,
      this.google_ads,
      this.curvy_promotions,
      this.facebook_ads,
      this.new_advertising_permissions});

  fromJson(Map<String, dynamic> json) {
    curvy_direct_ads = json['curvy_direct_ads'];
    google_ads = json['google_ads'];
    curvy_promotions = json['curvy_promotions'];
    facebook_ads = json['facebook_ads'];
    new_advertising_permissions = json['new_advertising_permissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curvy_direct_ads'] = curvy_direct_ads ?? true;
    data['google_ads'] = google_ads ?? true;
    data['curvy_promotions'] = curvy_promotions ?? true;
    data['facebook_ads'] = facebook_ads ?? true;
    data['new_advertising_permissions'] = new_advertising_permissions ?? true;

    return data;
  }
}
