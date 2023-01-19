import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/buy_plus_premium_controller.dart';
import 'package:curvy_app/ui/widgets/buy_plus_premium_package.dart';
import 'package:curvy_app/ui/widgets/buy_premium_plus_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BuyPlusPremiumScreen extends StatelessWidget {
  BuyPlusPremiumScreen({super.key});
  var _pageViewController = PageController();
  var _packagesViewController = PageController(viewportFraction: 0.5, initialPage: 1, );
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BuyPlusPremiumController>(
      builder: (controller) {
        return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.h45),
                width: Dimensions.w35 * 10,
                height: Dimensions.h100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.h100 / 5),
                        topRight: Radius.circular(Dimensions.h100 / 5),
                        bottomLeft: Radius.circular(Dimensions.h100 / 2),
                        bottomRight: Radius.circular(Dimensions.h100 / 2)),
                    gradient: controller.isPlus! ?  LinearGradient(colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF6198EF),
                    ]) :  LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ])),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Get.back();
                        await Get.delete<BuyPlusPremiumController>();
                      },
                      child:Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.h12,
                          left: Dimensions.w11,
                          right: Dimensions.w50 / 1.5),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                                "assets/images/chevron_left_white.png"),
                          )
                        ],
                      ),
                    ), 
                    ),
                    
                    Expanded(
                      child: Text(
                        "PREMIUM’a GEÇ SENDE DURDURULAMAZ OL!",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h27,
                            fontWeight: FontWeight.bold),
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
      body:  Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          children: [
            controller.isPlus! ?
            CustomPaint(
              painter: GradientBorder(),
              child: Container(
                width: Dimensions.w35 * 10,
                height: Dimensions.h50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.setIsPlus(true);
                      },
                      child: Container(
                      width: Dimensions.w17 * 10,
                      height: Dimensions.h36,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h100 / 5),
                              color: !controller.isPlus! ? Color(0xFFC5C5C7) : null,
                          gradient: controller.isPlus! ? LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)]) : null),
                      child: Center(
                        child: Text(
                          "Curvy Plus",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.setIsPlus(false);
                      },
                      child:  Container(
                      width: Dimensions.w17 * 10,
                      height: Dimensions.h36,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h100 / 5),
                          color: controller.isPlus! ? Color(0xFFC5C5C7) :null,
                          gradient: !controller.isPlus! ? LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ]) : null
                          
                        ),
                      child: Center(
                        child: Text(
                          "Curvy Platinyum",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    )
                    
                   
                  ],
                ),
              ),
            ) : Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(Dimensions.h50/2)
              ),
                width: Dimensions.w35 * 10,
                height: Dimensions.h50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.setIsPlus(true);
                      },
                      child: Container(
                      width: Dimensions.w17 * 10,
                      height: Dimensions.h36,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h100 / 5),
                              color: !controller.isPlus! ? Color(0xFFC5C5C7) : null,
                          gradient: controller.isPlus! ? LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)]) : null),
                      child: Center(
                        child: Text(
                          "Curvy Plus",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        controller.setIsPlus(false);
                      },
                      child:  Container(
                      width: Dimensions.w17 * 10,
                      height: Dimensions.h36,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h100 / 5),
                          color: controller.isPlus! ? Color(0xFFC5C5C7) :null,
                          gradient: !controller.isPlus! ? LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ]) : null
                          
                        ),
                      child: Center(
                        child: Text(
                          "Curvy Platinyum",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    )
                    
                   
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h16),
              height: Dimensions.h27 * 11,
              width: Get.width,
              child: PageView(
                controller: _packagesViewController,     
                onPageChanged: (value) {
                  controller.setCurrentPage(value.toInt());
                },                         
                children: controller.isPlus! ? 
                 [


                     BuyPlusPremiumPackage(
                      currentPage: controller.currentPage!,
                      pageIndex: 0,
                      title: "UYGUN FİYAT",
                      duration: "12",
                      cost: "22,50/ay",
                      discount: "%66 İNDİRİMLİ",
                      totalCost: "269,99",           
                      isPlus: true,           
                    )
                  ,
                   BuyPlusPremiumPackage(
                    currentPage: controller.currentPage!,
                    pageIndex: 1,
                        title: "EN POPÜLER",
                      duration: "6",
                      cost: "33,33/ay",
                      discount: "%50 İNDİRİMLİ",
                      totalCost: "199,99",    
                      isPlus: true,             
                    ),
                  BuyPlusPremiumPackage(
                    currentPage: controller.currentPage!,
                    pageIndex: 2,
                        title: "STANDART",
                      duration: "1",
                      cost: "66,99/ay",
                      discount: "İNDİRİMSİZ",
                      totalCost: "66,99",      
                      isPlus: true,           
                    )
  
                ] : [
                  
                     BuyPlusPremiumPackage(
                      currentPage: controller.currentPage!,
                      pageIndex: 0,
                      title: "UYGUN FİYAT",
                      duration: "12",
                      cost: "54,17/ay",
                      discount: "%60 İNDİRİMLİ",
                      totalCost: "649,99",           
                      isPlus: false,           
                    )
                  ,
                   BuyPlusPremiumPackage(
                    currentPage: controller.currentPage!,
                    pageIndex: 1,
                        title: "EN POPÜLER",
                      duration: "6",
                      cost: "78,33/ay",
                      discount: "%42 İNDİRİMLİ",
                      totalCost: "469,99",    
                      isPlus: false,             
                    ),
                  BuyPlusPremiumPackage(
                    currentPage: controller.currentPage!,
                    pageIndex: 2,
                        title: "STANDART",
                      duration: "1",
                      cost: "134,99/ay",
                      discount: "İNDİRİMSİZ",
                      totalCost: "134,99",      
                      isPlus: false,           
                    )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h16),
              width: Get.width,
              height: Dimensions.h160,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child:  PageView(

                controller: _pageViewController,
                children: controller.isPlus! ? controller.plusWidgets : controller.platiniumWidgets
                
              ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            
                            if((_pageViewController.page! - 1).toInt() != -1) {
                              _pageViewController.animateToPage((_pageViewController.page!-1).toInt(), duration: Duration(milliseconds: 200), curve: Curves.ease);
                            }
                          },
                          child:   Container(
                          margin: EdgeInsets.only(left: Dimensions.w2*10),
                          child: Image.asset("assets/images/chevron_left_white.png"),
                        ),
                        ),
                        GestureDetector(                        
                          onTap: (){
                            
                            if(controller.isPlus!){
                              if((_pageViewController.page! + 1).toInt() != 5) {
                              _pageViewController.animateToPage((_pageViewController.page!+1).toInt(), duration: Duration(milliseconds: 200), curve: Curves.ease);
                            }
                            }
                            else{
                               if((_pageViewController.page! + 1).toInt() != 10) {
                              _pageViewController.animateToPage((_pageViewController.page!+1).toInt(), duration: Duration(milliseconds: 200), curve: Curves.ease);
                            }
                            }
                             
                          },
                          child: Container(
                          margin: EdgeInsets.only(right: Dimensions.w2*10),
                          child: Image.asset("assets/images/chevron_right_white.png"),
                        ),
                        )                                               
                      ],

                    )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h16),
              child: Text(
                "Devam’a dokunursan, ödemen tahsil edilir ve sen App Store’daki  ayarlardan aboneliğini iptal etmediğin sürece, aboneliğin aynı fiyata aynı paket süresi kadar otomatik olarak yenilenir ve koşullarımızı kabul etmiş olursun.",
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
                gradient: controller.isPlus! ? LinearGradient(
                  colors: [
                    Color(0xFFD51CFF),
                    Color(0xFF6198EF)
                  ]
                ) :  LinearGradient(colors: [
                      Colors.black,
                      Color(0xFF2E2B2B),
                      Colors.black
                    ]) 
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
    ); 
  }
}

class GradientBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect gradientRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height);
    RRect gradientBorder = RRect.fromRectAndRadius(
        gradientRect, Radius.circular(Dimensions.h50 / 2));

    Paint gradientPaint = Paint()
      ..shader = LinearGradient(colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)])
          .createShader(gradientRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRRect(gradientBorder, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
