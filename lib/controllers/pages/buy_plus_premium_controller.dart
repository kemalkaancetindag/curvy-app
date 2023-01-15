import 'package:curvy_app/ui/widgets/buy_plus_premium_package.dart';
import 'package:curvy_app/ui/widgets/buy_premium_plus_info_page.dart';
import 'package:flutter/cupertino.dart';
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


  void setCurrentPage(int currentPage) {
    _currentPage = currentPage;
    update();
  }

  void setIsPlus(bool state) {
    isPlus = state;
    update();
  }



}