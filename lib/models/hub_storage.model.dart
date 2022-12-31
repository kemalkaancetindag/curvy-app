class HubStorageModel {
  String? hub_title;
  String? hub_text;
  String? hub_image;
  String? hub_action_text;
  int? hub_type;

  HubStorageModel({
    this.hub_title,
    this.hub_text,
    this.hub_image,
    this.hub_type,
    this.hub_action_text
  });


  HubStorageModel.fromJson(Map<String,dynamic> json){
    hub_title = json['hub_title'];
    hub_text = json['hub_text'];
    hub_image = json['hub_image'];
    hub_type = json['hub_type'];
    hub_action_text = json['hub_action_text'];
  }


  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    data['hub_title'] = hub_title;
    data['hub_text'] = hub_text;
    data['hub_image'] = hub_image;
    data['hub_type'] = hub_type;
    data['hub_action_text'] = hub_action_text;
    return data;
    
  }
    
    
}

