import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HubEmptyWidget extends StatelessWidget {
  const HubEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF000000),
        Color(0xFF2E2B2B),
        Color(0xFF000000),
      ])),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.h7 * 10),
                width: Dimensions.w35 * 10,
                height: Dimensions.h50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                    gradient: LinearGradient(
                        colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.w42),
                      child: Text(
                        "BU GECE EĞLENELİM",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h300 / 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.w200 / 10),
                      child: Center(
                        child: Image.asset("assets/images/hub_close_icon.png"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: Dimensions.h17 * 21,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.h120,
                    height: Dimensions.h120,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.h120 / 2),
                        image: DecorationImage(
                            image: AssetImage("assets/images/women.png"),
                            fit: BoxFit.fill)),
                  ),
                ],
              )),
          Positioned(
              bottom: Dimensions.h90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(                    
                    width: Dimensions.w270 + Dimensions.w180 / 10,
                    child: Text(
                      "Bölgende gösterebileceğimiz üye kalmadı",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.h21),
                    ),
                  ),
                ],
              )),
              Positioned(
                left: 0,
                right: 0,
                bottom: Dimensions.h14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                  width: Dimensions.w35*10,
                  height: Dimensions.h50*10,
                  
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(Dimensions.h16*2),
                    image: DecorationImage(
                      image: AssetImage("assets/images/explore_1.png"),
                      fit: BoxFit.fill
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h12),
                        width: Dimensions.w8*10,
                        height: Dimensions.h40/10,
                        decoration: BoxDecoration(
                          color: Color(0xFF7B8491),
                          borderRadius: BorderRadius.circular(Dimensions.h21/10)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h45),
                        child: Text(
                          "İlgi Alanlarında",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h21
                          ),
                        ),
                      ),
                       Container(
                        child: Text(
                          "ARKADAŞ OLALIM MI?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                       Container(
                        child: Text(
                          "Kullanan Kişileri Arıyoruz...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h21
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h120),
                        width: Dimensions.w267,
                        child: Text(                          
                          "Müdahale etmezseniz bir sonraki ilgi alanına otomatik geçiş yapacaksınız",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h21
                          ),
                        ),
                      ),
                      Container(
                        width: Dimensions.w270+Dimensions.w140/10,
                        height: Dimensions.h50,
                        margin: EdgeInsets.only(top: Dimensions.h22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.h300/10),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFD51CFF),
                              Color(0xFF6198EF)
                            ]
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "9 SANİYE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h22,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                           
                          ]
                        ,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h21),
                        child: Text(
                          "İlgi Alanları Ekranına Geri Dön",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h21,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                  ],
                )
              ),
              
        ],
      ),
    );
  }
}
