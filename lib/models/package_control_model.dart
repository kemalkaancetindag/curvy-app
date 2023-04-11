import 'package:curvy_app/enums/package_type_enum.dart';

class PackageControlModel {
  int? package_type;
  int? allowed_swipe_count;
  int? last_update_date;
  int? swipes_left_to_ad;
  int? daily_back_count;
  int? last_package_renewal_date;

  PackageControlModel({
    this.package_type,
    this.allowed_swipe_count,
    this.last_update_date,
    this.swipes_left_to_ad,
    this.daily_back_count,
    this.last_package_renewal_date

  });


  
  PackageControlModel.fromJson(Map<String,dynamic> json){
    package_type = json['package_type'] == null ? PackageType.standart.value : json['package_type'];
    allowed_swipe_count = json['allowed_swipe_count'] == null ? 50 : json['allowed_swipe_count'];
    last_update_date = json['last_update_date'];
    swipes_left_to_ad = json['swipes_left_to_ad'] == null ? 14 : json['swipes_left_to_ad'];
    daily_back_count = json['daily_back_count'] == null ? 1 : json['daily_back_count'];
    last_package_renewal_date = json['last_package_renewal_date'] == null ? DateTime.now().millisecondsSinceEpoch : json['last_package_renewal_date'];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = Map<String,dynamic>();
    data['package_type'] = package_type == null ? PackageType.standart.value : package_type;
    data['allowed_swipe_count'] = allowed_swipe_count == null ? 50 : allowed_swipe_count;
    data['last_update_date'] = last_update_date;
    data['swipes_left_to_ad'] = swipes_left_to_ad == null ? 14 : swipes_left_to_ad;
    data['daily_back_count'] = daily_back_count == null ? 1 : daily_back_count;
    data['last_package_renewal_date'] = last_package_renewal_date == null ? DateTime.now().millisecond : last_package_renewal_date;
    return data;
  }

}