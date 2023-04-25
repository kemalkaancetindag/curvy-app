import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/buy_curvy_like_controller.dart';
import 'package:curvy_app/ui/widgets/buy_boost_package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BuyCurvyLikeScreen extends StatelessWidget {
  const BuyCurvyLikeScreen({super.key});

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
                  gradient:  LinearGradient(
                                    colors: [
                                      Color(0xFF0095EC),
                                      Color(0xFF47C1B3)
                                    ],
                )
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(

                      margin: EdgeInsets.only(top: Dimensions.h12, left: Dimensions.w11, right: Dimensions.w50),
                      child: Column(
                        children: [
                          Container(
                            child: SvgPicture.asset("assets/svg/boosts/chevron_left.svg"),
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
                              child: SvgPicture.asset("assets/svg/boosts/curvy_like.svg"),
                            ),
                            Container(
                              child: Text(
                                "CurvyLIKE",
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
      body: GetBuilder<BuyCurvyLikeController>(
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
              child: controller.passiveImage != null && controller.activeImage != null ?  PageView(
            
            controller: PageController(viewportFraction: 0.5, initialPage: 1),
            onPageChanged: (value) {
              controller.setCurrentPage(value.toInt());
            },
            children: [
              BuyBoostPackageCard(
                title: "EN İYİ FİYAT", 
                mainImage: controller.currentPage == 0 ? "assets/images/curvy_like_bestdeal.png" : "assets/images/curvy_like_bestdeal_deactive.png", 
                amount: 3, 
                packageName: "CurvyLIKE", 
                cost: "19,99", 
                withBorder: true, 
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 0,
                borderGradient: LinearGradient(
                  colors: [
                    Color(0xFF0095EC),
                    Color(0xFF47C1B3)
                  ]
                ),
              borderWithImageGradient: [
                 Color(0xFF0095EC),
                    Color(0xFF47C1B3)
              ],
              ),
               BuyBoostPackageCard(
                title: "EN POPÜLER", 
                mainImage: controller.currentPage == 1 ? "assets/images/curvy_like_popular.png" : "assets/images/curvy_like_popular_deactive.png", 
                amount: 3, 
                packageName: "CurvyLIKE", 
                cost: "19,99", 
                withBorder: true, 
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 1,
                borderWithImageGradient: [
                 Color(0xFF0095EC),
                    Color(0xFF47C1B3)
              ],
                borderGradient: LinearGradient(
                  colors: [
                    Color(0xFF0095EC),
                    Color(0xFF47C1B3)
                  ]
                ),
              ), BuyBoostPackageCard(
                title: "STANDART", 
                mainImage: controller.currentPage == 2 ? "assets/images/curvy_like_standart.png" : "assets/images/curvy_like_standart_deactive.png", 
                amount: 3, 
                packageName: "CurvyLIKE", 
                cost: "19,99", 
                withBorder: true, 
                packageCustomBorderActiveImage: controller.activeImage!,
                packageCustomBorderPassiveImage: controller.passiveImage!, 
                currentPage: controller.currentPage, 
                pageIndex: 2,
                borderWithImageGradient: [
                 Color(0xFF0095EC),
                    Color(0xFF47C1B3)
              ],
                borderGradient: LinearGradient(
                  colors: [
                    Color(0xFF0095EC),
                    Color(0xFF47C1B3)
                  ]
                ),
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
                                      Color(0xFF0095EC),
                                      Color(0xFF47C1B3)
                                    ],
                )
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h27),
                    width: Dimensions.w35*9,                    
                    child: Text(
                      "Eşleşme şansını 3 kat artır.",
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
                      "Sadece sağa kaydırmaktan veya chip kullanarak yazmaktan farkı eşleştiğinde chip harcamadan doya doya görüşebilirsiniz. Ayrıca CurvyLIKE diğer sağa kaydırmalardan önce karşı tarafta listelenir",
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
                                      Color(0xFF0095EC),
                                      Color(0xFF47C1B3)
                                    ],
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