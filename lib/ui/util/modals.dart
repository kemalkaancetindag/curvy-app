import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/current_user_online_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Modals {
  String _curvyLikeMessageText = "";
  String _curvyChipMessageText = "";

  void curvyLikeModal(String userID) {
     showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.w42),
            backgroundColor: Colors.transparent,
            child: Container(
              height: Dimensions.h22 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    height: Dimensions.h36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: SvgPicture.asset("assets/svg/modals/curvy_like.svg"),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "CurvyLIKE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h21),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.w9 / 3),
                                    child: GetBuilder<CurrentUserOnlineController>(
                                      builder: (cuoc) {
                                        return Center(
                                      child: Text(
                                        cuoc.userModel!.curvy_like!.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    );
                                      },
                                    )
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                    width: Dimensions.w320,
                    height: Dimensions.h60,
                    child: Text(
                      "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h100 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Dimensions.w325,
                    height: Dimensions.h90,
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: Dimensions.w270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h16)),
                          child: TextField(
                            onChanged: (value) {
                              _curvyLikeMessageText = value;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(Dimensions.w9),
                                hintText: "Bir mesaj yaz",
                                hintStyle: TextStyle(color: Color(0xFFC5C5C7)),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var result = await Get.find<ChatService>()
                                    .startNewChat(_curvyLikeMessageText,
                                        userID, 1);

                                if (result) {
                                  Get.back();
                                  await Get.find<MatchService>()
                                      .createMatch(userID);
                                  _curvyLikeMessageText = "";                                  
                                }
                              },
                              child: Container(
                                width: Dimensions.h22,
                                height: Dimensions.h22,
                                child: SvgPicture.asset("assets/svg/hub/send.svg"),
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void curvyChipModal(String userID) {
     showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: Dimensions.w42),
            backgroundColor: Colors.transparent,
            child: Container(
              height: Dimensions.h22 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    height: Dimensions.h36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: SvgPicture.asset("assets/svg/modals/curvy_chip.svg"),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "CurvyCHIP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h21),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.w9 / 3),
                                    child: GetBuilder<CurrentUserOnlineController>(
                                      builder: (cuoc){
                                        return  Center(
                                      child: Text(
                                        cuoc.userModel!.curvy_chip!.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    );
                                      },
                                    )
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                    width: Dimensions.w320,
                    height: Dimensions.h60,
                    child: Text(
                      "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h100 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Dimensions.w325,
                    height: Dimensions.h90,
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: Dimensions.w270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h16)),
                          child: TextField(
                            onChanged: (value) {
                              _curvyChipMessageText = value;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(Dimensions.w9),
                                hintText: "Bir mesaj yaz",
                                hintStyle: TextStyle(color: Color(0xFFC5C5C7)),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var result = await Get.find<ChatService>()
                                    .startNewChat(_curvyChipMessageText,
                                        userID, 2);

                                if (result) {
                                  Get.back();
                                  await Get.find<MatchService>()
                                      .createMatch(userID);
                                  _curvyChipMessageText = "";
                                  

                                }
                              },
                              child: Container(
                                width: Dimensions.h22,
                                height: Dimensions.h22,
                               child: SvgPicture.asset("assets/svg/hub/send.svg"),
                              ),
                            ),                           
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}