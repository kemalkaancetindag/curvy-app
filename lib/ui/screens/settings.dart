import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/enums/enum_enum.dart';
import 'package:curvy_app/enums/language_enum.dart';
import 'package:curvy_app/ui/screens/delete_account_last_chance.dart';
import 'package:curvy_app/ui/screens/settings_header_text.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:curvy_app/ui/widgets/main_boost_button.dart';
import 'package:curvy_app/ui/widgets/settings_boost_button.dart';
import 'package:curvy_app/ui/widgets/settings_component_header.dart';
import 'package:curvy_app/ui/widgets/settings_modal_switch_column.dart';
import 'package:curvy_app/ui/widgets/settings_modal_switch_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:curvy_app/controllers/pages/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController(
        userService: Get.find(), firestoreService: Get.find()));
    void showBanPeopleDialog() {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
              ),
              child: Container(
                height: Dimensions.h520 + Dimensions.h50,
                width: Dimensions.w300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.h16),
                    gradient: LinearGradient(
                        colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                child: Column(
                  children: [
                    Container(
                      width: Dimensions.w254,
                      margin: EdgeInsets.only(top: Dimensions.h300 / 10),
                      child: Center(
                        child: Text(
                          "Curvy’de seni görmesini istemediğin biri mi var?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h36),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.h8, bottom: Dimensions.h16),
                      width: Dimensions.w254,
                      child: Center(
                        child: Text(
                          "Çözümü çok basit. Seni görmesini istemediğin kişileri seçmek için. bu özelliği kullanırken cihazının kişilerini Curvy ile paylaş.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: Dimensions.h16),
                      width: Dimensions.w254,
                      child: Center(
                        child: Text(
                          "Seçtiğin kişilerin bize verdiğin bilgilerle açtıkları bir Curvy hesabı varsa, birbirinizi görememeniz için engellenen kişilerini saklayacağız. Kişilerini bizimle paylaşmayı, ayarlarından kapatabilirsin.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Center(
                        child: Text(
                          "Curvy’nin kişilerini nasıl işlediği de dahil olmak üzere ayrıntılı bilgiye Buradan Ulaşabilirsin.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h300 / 10),
                      width: Dimensions.w254,
                      height: Dimensions.h40,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h300 / 10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.white
                              ])),
                      child: Center(
                        child: Text(
                          "DEVAM ET",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.h21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    void selectLanguageDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520 + Dimensions.h50,
                    width: Dimensions.w300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: Dimensions.h300 / 10),
                            width: Dimensions.w254,
                            height: Dimensions.h40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h300 / 10),
                            ),
                            child: Center(
                              child: Text(
                                "LİSAN SEÇİMİ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h21,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.german.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient:
                                    controller.language == Language.german.value
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                Colors.white,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.white
                                              ])
                                        : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Almanca",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.arabic.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient:
                                    controller.language == Language.arabic.value
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                Colors.white,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.white
                                              ])
                                        : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Arapça",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.endonesia.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient: controller.language ==
                                        Language.endonesia.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Endonezce",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.french.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient:
                                    controller.language == Language.french.value
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                Colors.white,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.white
                                              ])
                                        : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Fransızca",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.hindu.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient:
                                    controller.language == Language.hindu.value
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                Colors.white,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.white
                                              ])
                                        : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Hintçe",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.english.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient: controller.language ==
                                        Language.english.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "İngilizce",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.spanish.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient: controller.language ==
                                        Language.spanish.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "İspanyolca",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.italian.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient: controller.language ==
                                        Language.italian.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "İtalyanca",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.russian.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                gradient: controller.language ==
                                        Language.russian.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Center(
                                child: Text(
                                  "Rusça",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setLanguage(Language.turkish.value);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w254,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                                gradient: controller.language ==
                                        Language.turkish.value
                                    ? LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                            Colors.white,
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.white
                                          ])
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "Türkçe",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.h22, bottom: Dimensions.h22),
                              width: Dimensions.w99,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_cancel.png"),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.updateLanguage();
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_check.png"),
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )),
              );
            });
          });
    }

    void changeUsernameDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h140,
                  width: Dimensions.w300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h27),
                        child: Center(
                          child: Text(
                            "KULLANICI ADINI SEÇ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.h16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        width: Dimensions.w267,
                        height: Dimensions.h300 / 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h16)),
                        child: Stack(
                          children: [
                            Positioned(
                                left: 0,
                                top: Dimensions.h8 / 2,
                                child: Container(
                                  width: Dimensions.h21,
                                  height: Dimensions.h21,
                                  child: Center(
                                    child: Text(
                                      "@",
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontSize: Dimensions.h16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                            Positioned(
                                left: Dimensions.h21,
                                bottom: Dimensions.h8 / 2,
                                top: 0,
                                child: Container(
                                  width: Dimensions.w180 + 10,
                                  child: TextField(
                                    maxLines: 1,
                                    controller:
                                        controller.usernameFieldController,
                                    onChanged: (value) {
                                      if (value.length <
                                          controller.maxChar + 1) {
                                        controller.setUsername(value);
                                        controller.usernameFieldController
                                                .selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: controller
                                                        .usernameFieldController
                                                        .text
                                                        .length));
                                      } else {
                                        controller.usernameFieldController
                                            .text = controller.username!;
                                        controller.usernameFieldController
                                                .selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset: controller
                                                        .usernameFieldController
                                                        .text
                                                        .length));
                                      }
                                    },
                                    style: TextStyle(color: Color(0xFF7B8491)),
                                    cursorColor: Color(0xFF7B8491),
                                    decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none),
                                  ),
                                )),
                            Positioned(
                                right: Dimensions.h8 / 2,
                                top: Dimensions.h8 / 2,
                                child: Container(
                                  width: Dimensions.h21,
                                  height: Dimensions.h21,
                                  child: Center(
                                    child: Text(
                                      controller.leftChar.toString(),
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 20),
                        child: Center(
                          child: Text(
                            "X - bu kullanıcı adı daha önce alınmış",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.h16 / 2),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h12),
                        width: Dimensions.h100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_cancel.png"),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.updateUsername();
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_check.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          });
    }

    void showInstantNotificationsModal() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520 + Dimensions.h50,
                    width: Dimensions.w300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h12, bottom: Dimensions.h12),
                            child: Center(
                              child: Text(
                                "ANLIK BİLDİRİM AYARLARI",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.h100 / 5),
                              ),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Yeni Eşleşmeler",
                            text: "Yeni bir eşleşmen var.",
                            switchState: controller.instantOnMatch ?? true,
                            switchOnChange: controller.setInstantOnMatch,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Mesajlar",
                            text: "Sana mesaj gönderen biri var.",
                            switchState: controller.instantOnMessage ?? true,
                            switchOnChange: controller.setInstantOnMessage,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Mesaj Beğenileri",
                            text: "Mesajını beğenen biri var.",
                            switchState:
                                controller.instantOnMessageLike ?? true,
                            switchOnChange: controller.setInstantOnMessageLike,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "CurvyLIKE'lar",
                            text: "Seni CurvyLIKE’layan biri var.",
                            switchState: controller.instantOnCurvyLike ?? true,
                            switchOnChange: controller.setInstantOnCurvyLike,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: Dimensions.h12),
                            padding: EdgeInsets.only(
                                left: Dimensions.w2 * 10,
                                right: Dimensions.w2 * 10),
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          "Yeni Beğeniler",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h100 / 5),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.h12),
                                      child: Center(
                                        child: Text(
                                          "Seni beğenen yeni kişiler var",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1,
                                  width: Dimensions.w200,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.setInstantNewLikes(1);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.h8 / 2,
                                        bottom: Dimensions.h8 / 2),
                                    width: Dimensions.w155,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              "1 Yeni Beğeni",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h16),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: controller.instantNewLikes !=
                                                      null &&
                                                  controller.instantNewLikes ==
                                                      1
                                              ? Center(
                                                  child: Image.asset(
                                                      "assets/images/settings_modal_check.png"))
                                              : null,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                  width: Dimensions.w200,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.setInstantNewLikes(3);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.h8 / 2,
                                        bottom: Dimensions.h8 / 2),
                                    width: Dimensions.w155,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              "3 Yeni Beğeni",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h16),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: controller.instantNewLikes !=
                                                      null &&
                                                  controller.instantNewLikes ==
                                                      3
                                              ? Center(
                                                  child: Image.asset(
                                                      "assets/images/settings_modal_check.png"))
                                              : null,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                  width: Dimensions.w200,
                                  child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller.setInstantNewLikes(10);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: Dimensions.h8 / 2,
                                          bottom: Dimensions.h8),
                                      width: Dimensions.w155,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Center(
                                              child: Text(
                                                "10 Yeni Beğeni",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Dimensions.h16),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: controller.instantNewLikes !=
                                                        null &&
                                                    controller
                                                            .instantNewLikes ==
                                                        10
                                                ? Center(
                                                    child: Image.asset(
                                                        "assets/images/settings_modal_check.png"))
                                                : null,
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Titreşim",
                            text: "Uygulama içi titreşimleri aç",
                            switchOnChange: controller.setInstantVibration,
                            switchState: controller.instantVibration ?? true,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Ses",
                            text: "Uygulama içi sesleri aç",
                            switchState: controller.instantSound ?? true,
                            switchOnChange: controller.setInstantSound,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h12, bottom: Dimensions.h12),
                            width: Dimensions.w99,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/settings_modal_cancel.png"),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateInstantNotifications();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/settings_modal_check.png"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              );
            });
          });
    }

    void showEmailNotificationsModal() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520 + Dimensions.h50,
                    width: Dimensions.w300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h300 / 10,
                                bottom: Dimensions.h100 / 10),
                            child: Center(
                              child: Text(
                                "E-POSTA BİLDİRİMLERİ",
                                style: TextStyle(
                                    fontSize: Dimensions.h100 / 5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.h16 / 4),
                            width: Dimensions.w270,
                            height: Dimensions.h300 / 10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.h300 / 20)),
                            child: TextField(
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor: Color(0xFF7B8491),
                              decoration: InputDecoration(
                                hintText: "E-Postanı yaz ve doğrula",
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.h16 / 4),
                            child: Center(
                              child: Text(
                                "Geçersiz bir mail adesi yazdınız",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h16 / 2),
                              ),
                            ),
                          ),
                          Container(
                            width: Dimensions.w270,
                            height: Dimensions.h300 / 10,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.white
                                    ])),
                            child: Center(
                                child: Text(
                              "Doğrulama E-postası Gönder",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h16,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h16 / 2,
                                bottom: Dimensions.h16 / 2),
                            width: Dimensions.w270,
                            height: Dimensions.h300 / 10,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.white
                                    ])),
                            child: Center(
                                child: Text(
                              "Yeniden Doğrulama E-postası Gönder",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.h16,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.h12),
                            child: Center(
                              child: Text(
                                "3 dakika içerisinde yanlızca bir kod isteyebilirsiniz",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h16 / 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Yeni Eşleşmeler",
                            text: "Yeni bir eşleşmen var.",
                            switchOnChange: controller.setEmailOnMatch,
                            switchState: controller.emailOnMatch ?? false,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Mesajlar",
                            text: "Sana mesaj gönderen biri var.",
                            switchOnChange: controller.setEmailOnMessage,
                            switchState: controller.emailOnMessage ?? false,
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: Dimensions.w2 * 10,
                                right: Dimensions.w2 * 10),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: Dimensions.h12),
                                        child: Center(
                                            child: Text(
                                          "Tanıtımlar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h100 / 5),
                                        )),
                                      ),
                                      CupertinoSwitch(
                                          value: controller.emailOnMarketing ??
                                              false,
                                          onChanged: (value) {
                                            controller
                                                .setEmailOnMarketing(value);
                                          })
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h8,
                                      bottom: Dimensions.h12),
                                  child: Center(
                                    child: Text(
                                      "Curvy’den haberler, güncellemeler ve teklifler almak istiyorum",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h12, bottom: Dimensions.h12),
                            padding: EdgeInsets.only(
                                left: Dimensions.w31, right: Dimensions.w31),
                            child: Center(
                              child: Text(
                                "Almak istediğin e-posta sayısını belirle. Bütün e-postaları, sadece önemli olanları veya istersen çok daha azını alabilirsin, Dilediğin zaman, herhangi bir e- postanın altındaki bölümü kullanarak abonelikten çıkabilirsin.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h12, bottom: Dimensions.h12),
                            width: Dimensions.w99,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                      child: Center(
                                    child: Image.asset(
                                        "assets/images/settings_modal_cancel.png"),
                                  )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateEmailNotifications();
                                  },
                                  child: Container(
                                      child: Center(
                                    child: Image.asset(
                                        "assets/images/settings_modal_check.png"),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              );
            });
          });
    }

    void showPersonalizedMarketingPreferenecesModal() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(
              builder: (controller) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  ),
                  child: Container(
                      height: Dimensions.h520 + Dimensions.h50,
                      width: Dimensions.w300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.h16),
                          gradient: LinearGradient(
                              colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: Dimensions.w160,
                              margin: EdgeInsets.only(
                                  top: Dimensions.h300 / 10,
                                  bottom: Dimensions.h8),
                              child: Center(
                                child: Text(
                                  "KİŞİSELLEŞTİRİLMİŞ PAZARLAMA İZİNLERİ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.h100 / 5),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: Dimensions.h12),
                              width: Dimensions.w270,
                              child: Center(
                                child: Text(
                                  "Herhangi bir Pazarlama İzinleri seçneğini açıp kapatabilirsin. Zaman zaman yeni ortaklar ekleyebiliriz. Bunlar bu listeye eklenecektir. Ayarlarını istediğin zaman aşağıdan değiştirebilirsin.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                              width: Dimensions.w270,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            SettingsModalSwitchRow(
                              title: "AppFlayer",
                              text: "Ayrıntıları Görüntüle",
                              switchState: controller.appFlayer ?? true,
                              switchOnChange: controller.setAppFlayer,
                            ),
                            SizedBox(
                              height: 2,
                              width: Dimensions.w270,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            SettingsModalSwitchRow(
                              title: "Branch",
                              text: "Ayrıntıları Görüntüle",
                              switchState: controller.branch ?? true,
                              switchOnChange: controller.setBranch,
                            ),
                            SizedBox(
                              height: 2,
                              width: Dimensions.w270,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            SettingsModalSwitchColumn(
                              title: "Yeni Pazarlama İzinleri’ne izin ver",
                              text:
                                  "Yeni araçlar ekleyebiliriz. Bu ayar, bu yeni araçların varsayılan olarak etkin mi yoksa devre dışı mı olacağını belirler.",
                              isSwitch: true,
                              switchState:
                                  controller.newMarketingPermissions ?? true,
                              switchOnChanged:
                                  controller.setNewMarketingPermissions,
                            ),
                            SizedBox(
                              height: 2,
                              width: Dimensions.w270,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: Dimensions.w99,
                              margin: EdgeInsets.only(
                                  top: Dimensions.h12 * 2,
                                  bottom: Dimensions.h12 * 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_cancel.png"),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller
                                          .updatePrivacyPersonalizedMarketing();
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_check.png"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              },
            );
          });
    }

    void showPersonalizedAdPreferenecesModal() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520 + Dimensions.h50,
                    width: Dimensions.w300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: Dimensions.w160,
                            margin: EdgeInsets.only(
                                top: Dimensions.h300 / 10,
                                bottom: Dimensions.h8),
                            child: Center(
                              child: Text(
                                "KİŞİSELLEŞTİRİLMİŞ REKLAM  İZİNLERİ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.h100 / 5),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.h12),
                            width: Dimensions.w270,
                            child: Center(
                              child: Text(
                                "Herhangi bir Reklam İzinleri seçneğini açıp kapatabilirsin. Zaman zaman yeni ortaklar ekleyebiliriz. Bunlar bu listeye eklenecektir. Ayarlarını istediğin zaman aşağıdan değiştirebilirsin.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Curvy Direct Ads",
                            text: "Ayrıntıları Görüntüle",
                            switchState: controller.curvyDirectAds ?? true,
                            switchOnChange: controller.setCurvyDirectAds,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Google Ads",
                            text: "Ayrıntıları Görüntüle",
                            switchState: controller.googleAds ?? true,
                            switchOnChange: controller.setGoogleAds,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Curvy Promotions",
                            text: "Ayrıntıları Görüntüle",
                            switchState: controller.curvyPromotions ?? true,
                            switchOnChange: controller.setCurvyPromotions,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchRow(
                            title: "Facebook Ads",
                            text: "Ayrıntıları Görüntüle",
                            switchState: controller.facebookAds ?? true,
                            switchOnChange: controller.setFacebookAds,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            title: "Yeni Reklam İzinleri’ne izin ver",
                            text:
                                "Yeni araçlar ekleyebiliriz. Bu ayar, bu yeni araçların varsayılan olarak etkin mi yoksa devre dışı mı olacağını belirler.",
                            isSwitch: true,
                            switchState: controller.newAdvertisingPermissions,
                            switchOnChanged:
                                controller.setNewAdvertisingPermissions,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: Dimensions.w99,
                            margin: EdgeInsets.only(
                                top: Dimensions.h12 * 2,
                                bottom: Dimensions.h12 * 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/settings_modal_cancel.png"),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller
                                        .updatePrivacyPersonalizedAdvertising();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/settings_modal_check.png"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              );
            });
          });
    }

    void showPrivacyPreferencesModal() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<SettingsController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520 + Dimensions.h50,
                    width: Dimensions.w300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h16),
                        gradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h300 / 10,
                                bottom: Dimensions.h8),
                            child: Center(
                              child: Text(
                                "GİZLİLİK TERCİHLERİ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Dimensions.h100 / 5),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimensions.h12),
                            width: Dimensions.w270,
                            child: Center(
                              child: Text(
                                "Tüm uygulamalarda olduğu gibi, Curvy’i de kullandığında da biz veya ortaklarımız tarafından işletilen araçlar vasıtasıyla cihazındaki bilgiler depolanır ve toplanır. Seçimlerini bu araçlarla ilgili olarak uygun gördüğün şekilde uyarlamanın basit bir yöntemini senin için hazırladık.Seçimlerini istediğin zaman bu ekrandan değiştirebilirsin.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            isSwitch: true,
                            title: "Pazarlama izinleri’ne izin ver",
                            text:
                                "Şuan pazarlama izinleri’ne izin veriyorsun İstediğin zaman kapatabilirsin",
                            switchState:
                                controller.privacyEnableMarketing ?? false,
                            switchOnChanged:
                                controller.setPrivacyEnableMarketing,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            function:
                                showPersonalizedMarketingPreferenecesModal,
                            isSwitch: false,
                            title: "Pazarlama izinleri’ni kişiselleştir",
                            text:
                                "Bu izleyiciler, üçüncü taraf sitelerde veya uygulamalarda Curvy’nin pazarlama kampanyalarının etkinliğini ölçmek ve iyileştirmek için kullanılır. Bu çerezler, reklam ortaklarımız tarafından ilgili alanlarının bir profilini oluşturarak ve diğer sitelerde senin ilgi alanlarına uygun reklamlar göstermek için kullanılabilir.",
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            isSwitch: true,
                            title: "Zorunlu İzinler",
                            text:
                                "Bu izleyiciler uygulamanın çalışması için gereklidir ve bu yüzden kapatılamaz. Genellikle senin tarafından yapılan ve gizlilik tercihlerini belirleme, oturum açma veya form doldurma gibi hizmet taleplerine karşılık gelen eylemlere yanıt olarak ayarlanır. ( Ayrıntıları Görüntüle )",
                            switchState:
                                controller.privacyCompulsoryPermissions ?? true,
                            switchOnChanged:
                                controller.setPrivacyCompulsoryPermissions,
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            isSwitch: true,
                            title: "Sosyal Medya İzinleri’ne izin ver",
                            text:
                                "Şuan pazarlama izinleri’ne izin veriyorsun İstediğin zaman kapatabilirsin",
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                            isSwitch: false,
                            title: "Sosyal Medya İzinleri’ni kişiselleştir",
                            text:
                                "Bu izleyiciler arkadaşlarınla ve sosyal ağınla içerik paylaşmanı sağlamak için uygulamaya eklediğimiz sosyal medya ve diğer hizmetler tarafından ayarlanır. Bu izleyicilere izin vermen durumunda bu sosyal özellikleri kullanamayabilir veya göremeyebilirsin.",
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: Dimensions.w2 * 10,
                                right: Dimensions.w2 * 10),
                            margin: EdgeInsets.only(
                                top: Dimensions.h12, bottom: Dimensions.h12),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Dimensions.w120 + Dimensions.w8,
                                    child: Center(
                                      child: Text(
                                        "Reklam İzinleri’ne İzin ver",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.h100 / 5),
                                      ),
                                    ),
                                  ),
                                  CupertinoSwitch(
                                      value:
                                          controller.privacyEnableAdvertising ??
                                              false,
                                      onChanged: (value) {
                                        controller
                                            .setPrivacyEnableAdvertising(value);
                                      })
                                ]),
                          ),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SettingsModalSwitchColumn(
                              function: showPersonalizedAdPreferenecesModal,
                              isSwitch: false,
                              title: "Reklam İzinleri’ni Kişiselleştir",
                              text:
                                  "Bu izleyiciler, reklam kampanyalarımızın etkinliğini ölçmek ve daha alakalı reklamlar sunmak için kullanılır. Bunlar, aynı reklamın sürekli olarak yeniden gösterilmesini önleme, reklamın doğru şekilde görüntülemesini sağlamai profilini temel alan reklamlar seçme ve görüntülenen reklam sayısını ve bunların belli bir reklama tıklayan kişi sayısı gibi yollardan performansını ölçme gibi işlevleri yerine getirir. Bu izleyiciler, reklam ortaklarımız tarafından ilgi alanlarının bir profilini oluşturmak ve diğer sitelerde senin ilgi alanlarına uygun reklamlar göstermek için kullanılabilir. bu izleyicilere izin vermen durumunda, göreceğin reklamlar seninle daha az alakalı olacaktır."),
                          SizedBox(
                            height: 2,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: Dimensions.w99,
                            margin: EdgeInsets.only(
                                top: Dimensions.h12 * 2,
                                bottom: Dimensions.h12 * 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Image.asset(
                                              "assets/images/settings_modal_cancel.png")),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.updatePrivacyPreferences();
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Image.asset(
                                              "assets/images/settings_modal_check.png")),
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                    )),
              );
            });
          });
    }

    return GetBuilder<SettingsController>(builder: (settingsPageController) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Ayarlar",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                settingsPageController.updateFieldsOnSettingsPage();
              },
              child: Container(
                margin: EdgeInsets.only(right: Dimensions.w16),
                child: Center(
                  child: Text(
                    "Tamam",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: settingsPageController.user != null
            ? Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Color(0xFFF7F7F7),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SettingsBoostButton(
                          background: LinearGradient(
                              transform: GradientRotation(283),
                              colors: [
                                Colors.black,
                                Color(0xFF2E2B2B),
                                Colors.black,
                              ],
                              begin: Alignment(-1, 0),
                              end: Alignment(1, 0)),
                          icon: "assets/images/platinium_logo.png",
                          text: "PLATINUM"),
                      SettingsBoostButton(
                          background: LinearGradient(colors: [
                            Color(0xFFD51CFF),
                            Color(0xFF6198EF),
                          ], begin: Alignment(-1, 0), end: Alignment(1, 0)),
                          icon: "assets/images/platinium_logo.png",
                          text: "PLUS"),
                      SettingsBoostButton(
                          background: LinearGradient(colors: [
                            Color(0xFFFF0000),
                            Color(0xFF0047FF),
                          ], begin: Alignment(-1, 0), end: Alignment(1, 0)),
                          icon: "assets/images/turbo_icon.png",
                          text: "TURBO"),
                      SettingsBoostButton(
                          background: LinearGradient(colors: [
                            Color(0xFF0095EC),
                            Color(0xFF47C1B3),
                          ], begin: Alignment(-1, 0), end: Alignment(1, 0)),
                          icon: "assets/images/like_icon.png",
                          text: "LIKE"),
                      SettingsBoostButton(
                          background: LinearGradient(colors: [
                            Color(0xFFEEB137),
                            Color(0xFFD99000),
                          ], begin: Alignment(-1, 0), end: Alignment(1, 0)),
                          icon: "assets/images/chip_icon.png",
                          text: "CHIP"),
                      Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: Dimensions.h27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SettingsHeaderText(text: "HESAP AYARLARI"),
                              Container(
                                width: double.maxFinite,
                                height: Dimensions.h165,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFC5C5C7), width: 1),
                                        top: BorderSide(
                                            color: Color(0xFFC5C5C7),
                                            width: 1))),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              padding: EdgeInsets.zero,
                                              primary:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: Dimensions.w11),
                                                      child: Center(
                                                        child: Text(
                                                          "Telefon Numarası",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              Dimensions.w11),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            settingsPageController
                                                                        .user!
                                                                        .phone_number !=
                                                                    null
                                                                ? settingsPageController
                                                                    .user!
                                                                    .phone_number!
                                                                : "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(Icons
                                                              .chevron_right_rounded)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))),
                                    SizedBox(
                                      width: 340,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFC5C5C7)),
                                      ),
                                    ),
                                    Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              padding: EdgeInsets.zero,
                                              primary:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: Dimensions.w11),
                                                      child: Center(
                                                        child: Text(
                                                          "Bağlantılı Hesaplar",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              Dimensions.w11),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .chevron_right_rounded)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))),
                                    SizedBox(
                                      width: 340,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Color(0xFFC5C5C7)),
                                      ),
                                    ),
                                    Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              padding: EdgeInsets.zero,
                                              primary:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: Dimensions.w11),
                                                      child: Center(
                                                        child: Text(
                                                          "E-posta",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              Dimensions.w11),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            settingsPageController
                                                                        .user!
                                                                        .email !=
                                                                    null
                                                                ? settingsPageController
                                                                    .user!
                                                                    .email!
                                                                : "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(Icons
                                                              .chevron_right_rounded)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h100 / 10,
                                      bottom: Dimensions.h100 / 4),
                                  width: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: settingsPageController
                                                    .user!.email_confirmation !=
                                                null &&
                                            !settingsPageController
                                                .user!.email_confirmation!
                                        ? [
                                            Container(
                                              width: 340,
                                              child: Text(
                                                "Hesabının güvence altına alınmasına yardımcı olmak için E-postanı doğrula.",
                                                style: TextStyle(
                                                    fontSize: Dimensions.h14,
                                                    color: Color(0xFFFF0000)),
                                              ),
                                            )
                                          ]
                                        : [],
                                  )),
                              SettingsHeaderText(text: "KEŞFET"),
                              Container(
                                height: Dimensions.h40 * 12,
                                margin: EdgeInsets.only(top: Dimensions.h7),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                        top: BorderSide(
                                            width: 1, color: Color(0xFFC5C5C7)),
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFC5C5C7)))),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              padding: EdgeInsets.zero,
                                              primary:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w17),
                                                        child: Text(
                                                          "Konum",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              Dimensions.w11),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Şu Anki Konumum",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                "Muratpaşa, Antalya",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF7B8491),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          Icon(Icons
                                                              .chevron_right_rounded)
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ))),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    Container(
                                      width: double.maxFinite,
                                      height: Dimensions.h160,
                                      child: Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.h17,
                                                  bottom: Dimensions.h17,
                                                  right: Dimensions.w17,
                                                  left: Dimensions.w17),
                                              width: double.maxFinite,
                                              child: SettingsComponentHeader(
                                                  text: "Mesafe Tercihi")),
                                          SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                      trackShape:
                                                          GradientRectSliderTrackShape(),
                                                      thumbColor: Colors.white,
                                                      thumbShape:
                                                          RoundSliderThumbShape(
                                                              elevation: 2),
                                                      inactiveTrackColor:
                                                          Color(0xFFC5C5C7),
                                                      activeTrackColor:
                                                          Color(0xFFC5C5C7)),
                                              child: Slider(
                                                value: settingsPageController
                                                            .distancePreferenceDistance !=
                                                        null
                                                    ? settingsPageController
                                                            .distancePreferenceDistance! /
                                                        100
                                                    : 0.2,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setDistance(value * 100);
                                                },
                                              )),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                  "Sadece bu aralıktaki kişileri göster"),
                                              CupertinoSwitch(
                                                  value: settingsPageController
                                                          .distancePreferenceOnlyThisInterval ??
                                                      false,
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setOnlyThisInterval(
                                                            value);
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    Expanded(
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.zero),
                                              padding: EdgeInsets.zero,
                                              primary:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: Dimensions.w17),
                                                      child: Center(
                                                        child: Text(
                                                          "Bana Göster",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              Dimensions.w11),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            settingsPageController
                                                                        .showme !=
                                                                    null
                                                                ? Utils.getEnumValue(
                                                                    Enums
                                                                        .showme,
                                                                    settingsPageController
                                                                        .showme!)
                                                                : "",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF7B8491),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(Icons
                                                              .chevron_right_rounded)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            ))),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17,
                                          top: Dimensions.h17,
                                          bottom: Dimensions.h17),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SettingsComponentHeader(
                                                  text: "Yaş Tercihi"),
                                              Text(
                                                settingsPageController.minAge !=
                                                            null &&
                                                        settingsPageController
                                                                .maxAge !=
                                                            null
                                                    ? "${settingsPageController.minAge!}-${settingsPageController.maxAge!}"
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491)),
                                              )
                                            ],
                                          ),
                                          SliderTheme(
                                              data: SliderTheme.of(context)
                                                  .copyWith(
                                                      trackShape:
                                                          GradientRectSliderTrackShape(),
                                                      thumbColor: Colors.white,
                                                      thumbShape:
                                                          RoundSliderThumbShape(
                                                              elevation: 2),
                                                      inactiveTrackColor: Color(
                                                          0xFFC5C5C7),
                                                      activeTrackColor:
                                                          Color(0xFFC5C5C7)),
                                              child: RangeSlider(
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setAgePreferenceRange(
                                                            value.start * 100,
                                                            value.end * 100);
                                                  },
                                                  values: settingsPageController
                                                                  .minAge !=
                                                              null &&
                                                          settingsPageController
                                                                  .maxAge !=
                                                              null
                                                      ? RangeValues(
                                                          settingsPageController
                                                                  .minAge!
                                                                  .toDouble() /
                                                              100,
                                                          settingsPageController
                                                                  .maxAge!
                                                                  .toDouble() /
                                                              100)
                                                      : RangeValues(0.0, 0.0))),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  "Sadece bu aralıktaki kişileri göster"),
                                              CupertinoSwitch(
                                                  value: settingsPageController
                                                          .agePreferenceOnlyThisInterval ??
                                                      false,
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setAgePreferenceOnlyThisInterval(
                                                            value);
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: Dimensions.w17,
                                        left: Dimensions.w17,
                                      ),
                                      width: double.maxFinite,
                                      height: Dimensions.h50,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SettingsComponentHeader(
                                                text: "Küresel"),
                                            CupertinoSwitch(
                                                value: settingsPageController
                                                        .global ??
                                                    false,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setGlobal(value);
                                                })
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(top: Dimensions.h8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 340,
                                        child: Text(
                                          "Dünyaya açılmak, hem çevrendeki hem de dünyanın dört bir yanındaki insanları görmeni sağlar.",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491)),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.w17,
                                    right: Dimensions.w17),
                                margin: EdgeInsets.only(top: Dimensions.h14),
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "KİMLERİ GÖREBİLDİĞİNİ KONTROL ET",
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: Dimensions.w111,
                                      height: Dimensions.h31,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h52),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFD51CFF),
                                                Color(0xFF6198EF)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)),
                                      child: Center(
                                        child: Text(
                                          "CurvyPLUS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: Dimensions.h8),
                                height: Dimensions.h120 + 5,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          settingsPageController
                                              .setRecommendationPreference(0);
                                        },
                                        child: Container(
                                            width: double.maxFinite,
                                            height: Dimensions.h60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SettingsComponentHeader(
                                                        text:
                                                            "Dengelenmiş Öneriler"),
                                                    Text(
                                                      "Sana en uygun insanları gör ( varsayılan ayar )",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF7B8491)),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: settingsPageController
                                                                    .recommendationPreference !=
                                                                null &&
                                                            settingsPageController
                                                                    .recommendationPreference ==
                                                                0
                                                        ? Image.asset(
                                                            "assets/images/settings_tick_icon.png")
                                                        : null,
                                                  ),
                                                )
                                              ],
                                            ))),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          settingsPageController
                                              .setRecommendationPreference(1);
                                        },
                                        child: Container(
                                            width: double.maxFinite,
                                            height: Dimensions.h60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SettingsComponentHeader(
                                                        text:
                                                            "Son Zamanda Aktif"),
                                                    Text(
                                                      "En son aktif olan insanları en önce gör",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF7B8491)),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: settingsPageController
                                                                    .recommendationPreference !=
                                                                null &&
                                                            settingsPageController
                                                                    .recommendationPreference ==
                                                                1
                                                        ? Image.asset(
                                                            "assets/images/settings_tick_icon.png")
                                                        : null,
                                                  ),
                                                )
                                              ],
                                            ))),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.w17,
                                    right: Dimensions.w17),
                                margin: EdgeInsets.only(top: Dimensions.h14),
                                width: double.maxFinite,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "SENİ KİMLER GÖREBİLİR KONTROL ET",
                                      style: TextStyle(
                                          color: Color(0xFF7B8491),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: Dimensions.w111,
                                      height: Dimensions.h31,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.h52),
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFD51CFF),
                                                Color(0xFF6198EF)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)),
                                      child: Center(
                                        child: Text(
                                          "CurvyPLUS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Dimensions.h16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: Dimensions.h8),
                                height: Dimensions.h120 + 5,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          settingsPageController
                                              .setViewerPreference(0);
                                        },
                                        child: Container(
                                            width: double.maxFinite,
                                            height: Dimensions.h60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SettingsComponentHeader(
                                                        text: "Standart"),
                                                    Text(
                                                      "Sana özel öneriler için sadece belirli insanlara görün",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF7B8491)),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: settingsPageController
                                                                    .viewerPreference !=
                                                                null &&
                                                            settingsPageController
                                                                    .viewerPreference ==
                                                                0
                                                        ? Image.asset(
                                                            "assets/images/settings_tick_icon.png")
                                                        : null,
                                                  ),
                                                )
                                              ],
                                            ))),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          settingsPageController
                                              .setViewerPreference(1);
                                        },
                                        child: Container(
                                            width: double.maxFinite,
                                            height: Dimensions.h60,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SettingsComponentHeader(
                                                        text:
                                                            "Sadece Beğendiğim İnsanlar"),
                                                    Text(
                                                      "Sadece sağa kaydırdıklarım beni görsün",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF7B8491)),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  child: Center(
                                                    child: settingsPageController
                                                                    .viewerPreference !=
                                                                null &&
                                                            settingsPageController
                                                                    .viewerPreference ==
                                                                1
                                                        ? Image.asset(
                                                            "assets/images/settings_tick_icon.png")
                                                        : null,
                                                  ),
                                                )
                                              ],
                                            ))),
                                  ],
                                ),
                              ),
                              SettingsHeaderText(text: "CONNECTIONS"),
                              Container(
                                  height: Dimensions.h45,
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(top: Dimensions.h7),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {
                                                showBanPeopleDialog();
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Kişileri Engelle",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    Dimensions
                                                                        .w11),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .chevron_right_rounded)
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h8,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 340,
                                        child: Text(
                                          "Curvy’de görmek veya görünmek istemediğin kişileri,kişiler listesinden seç.",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491)),
                                        ),
                                      )
                                    ],
                                  )),
                              SettingsHeaderText(text: "LİSAN SEÇİMİ"),
                              Container(
                                  width: double.maxFinite,
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h7,
                                      bottom: Dimensions.h31),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {
                                                selectLanguageDialog();
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            settingsPageController
                                                                        .language !=
                                                                    null
                                                                ? "${Utils.getEnumValue(Enums.language, settingsPageController.language!)} Olarak Seçildi"
                                                                : "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    Dimensions
                                                                        .w11),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Değiştir",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF7B8491),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Icon(Icons
                                                                .chevron_right_rounded)
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              SettingsHeaderText(text: "GÖRÜNÜRLÜK"),
                              Container(
                                height: Dimensions.h27 * 13,
                                width: double.maxFinite,
                                margin: EdgeInsets.only(bottom: Dimensions.h31),
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(color: Color(0xFFC5C5C7)),
                                )),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  color: Color(0xFFC5C5C7)))),
                                      padding: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SettingsComponentHeader(
                                                text: "Beni VIP'de Gizle"),
                                            CupertinoSwitch(
                                                value: settingsPageController
                                                        .hideMeOnVip ??
                                                    false,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setHideMeOnVip(value);
                                                })
                                          ]),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  color: Color(0xFFC5C5C7)))),
                                      padding: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SettingsComponentHeader(
                                                text:
                                                    "Beni CurvyTURBO'da Öner"),
                                            CupertinoSwitch(
                                                value: settingsPageController
                                                        .recommendMeOnTurbo ??
                                                    false,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setRecommendMeOnTurbo(
                                                          value);
                                                })
                                          ]),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border(
                                              top: BorderSide(
                                                  color: Color(0xFFC5C5C7)))),
                                      padding: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SettingsComponentHeader(
                                                text:
                                                    "Beni FreeStyle'da Gizle"),
                                            CupertinoSwitch(
                                                value: settingsPageController
                                                        .hideMeOnFreeStyle ??
                                                    false,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setHideMeOnFreeStyle(
                                                          value);
                                                })
                                          ]),
                                    )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                    top: BorderSide(
                                                        color: Color(
                                                            0xFFC5C5C7)))),
                                            padding: EdgeInsets.only(
                                                right: Dimensions.w17,
                                                left: Dimensions.w17),
                                            child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SettingsComponentHeader(
                                                          text:
                                                              "Beni MatcherStyle'da Gizle"),
                                                      CupertinoSwitch(
                                                          value: settingsPageController
                                                                  .hideMeOnMatcherStyle ??
                                                              false,
                                                          onChanged: (value) {
                                                            settingsPageController
                                                                .setHideMeOnMatcherStyle(
                                                                    value);
                                                          })
                                                    ]),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: Dimensions.h8),
                                                  child: Center(
                                                      child: Text(
                                                    "Kapılıyken, kart destesinde gösterilmeyeceksin. Yine de beğenmiş olduğun kişiler profilini görebilir ve seninle eşleşebilir. Eşleşmelerini görmeye ve onlara sohbet etmeye devam edebilirsin.",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF7B8491)),
                                                  )),
                                                )
                                              ],
                                            ))),
                                  ],
                                ),
                              ),
                              SettingsHeaderText(text: "OKUNMA BİLDİRİMLERİ"),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h8,
                                      bottom: Dimensions.h21),
                                  padding: EdgeInsets.only(
                                    right: Dimensions.w17,
                                    left: Dimensions.w17,
                                  ),
                                  width: double.maxFinite,
                                  height: Dimensions.h50 * 2.27,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SettingsComponentHeader(
                                                text:
                                                    "Okunma Bildirimlerini Kapat"),
                                            CupertinoSwitch(
                                                value: settingsPageController
                                                        .closeReadingNotifications ??
                                                    false,
                                                onChanged: (value) {
                                                  settingsPageController
                                                      .setCloseReadingNotifications(
                                                          value);
                                                })
                                          ]),
                                      Container(
                                          width: double.maxFinite,
                                          margin: EdgeInsets.only(
                                              top: Dimensions.h8,
                                              bottom: Dimensions.h27),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 340,
                                                child: Text(
                                                  "Bu ayar kapalı olduğunda, eşleşmelerin sohbetinizdeki okunma bildirimlerini etkinleştiremez.",
                                                  style: TextStyle(
                                                      color: Color(0xFF7B8491)),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  )),
                              SettingsHeaderText(text: "VERİ KULLANIMI"),
                              Container(
                                  width: double.maxFinite,
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: Color(0xFFC5C5C7)),
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFC5C5C7)))),
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h7,
                                      bottom: Dimensions.h36),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.w11),
                                                child: Center(
                                                  child: Text(
                                                    "Videoları Otomatik Oynat",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    right: Dimensions.w11),
                                                child: Row(
                                                  children: [
                                                    CupertinoSwitch(
                                                        value: settingsPageController
                                                                .playVideosAutomatically ??
                                                            false,
                                                        onChanged: (value) {
                                                          settingsPageController
                                                              .setPlayVideosAutomatically(
                                                                  value);
                                                        })
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )),
                                    ],
                                  )),
                              SettingsHeaderText(text: "ETKİNLİK DURUMU"),
                              Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.h8, bottom: Dimensions.h31),
                                height: Dimensions.h100 + 7,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      height: Dimensions.h50,
                                      padding: EdgeInsets.only(
                                          left: Dimensions.w11,
                                          right: Dimensions.w11),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFC5C5C7)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Şu An Çevrim İçi Durumunu Gizle",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CupertinoSwitch(
                                                  value: settingsPageController
                                                          .hideOnlineStatus ??
                                                      false,
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setHideOnlineStatus(
                                                            value);
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      height: Dimensions.h50,
                                      padding: EdgeInsets.only(
                                          left: Dimensions.w11,
                                          right: Dimensions.w11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "En Son Aktif Olma Durumunu Gizle",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CupertinoSwitch(
                                                  value: settingsPageController
                                                          .hideLastOnlineStatus ??
                                                      false,
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setHideLastOnlineStatus(
                                                            value);
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SettingsHeaderText(text: "WEB PROFİLİ"),
                              Container(
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                    top: Dimensions.h7,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {
                                                changeUsernameDialog();
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Kullanıcı Adı",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    Dimensions
                                                                        .w11),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Hemen Al",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF7B8491),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Icon(Icons
                                                                .chevron_right_rounded)
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h8,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 340,
                                        child: Text(
                                          "Herkese açık Kullanıcı Adı oluştur ve onu paylaş.Dünya genelinde insanların seni Curvy’de görmesini sağla.",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491)),
                                        ),
                                      )
                                    ],
                                  )),
                              SettingsHeaderText(text: "BİLDİRİMLER"),
                              Container(
                                margin: EdgeInsets.only(
                                  top: Dimensions.h8,
                                ),
                                height: Dimensions.h160,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          showEmailNotificationsModal();
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "E-posta",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          showInstantNotificationsModal();
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Anlık Bildirimler",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.w11,
                                          right: Dimensions.w11),
                                      width: double.maxFinite,
                                      height: Dimensions.h50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Curvy Team Tekliflerini Kapat",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CupertinoSwitch(
                                                  value: settingsPageController
                                                          .curvyTeamPromotions ??
                                                      false,
                                                  onChanged: (value) {
                                                    settingsPageController
                                                        .setCurvyTeamPromotions(
                                                            value);
                                                  })
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h8,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 340,
                                        child: Text(
                                          "Uygulamada hangi bildirimleri görmek istediğini seç.",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491)),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h7,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                      Color(0xFFD51CFF),
                                                      Color(0xFF6198EF)
                                                    ])),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Satın Alınanları Geri Yükle",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              Container(
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h7,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {},
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Curvy'i Paylaş",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              SettingsHeaderText(text: "BİZE ULAŞ"),
                              Container(
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h7,
                                      bottom: Dimensions.h27),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {},
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Yardım ve Destek",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right:
                                                                    Dimensions
                                                                        .w11),
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons
                                                                .chevron_right_rounded)
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                              SettingsHeaderText(text: "TOPLULUK"),
                              Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.h8, bottom: Dimensions.h31),
                                height: Dimensions.h160,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Topluluk Kuralları",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Güvenlik İpuçları",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Güvenlik Merkezi",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SettingsHeaderText(text: "GİZLİLİK"),
                              Container(
                                margin: EdgeInsets.only(
                                    top: Dimensions.h8, bottom: Dimensions.h36),
                                height: Dimensions.h160,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Çerez Politikası",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Gizlilik Politikası",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {
                                          showPrivacyPreferencesModal();
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Gizlilik Tercihleri",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SettingsHeaderText(text: "YASAL"),
                              Container(
                                margin: EdgeInsets.only(
                                  top: Dimensions.h8,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                      bottom: BorderSide(
                                          color: Color(0xFFC5C5C7), width: 1),
                                    )),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Lisanslar",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                        width: 340,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Color(0xFFC5C5C7)),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: Colors.white,
                                          shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.zero),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          width: double.maxFinite,
                                          height: Dimensions.h50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Hizmet Koşulları",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: Color(0xFF7B8491),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                  height: Dimensions.h45,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFC5C5C7),
                                              width: 1))),
                                  width: double.maxFinite,
                                  margin: EdgeInsets.only(
                                    top: Dimensions.h36,
                                    bottom: Dimensions.h36,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                padding: EdgeInsets.zero,
                                                backgroundColor: Colors.white,
                                                primary: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              onPressed: () {
                                                settingsPageController.logout();
                                              },
                                              child: Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: Dimensions
                                                                    .w11),
                                                        child: Center(
                                                          child: Text(
                                                            "Çıkış",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ))),
                                    ],
                                  )),
                            ],
                          )),
                      Image.asset("assets/images/settings_logo.png"),
                      Text(
                        "Versiyon 01.00.0",
                        style: TextStyle(color: Color(0xFF7B8491)),
                      ),
                      Container(
                          height: Dimensions.h45,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Color(0xFFC5C5C7), width: 1),
                                  bottom: BorderSide(
                                      color: Color(0xFFC5C5C7), width: 1))),
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                            top: Dimensions.h36,
                            bottom: Dimensions.h36,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero),
                                        padding: EdgeInsets.zero,
                                        backgroundColor: Colors.white,
                                        primary: Colors.black.withOpacity(0.2),
                                      ),
                                      onPressed: () {
                                        Get.to(() =>
                                            DeleteAccountLastChanceScreen());
                                      },
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.w11),
                                                child: Center(
                                                  child: Text(
                                                    "Hesabı Sil",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ))),
                            ],
                          )),
                    ],
                  ),
                ))
            : null,
      );
    });
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  GradientRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting  can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    LinearGradient gradient = LinearGradient(
      colors: [
        Color(0xFFD51CFF),
        Color(0xFF00FFE1),
      ],
    );

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular(trackRect.height / 2 + 1);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
