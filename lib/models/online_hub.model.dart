class OnlineHub {
  List<dynamic>? users;
  OnlineHubLocation? hub_location;
  String? starter_user;

  OnlineHub({
    this.users,
    this.hub_location,
    this.starter_user
  });


  OnlineHub.fromJson(Map<String,dynamic> json) {
    users = json['users'];
    hub_location = OnlineHubLocation.fromJson(json['hub_location']);
    starter_user = json['starter_user'];    
  }


  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['users'] = users;
    data['hub_location'] = hub_location!.toJson();
    data['starter_user'] = starter_user;
    return data;
  }
  
}


class OnlineHubLocation {
  double? latitude;
  double? longitude;

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