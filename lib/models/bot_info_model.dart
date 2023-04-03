class BotInfoModel {
  int? distance;
  String? id;
  double? users_last_latitude;
  double? users_last_longitude;

  BotInfoModel({
    this.distance,
    this.id,
    this.users_last_latitude,
    this.users_last_longitude
  });

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['distance'] = distance;
    data['id'] = id;
    data['users_last_longitude'] = users_last_longitude;
    data['users_last_latitude'] = users_last_latitude;
    return data;
  }

  BotInfoModel.fromJson(Map<String,dynamic> json) {
    distance = json['distance'];
    id = json['id'];
    users_last_longitude = json['users_last_longitude'];
    users_last_latitude = json['users_last_latitude'];
  }

  
}