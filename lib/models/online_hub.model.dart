class OnlineHub {
  List<dynamic>? users;
  OnlineHubLocation? hub_location;  
  int? hub_type;
  String? hub_id;
  Map<String,dynamic>? each_users_users; 

  OnlineHub({
    this.users,
    this.hub_location,    
    this.hub_type,
    this.hub_id,
    this.each_users_users
  });


  OnlineHub.fromJson(Map<String,dynamic> json) {
    users = json['users'];
    hub_location = OnlineHubLocation.fromJson(json['hub_location']);    
    hub_type = json['hub_type'];
    hub_id = json['hub_id'];
    each_users_users = json['each_users_users'];
  }


  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['users'] = users;
    data['hub_location'] = hub_location!.toJson();  
    data['hub_type'] = hub_type;
    data['hub_id'] = hub_id;
    data['each_users_users'] = each_users_users;
    return data;
  }
  
}


class OnlineHubLocation {
  dynamic latitude;
  dynamic longitude;

  OnlineHubLocation({
    this.latitude,
    this.longitude
  });



  OnlineHubLocation.fromJson(Map<String,dynamic> json){
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }



}