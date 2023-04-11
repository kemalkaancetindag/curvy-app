import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/enums/package_type_enum.dart';
import 'package:curvy_app/models/package_control_model.dart';
import 'package:curvy_app/ui/widgets/buy_plus_premium_package.dart';
import 'package:curvy_app/ui/widgets/buy_premium_plus_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPlusPremiumController extends GetxController {
  bool? isPlus;


  int? _currentPage = 1;
  int? get currentPage => _currentPage;


  List<Widget> plusWidgets =  [
                  BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_0_plus.png",
                    title: "Sınırsız Beğeni Hakkı",
                    text: "İstediğin kadar kişiyi beğen",
                    isWithImage: true,
                    isPlus: true,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "",
                    title: "Yaşını ve Mesafeni Düzenle",
                    text: "İstediğinde aç istediğinde kapat",
                    isWithImage: false,
                    isPlus: true,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_2_plus.png",
                    title: "Kimlerin Görebileceğini Seç",
                    text: "Yakalanmaktan korkma ;)",
                    isWithImage: true,
                    isPlus: true,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_3_plus.png",
                    title: "Sınırsız geri alma hakkı",
                    text: "İyi bak belkide beğenmişsindir.",
                    isWithImage: true,
                    isPlus: true,
                  ),
                     BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_4_plus.png",
                    title: "Reklamları Görme",
                    text: "özgürce yeni arkadaşlar edin !",
                    isWithImage: true,
                    isPlus: true,
                  )
                ];

  
  List<Widget> platiniumWidgets =  [
                  BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_0_plat.png",
                    title: "Ayda 1 ücretsiz CurvyTurbo",
                    text: "Turbolayarak 10x gösterim al ve eşleş",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_1_plat.png",
                    title: "Her hafta 5 CurvyLike Kaza",
                    text: "CurvyLike ile beğeninin altını çiz!",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_2_plat.png",
                    title: "Mesafe sınırlarına takılma",
                    text: "Mesafelere takılmadan eşleş",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_3_plat.png",
                    title: "Seni Kimlerin Gördüğünü Gör",
                    text: "Profiline kimler bakmış haberdar ol",
                    isWithImage: true,
                    isPlus: false,
                  ),
                     BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_4_plat.png",
                    title: "Her hafta 1 VIP görüşme",
                    text: "Her hafta 1 VIP görüşme hakkı kazan",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_0_plus.png",
                    title: "Sınırsız Beğeni Hakkı",
                    text: "İstediğin kadar kişiyi beğen",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "",
                    title: "Yaşını ve Mesafeni Düzenle",
                    text: "İstediğinde aç istediğinde kapat",
                    isWithImage: false,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_2_plus.png",
                    title: "Kimlerin Görebileceğini Seç",
                    text: "Yakalanmaktan korkma ;)",
                    isWithImage: true,
                    isPlus: false,
                  ),
                   BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_3_plus.png",
                    title: "Sınırsız geri alma hakkı",
                    text: "İyi bak belkide beğenmişsindir.",
                    isWithImage: true,
                    isPlus: false,
                  ),
                     BuyPremiumPlusInfoPage(
                    image: "assets/images/bpp_4_plus.png",
                    title: "Reklamları Görme",
                    text: "özgürce yeni arkadaşlar edin !",
                    isWithImage: true,
                    isPlus: false,
                  )
                ];


  

  

  BuyPlusPremiumController({
    required this.isPlus
  });


  List<PackageInfo> plusPackages = [
    PackageInfo(subscription_time: 12, price: 269.99),
    PackageInfo(subscription_time: 6, price: 199.99),
    PackageInfo(subscription_time: 1, price: 66.99)
  ];


  List<PackageInfo> platiniumPackages = [
    PackageInfo(subscription_time: 12, price: 649.99),
    PackageInfo(subscription_time: 6, price: 469.99),
    PackageInfo(subscription_time: 1, price: 134.99)
  ];


  void setCurrentPage(int currentPage) {
    _currentPage = currentPage;
    update();
  }

  void setIsPlus(bool state) {
    isPlus = state;
    update();
  }


  Future<void> buyPackage() async {

    String userID = Get.find<SharedPreferenceService>().getUserID()!;

    PackageInfo package;
    if(isPlus!) {
      package = plusPackages[_currentPage!];
    } else {
      package = platiniumPackages[_currentPage!];      
    }
    Map<String,dynamic> updateData = Map<String,dynamic>();
    int startDate = DateTime.now().millisecondsSinceEpoch;
    int endDate = DateTime.fromMillisecondsSinceEpoch(startDate).add(Duration(days: package.subscription_time * 30)).toUtc().millisecondsSinceEpoch;
    var data = PackageControlModel(
      package_type: isPlus! ? PackageType.plus.value :  PackageType.platinium.value,
      package_start_date: startDate,
      package_end_date: endDate,
      swipes_left_to_ad: 14,
      allowed_swipe_count: 50,
      daily_back_count: 1,
      last_update_date: startDate
    ).toJson();


    updateData['package_control'] = data;

    await Get.find<FirestoreService>().updateUser(updateData, userID);

    Get.snackbar("Tebrikler!","Paketiniz ${isPlus! ? "CurvyPLUS " : "CurvyPLATINIUM "} olarak güncelenmiştir!", backgroundColor: Color(0xFFD51CFF), colorText: Colors.white);



  }



}


class PackageInfo {
  int subscription_time;
  double price;

  PackageInfo({
    required this.subscription_time,
    required this.price
  });

}