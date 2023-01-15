import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                              child: Image.asset("assets/images/like_buy_icon.png"),
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
        preferredSize: Size(double.maxFinite, Dimensions.h137),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: Dimensions.h27*11,
              width: Get.width,
              child: PageView.builder(
            itemCount: 10,
            controller: PageController(viewportFraction: 0.5),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.w11),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    color: Colors.black,
                  )
                ),
              );
            },
          ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h21),
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
      ),
    );
  }
}