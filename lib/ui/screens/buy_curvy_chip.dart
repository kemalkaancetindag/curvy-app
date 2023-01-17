import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/buy_curvy_chip_controller.dart';
import 'package:curvy_app/ui/widgets/buy_boost_package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BuyCurvyChipScreen extends StatelessWidget {
  const BuyCurvyChipScreen({super.key});

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
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
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
                              child: Image.asset("assets/images/chip_buy_icon.png"),
                            ),
                            Container(
                              child: Text(
                                "CurvyCHIP",
                                style: TextStyle(
                                  color: Color(0xFFCC9933),
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
      body: GetBuilder<BuyCurvyChipController>(
        builder:(controller) {
          return  Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: Dimensions.h27*12,
              width: Get.width,
              child: controller.activeImage != null ?  PageView(
           
            controller: PageController(viewportFraction: 0.5, initialPage: 1),
            onPageChanged: (value) {
              controller.setCurrentPage(value.toInt());
            },
            children: [
              BuyBoostPackageCard(
                title: "EN POPÜLER", 
                mainImage: "assets/images/curvy_chip_popular.png", 
                amount: 3, 
                packageName: "CurvyCHIP", 
                cost: "19,99", 
                withBorder: false, 
                packageCustomBorderActiveImage: controller.activeImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 0,
                borderWithImageColor: Color(0xFFCC9933)
              ),
               BuyBoostPackageCard(
                title: "EN POPÜLER", 
                mainImage: "assets/images/curvy_chip_popular.png", 
                amount: 3, 
                packageName: "CurvyCHIP", 
                cost: "19,99", 
                withBorder: false, 
                packageCustomBorderActiveImage: controller.activeImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 1,
                borderWithImageColor: Color(0xFFCC9933)
              ), BuyBoostPackageCard(
                title: "EN POPÜLER", 
                mainImage: "assets/images/curvy_chip_popular.png", 
                amount: 3, 
                packageName: "CurvyCHIP", 
                cost: "19,99", 
                withBorder: false, 
                packageCustomBorderActiveImage: controller.activeImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 2,
                borderWithImageColor: Color(0xFFCC9933)
              )
            ],
           
          ) : null,
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h100/10),
              width: Dimensions.w35*10,
              height: Dimensions.h21*10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h16*2),
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xFF2E2B2B),
                    Colors.black
                  ] 
                )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h27),
                    width: Dimensions.w35*9,                    
                    child: Text(
                      "Herhangi bir kullanıcıyla eşleşmeden direkt mesaj atabilme özgürlüğü tanır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCC9933),
                        fontSize: Dimensions.h21,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                   Container(
                    margin: EdgeInsets.only(top: Dimensions.h27),
                    width: Dimensions.w35*9,                    
                    child: Text(
                      "Kullanıcı seni engellemediği sürece sohbet edebilmeni sağlar ki bu yöntemle edindiğin arkadaşlarla eşleşemez sadece CURVY CHIP kullanarak yazışabilirsin.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCC9933),
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
                    Colors.black,
                    Color(0xFF2E2B2B),
                    Colors.black
                  ]
                )
              ),
              child: Center(
                child: Text(
                  "DEVAM",
                  style: TextStyle(
                    color: Color(0xFFCC9933),
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