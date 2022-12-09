import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FreeStylePopup extends StatelessWidget {
  FreeStylePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.w35 * 10,
        height: Dimensions.h583,
        decoration: BoxDecoration(            
            borderRadius: BorderRadius.circular(Dimensions.h16)),
        child: Stack(
          children: [
            Positioned(
                        bottom: Dimensions.h100/9,
                        left: 0,
                        right: 0,                        
                        child: Container(
                         
                          width: double.maxFinite,
                          height: Dimensions.h583- Dimensions.h357,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(Dimensions.h16),
                              bottomRight: Radius.circular(Dimensions.h16)
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFD51CFF),
                                Color(0xFF6198EF)
                              ]
                            )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: Dimensions.h21),
                                width: Dimensions.w310,
                                child: Center(
                                  child: RichText(   
                                    textAlign: TextAlign.center,                                 
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                          text: "Bu kullanıcıya direkt mesaj gönderebilmek için "
                                        ),
                                        TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold                                            
                                          ),
                                          text: "CurvyLIKE"
                                        ),
                                        TextSpan(
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                          text: " veya"
                                        ),
                                        TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold 
                                          ),
                                          text: " CurvyCHIP"
                                        ),
                                         TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,                                           
                                          ),
                                          text: " kullanabilirsin. Detaylı bilgi için"
                                        ),
                                         TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,  
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline                                         
                                          ),
                                          text: " Kullanım Şartlarını"
                                        ),
                                         TextSpan(
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                          text: " inceleyin."
                                        ),
                                        
                                      ]
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                     margin: EdgeInsets.only(right: Dimensions.w60/10),
                                    width: Dimensions.w155,
                                    height: Dimensions.h17,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(Dimensions.h16)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                         
                                          child: Center(
                                            child: Text(
                                              "Bu Popup'ı bir daha gösterme",
                                              style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontSize: Dimensions.h9
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.asset("assets/images/close_small.png")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: Dimensions.w16),
                                    child: Center(
                                      child: Image.asset("assets/images/chevron_up_white.png"),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ),
            Positioned(
                child: Container(
              width: double.maxFinite,
              height: Dimensions.h357,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16),
                  image: DecorationImage(
                      image: AssetImage("assets/images/women.png"),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                    
                  Positioned(
                      left: Dimensions.w200 / 10,
                      right: Dimensions.w200 / 10,
                      top: Dimensions.h14,
                      child: Container(
                        width: Dimensions.w300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: Dimensions.w300 / 5.2,
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 20)),
                              child: Center(
                                child: Container(
                                  height: Dimensions.h7 / 3,
                                  width: Dimensions.w300 / 5.2 / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 4),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF6198EF)
                                      ])),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w300 / 5.2,
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 20)),
                              child: Center(
                                child: Container(
                                  height: Dimensions.h7 / 3,
                                  width: Dimensions.w300 / 5.2 / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 4),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF6198EF)
                                      ])),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w300 / 5.2,
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 20)),
                              child: Center(
                                child: Container(
                                  height: Dimensions.h7 / 3,
                                  width: Dimensions.w300 / 5.2 / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 4),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF6198EF)
                                      ])),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w300 / 5.2,
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 20)),
                              child: Center(
                                child: Container(
                                  height: Dimensions.h7 / 3,
                                  width: Dimensions.w300 / 5.2 / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 4),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF6198EF)
                                      ])),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w300 / 5.2,
                              height: Dimensions.h7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h100 / 20)),
                              child: Center(
                                child: Container(
                                  height: Dimensions.h7 / 3,
                                  width: Dimensions.w300 / 5.2 / 1.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 4),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF6198EF)
                                      ])),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: Dimensions.h40,
                      left: Dimensions.w200 / 10,
                      child: Container(
                        height: Dimensions.h8 * 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/report.png"),
                            Image.asset("assets/images/share.png")
                          ],
                        ),
                      )),
                  Positioned(
                      top: Dimensions.h300 + Dimensions.h300/6,
                      left: Dimensions.w200/10,
                      right: Dimensions.w200/10,
                      child: Container(
                       
                        height: Dimensions.h66,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: Dimensions.w8,
                                      height: Dimensions.h8,
                                      margin: EdgeInsets.only(right: Dimensions.w9),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF05ED00),
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h8 / 2)),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "Ahu,",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h36,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                     Container(
                                      child: Center(
                                        child: Text(
                                          "23",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h230/10
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: Dimensions.w9),
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/location_white.png"),
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "5 km uzaklıkta",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: Dimensions.h60,
                                  height: Dimensions.h60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.h60/2),
                                    color: Colors.black.withOpacity(0.67)
                                  ),
                                  child: Center(
                                    child: Image.asset("assets/images/matcher_superlike.png"),
                                  ),
                                ),
                                 Container(
                                  width: Dimensions.h60,
                                  height: Dimensions.h60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.h60/2),
                                    color: Colors.black.withOpacity(0.67)
                                  ),
                                  child: Center(
                                    child: Image.asset("assets/images/matcher_chip.png"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )),

                     
                ],
              ),
            )),
           
          ],
        ));
  }
}
