class VipProfiles {
  String? userID;
  int? time_selected;
  int? like_count;


  VipProfiles({
    this.userID,
    this.time_selected,
    this.like_count
  });

  VipProfiles.fromJson(Map<String,dynamic> json) {
    userID = json['userID'];
    time_selected = json['time_selected'];    
    like_count = json['like_count'];
  }


  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['userID'] = userID;
    data['time_selected'] = time_selected;
    data['like_count'] = like_count;
    return data;
  }



}