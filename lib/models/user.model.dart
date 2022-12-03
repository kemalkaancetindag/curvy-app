class User {
  String birthdate;
  String email;
  List<String> images;
  List<int> interests;
  bool mail_confirmed;
  String name;
  String phone;
  int sex;
  List<int> sex_preference;
  int show_me;
  bool show_sex;
  bool show_sex_preference;

  User({
    required this.birthdate,
    required this.email,
    required this.images,
    required this.interests,
    required this.mail_confirmed,
    required this.name,
    required this.phone,
    required this.sex,
    required this.sex_preference,
    required this.show_me,
    required this.show_sex,
    required this.show_sex_preference

  });

  
  fromJson(Map<String, dynamic> json){
    birthdate = json["birthdate"];
    email = json["email"];
    images = json["images"];
    interests = json["interests"];
    mail_confirmed = json["mail_confirmed"];
    name = json["name"];
    phone = json["phone"];
    sex = json["sex"];
    sex_preference = json["sex_preference"];
    show_me = json["show_me"];
    show_sex = json["show_sex"];
    show_sex_preference = json["show_sex_preference"];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic>  data = new Map<String, dynamic>();
    data["birthdate"] = this.birthdate;
    data["email"] = this.email;
    data["images"] = this.images;
    data["interests"] = this.interests;
    data["mail_confirmed"] = this.mail_confirmed;
    data["name"] = this.name;
    data["phone"] = this.phone;
    data["sex"] = this.sex;
    data["sex_preference"] = this.sex_preference;
    data["show_me"] = this.show_me;
    data["show_sex"] = this.show_sex;
    data["show_sex_preference"] = this.show_sex_preference;

    return data;
  }




}