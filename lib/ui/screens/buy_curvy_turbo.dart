import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/buy_curvy_turbo_controller.dart';
import 'package:curvy_app/ui/widgets/buy_boost_package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BuyCurvyTurboScreen extends StatelessWidget {
  const BuyCurvyTurboScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top:Dimensions.h45),
                width: Dimensions.w35*10,
                height: Dimensions.h100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.h100/5),
                    topRight: Radius.circular(Dimensions.h100/5),
                    bottomLeft: Radius.circular(Dimensions.h100/2),
                    bottomRight: Radius.circular(Dimensions.h100/2)
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF0000),
                      Color(0xFF0047FF)
                    ] 
                )
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child:  Container(
                      margin: EdgeInsets.only(top: Dimensions.h12, left: Dimensions.w11, right: Dimensions.w50),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset("assets/images/chevron_left_white.png"),
                          )
                        ],
                    ),
                    ),
                    ),
                   
                    Expanded(
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                         Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: Dimensions.w2*10),
                              child: Image.asset("assets/images/turbo_buy_icon.png"),
                            ),
                            Container(
                              child: Text(
                                "CurvyTURBO",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h230/10,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                         )
                        ],
                    ),
                    )
                
                  ],
                ),
                
              )
            ],
          ),
        ),
        preferredSize: Size(double.maxFinite, Dimensions.h120),
      ),
      body: GetBuilder<BuyCurvyTurboCotroller>(
        builder: (controller) {
          return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: Dimensions.h27*12,
              width: Get.width,
              child: controller.passiveImage != null && controller.activeImage != null ? PageView(            
              onPageChanged: (value) {
                  controller.setCurrentPage(value.toInt());
              },  
            controller: PageController(viewportFraction: 0.5, initialPage: 1),
            children: [
              BuyBoostPackageCard(
                pageIndex: 0,
                currentPage: controller.currentPage,
                title: "EN İYİ FİYAT", 
                mainImage:controller.currentPage == 0 ? "assets/images/curvy_turbo_bestdeal.png" : "assets/images/curvy_turbo_bestdeal_deactive.png", 
                amount: 9, 
                packageName: "CurvyTURBO",                                 
                cost: "19,99", 
                withBorder: true,
                 borderWithImageGradient: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ],
                borderGradient: LinearGradient(colors: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ]),
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!,
              ),
               BuyBoostPackageCard(
                pageIndex: 1,
                currentPage: controller.currentPage,
                title: "EN POPÜLER", 
                mainImage: controller.currentPage == 1 ? "assets/images/curvy_turbo_popular.png" : "assets/images/curvy_turbo_popular_deactive.png", 
                amount: 3, 
                packageName: "CurvyTURBO",                                 
                cost: "49,99", 
                withBorder: true,
                
                borderGradient: LinearGradient(colors: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ]),
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!,
                borderWithImageGradient: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ],
              ),
               BuyBoostPackageCard(
                pageIndex: 2,
                currentPage: controller.currentPage,
                title: "STANDART", 
                mainImage: controller.currentPage == 2 ? "assets/images/curvy_turbo_standart.png" : "assets/images/curvy_turbo_standart_deactive.png", 
                amount: 1, 
                packageName: "CurvyTURBO",                                 
                cost: "19,99", 
                withBorder: true,
                 borderWithImageGradient: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ],
                borderGradient: LinearGradient(colors: [
                  Color(0xFFFF0000),
                  Color(0xFF0047FF )
                ]),
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!,
              )
            ],
          ) : null,
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h21),
              width: Dimensions.w35*10,
              height: Dimensions.h21*10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h16*2),
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF0000),
                      Color(0xFF0047FF)
                    ] 
                )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h27),
                    width: Dimensions.w35*9,                    
                    child: Text(
                      "TURBO ile Kendini Göster.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.h21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                   Container(
                    margin: EdgeInsets.only(top: Dimensions.h27),
                    width: Dimensions.w35*9,                    
                    child: Text(
                      "Fotoğraflarını ve profilini çekici hale getir ve TURBOLA senin olanın sana gelmesini bekle... Bölgendeki en harika profillerle eşleşme şansını artırmak için 30 dakika boyunca en önlerde listelenirsin.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.h16,

                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: Dimensions.w35*10,
              margin: EdgeInsets.only(top: Dimensions.h14),
              child: Text(
                "Devam’a dokunursan, ödemen bir kereye mahsus tahsil edilir. Abonelik sistemiyle alakalı herhangi bir tekrar eden ödeme olayı yoktur. Yinede ayrıntılı bilgi almak koşullarımız sayfasını okumanızı tavsiye ederiz. Devam tuşuna dokunduğunuzda koşullarımızı kabul etmiş olursun.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.h12
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h100/10),
              width: Dimensions.w270,
              height: Dimensions.h50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h300/10),
                gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF0000),
                      Color(0xFF0047FF)
                    ] 
                )
              ),
              child: Center(
                child: Text(
                  "DEVAM",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.h230/10,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      );
        },
      )
    );
  }
}