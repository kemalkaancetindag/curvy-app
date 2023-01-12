class Interest {
  int? interest_type;
  String? selected_image;
  String? un_selected_image;
  String? text;

  Interest({
    this.interest_type,
    this.selected_image,
    this.un_selected_image,
    this.text
  });

  Interest.fromJson(Map<String,dynamic> json){
    interest_type = json['interest_type'];
    selected_image = json['selected_image'];
    un_selected_image = json['un_selected_image'];
    text = json['text'];
  }
}