import 'package:curvy_app/api/services/archive_service.dart';
import 'package:curvy_app/api/services/chat_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/user_detail_controller.dart';
import 'package:curvy_app/controllers/user_online_controller.dart';
import 'package:curvy_app/ui/widgets/archive_vip_profile_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveVipProfilesController extends GetxController {
  
  ArchiveService archiveService;
  List<dynamic>? _vipProfiles;  
  List<dynamic>? get vipProfiles => _vipProfiles;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;

  ArchiveVipProfilesController({required this.archiveService});

  String _curvyLikeMessageText = "";
  

  @override
  Future<void> onInit() async {
    _vipProfiles = await archiveService.getVipProfiles();
    generateTiles();
    update();
  }

  void generateTiles() {
    _tiles = [];
    _vipProfiles!.forEach((userID) { 
      Get.put(UserOnlineController(firestoreService: Get.find(), userID: userID), permanent: true, tag: userID);
      _tiles!.add(GestureDetector(
        onTap: () async {
          var userDetailController = Get.put(UserDetailController(firestoreService: Get.find(), userID: userID));          
                    
          Get.toNamed(Routes.userDetail);
        },
        child: ArchiveVipProfileBox(userID: userID,),
      ));      
    });
  }

  
  void showCurvyLikeDialog(String userID) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: Dimensions.w35 * 10,
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
                            child: Image.asset(
                                "assets/images/curvy_like_dialog.png"),
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
                                    child: Center(
                                      child: Text(
                                        "168",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Get.find<ChatService>().startNewChat(
                                    _curvyLikeMessageText, userID, 1);
                                _curvyLikeMessageText = "";
                                Get.back();
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/curvy_dialog_send_icon.png"),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_mic_icon.png"),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_add_icon.png"),
                              ),
                            )
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