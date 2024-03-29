import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/online_hub_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HubFoundWidget extends StatelessWidget {
  const HubFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnlineHubController>(
      builder: (controller){
        return  Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.only(top: Dimensions.h50),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF000000),
        Color(0xFF2E2B2B),
        Color(0xFF000000),
      ])),
      child: SingleChildScrollView(
        
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: (Dimensions.h50 * 11) + (Dimensions.h230),
            width: Dimensions.w35 * 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                gradient: LinearGradient(
                    colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: Dimensions.w42),
                        child: Text(
                          "Bu Gece Eğlenelim",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h230 / 10),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();                          
                          controller.leftHub();
                          Get.delete<OnlineHubController>();
                        },
                        child:   Container(
                        margin: EdgeInsets.only(right: Dimensions.w300 / 10),
                        child: SvgPicture.asset("assets/svg/hub/close.svg"),
                      ),
                      ),
                    
                    ],
                  ),
                ),
                GestureDetector(
                  onPanDown: (details){
                    controller.controlCurrentUserCarousel(details.localPosition.dx, details.localPosition.dx);
                  },
                  child: AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                  width: double.maxFinite,
                  height: controller.isMessageAreaExpanded ?  Dimensions.h50 * 9.5 : Dimensions.h60*10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  ),
                  child: Stack(
                    children: controller.foundCurrentUserCarousel ?? []
                  ),
                ),
                ),
                
                Container(
                  width: double.maxFinite,
                  child: Column(
                    children: [
                     Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
                              children: [
                                Container(
                                  height: Dimensions.h27,
                                  child: Center(
                                    child: SvgPicture.asset("assets/svg/hub/curvy_chip.svg"),
                                  ),
                                ),
                                Container(
                                  height: Dimensions.h27,
                                  child: Center(
                                    child: Text(
                                      "CurvyCHIP",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.h21,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: Dimensions.h16),
                                  height: Dimensions.h27,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: Dimensions.h8/2, horizontal: Dimensions.w11/2),
                                        child: Container(      
                                          margin: EdgeInsets.only(right: Dimensions.w50),                                    
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(Dimensions.h7)
                                          ),
                                          child: Center(
                                            child: Text(
                                              "168",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h9
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              
                                
                              ],
                            ),
                          )
                        ],
                      ),
                     )
                    ],
                  ),
                ),
                controller.isMessageAreaExpanded ? 
                Container(
                  width: Dimensions.w320,
                  height: Dimensions.h16*10.5 ,
                  child: Column(
                    
                    children: [
                        Text(
                          "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.h100/10
                          ),
                        ),
                        Container(     
                          margin: EdgeInsets.only(top: Dimensions.h14),                     
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Container(
                                width: Dimensions.w270+(Dimensions.w2*10),
                                height: Dimensions.h90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(Dimensions.h16)
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    controller.curvyChipMessageText = value;
                                  },
                                  maxLines: 5,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.w9, vertical: Dimensions.h8),
                                    hintText: "Bir mesaj yaz",
                                    hintStyle: TextStyle(
                                      color: Color(0xFFC5C5C7)
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,                                    
                                  ),
                                ),
                              ),
                              Container(                                
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(onTap: () async {
                                     controller.sendCurvyChipMessage();
                                    },
                                      child:      Container(
                                      width: Dimensions.h21,
                                      height: Dimensions.h21,
                                      child:SvgPicture.asset("assets/svg/hub/send.svg"),
                                    ),
                                    ),
                               
                                    SizedBox(height: Dimensions.h100/10,),
                                     Container(
                                      width: Dimensions.h21,
                                      height: Dimensions.h21,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/chat_mic_white.png'),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.h100/10,),
                                     Container(
                                      width: Dimensions.h21,
                                      height: Dimensions.h21,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/chat_add_white.png'),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    )
                                   
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ) : 
                Container(
                  width: Dimensions.w320+Dimensions.w16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.w270,
                        height: Dimensions.h27,       
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimensions.h16)
                        ),                                       
                        child: TextField(   
                          onChanged: (value){
                            controller.curvyChipMessageText = value;
                          },
                          cursorColor: Colors.black,
                          maxLines: 5,                                                 
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: Dimensions.w9, bottom: Dimensions.h8*1.5),                            
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Bir mesaj yaz",
                            hintStyle: TextStyle(
                              color: Color(0xFFC5C5C7),
                              
                            )
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.sendCurvyChipMessage();
                        },
                        child:   Container(
                        width: Dimensions.h21,
                        height: Dimensions.h21,
                        child: SvgPicture.asset("assets/svg/hub/send.svg"),
                     
                      ),
                      )
                    

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      )
    );
      }
    );
  }
}
