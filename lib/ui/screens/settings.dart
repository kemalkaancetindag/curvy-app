import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/buy_plus_premium_controller.dart';
import 'package:curvy_app/enums/enum_enum.dart';
import 'package:curvy_app/enums/language_enum.dart';
import 'package:curvy_app/ui/screens/delete_account_last_chance.dart';
import 'package:curvy_app/ui/screens/settings_header_text.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:curvy_app/ui/widgets/main_boost_button.dart';
import 'package:curvy_app/ui/widgets/settings/basic_inline_button.dart';
import 'package:curvy_app/ui/widgets/settings/basic_inline_switch.dart';
import 'package:curvy_app/ui/widgets/settings/boost_buttons.dart';
import 'package:curvy_app/ui/widgets/settings/column_switch.dart';
import 'package:curvy_app/ui/widgets/settings/curvy_plus_row.dart';
import 'package:curvy_app/ui/widgets/settings/curvy_plus_select.dart';
import 'package:curvy_app/ui/widgets/settings/divider.dart';
import 'package:curvy_app/ui/widgets/settings/info_error_text.dart';
import 'package:curvy_app/ui/widgets/settings/setting_header.dart';
import 'package:curvy_app/ui/widgets/settings/simple_button.dart';
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
import 'dart:math' as math;

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
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  children: [
                    BoostButtons(
                        backgroundGradient: LinearGradient(colors: [
                          Colors.black,
                          Color(0xFF2E2B2B),
                          Colors.black
                        ]),
                        packageName: "CurvyPLATINUM",
                        packageIcon: "assets/images/platinium_logo.png",
                        marginTop: Dimensions.h16),
                    BoostButtons(
                        backgroundGradient: LinearGradient(
                            colors: [Color(0xFFD51CFF), Color(0xFF6198EF)]),
                        packageName: "CurvyPLUS",
                        packageIcon: "assets/images/platinium_logo.png",
                        marginTop: Dimensions.h9),
                    BoostButtons(
                        backgroundGradient: LinearGradient(
                            colors: [Color(0xFFFF0000), Color(0xFF0047FF)]),
                        packageName: "CurvyTURBO",
                        packageIcon: "assets/images/turbo_icon.png",
                        marginTop: Dimensions.h9),
                    BoostButtons(
                        backgroundGradient: LinearGradient(
                            colors: [Color(0xFF0095EC), Color(0xFF47C1B3)]),
                        packageName: "CurvyLIKE",
                        packageIcon: "assets/images/like_icon.png",
                        marginTop: Dimensions.h9),
                    BoostButtons(
                        backgroundGradient: LinearGradient(
                            colors: [Color(0xFFEEB137), Color(0xFFD99000)]),
                        packageName: "CurvyCHIP",
                        packageIcon: "assets/images/chip_icon.png",
                        marginTop: Dimensions.h9)
                  ],
                ),
                SettingHeader(settingName: "HESAP AYARLARI"),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                          bottom:
                              BorderSide(color: Color(0xFFC5C5C7), width: 1))),
                  child: Column(
                    children: [
                      BasicInlineButton(
                        buttonText: "Telefon Numarası",
                        valueText: "+905305303212",
                        isValueTextBold: true,
                        valueTextColor: Colors.black,
                      ),
                      SettingsDivider(),
                      BasicInlineButton(
                        buttonText: "Bağlantılı Hesaplar",
                      ),
                      SettingsDivider(),
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.h50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.w17),
                              child: Text(
                                "E-posta",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.h16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: Dimensions.w17),
                              child: Text(
                                "email@email.com",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.h16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                InfoErrorText(
                  text:
                      "Hesabının güvence altına alınmasına yardımcı olmak için E-postanı doğrula.",
                  textColor: Colors.red,
                ),
                SettingHeader(settingName: "KEŞFET"),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                          bottom:
                              BorderSide(color: Color(0xFFC5C5C7), width: 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.h17),
                        width: double.maxFinite,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.w17, top: Dimensions.h17),
                                child: Text(
                                  "Konum",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.h16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: Dimensions.w17, top: Dimensions.h17),
                                child: Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w11),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "Şu Anki Konumum",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions.h16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: Dimensions.h9 / 2),
                                              child: Text(
                                                "Muratpaşa, Antalya",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontSize: Dimensions.h16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w9),
                                      child: Image.asset(
                                          "assets/images/chevron_right.png"),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      SettingsDivider(),
                      Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimensions.w17),
                        margin: EdgeInsets.only(bottom: Dimensions.h16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.h21,
                                  bottom: Dimensions.h100 / 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Mesafe Tercihi",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.h16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: SliderTheme(
                                  data: SliderThemeData(
                                    inactiveTrackColor: Color(0xFFC5C5C7),
                                    thumbColor: Colors.white,
                                    trackShape: GradientRectSliderTrackShape(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF00FFE1)
                                      ]),
                                    ),
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: 20,
                                    onChanged: (double value) {},
                                  )),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sadece bu aralıktaki kişileri göster",
                                    style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CupertinoSwitch(
                                      value: true, onChanged: (value) {})
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SettingsDivider(),
                      BasicInlineButton(
                        buttonText: "Bana Göster",
                        valueText: "Kadınlar",
                        isValueTextBold: false,
                      ),
                      SettingsDivider(),
                      Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: Dimensions.w17),
                        margin: EdgeInsets.only(bottom: Dimensions.h16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.h21,
                                  bottom: Dimensions.h100 / 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Yaş Tercihi",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Dimensions.h16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "20-60+",
                                    style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: SliderTheme(
                                  data: SliderThemeData(
                                    inactiveTrackColor: Color(0xFFC5C5C7),
                                    thumbColor: Colors.white,
                                    rangeTrackShape:
                                        GradientRectRangeSliderTrackShape(
                                      gradient: LinearGradient(colors: [
                                        Color(0xFFD51CFF),
                                        Color(0xFF00FFE1)
                                      ]),
                                    ),
                                  ),
                                  child: RangeSlider(
                                    min: 0,
                                    max: 1,
                                    values: RangeValues(0.18, 0.5),
                                    onChanged: (value) {},
                                  )),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sadece bu aralıktaki kişileri göster",
                                    style: TextStyle(
                                        color: Color(0xFF7B8491),
                                        fontSize: Dimensions.h16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CupertinoSwitch(
                                      value: true, onChanged: (value) {})
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SettingsDivider(),
                      BasicInlineSwitch(
                        settingName: "Küresel", 
                        switchState: true
                      )
                    ],
                  ),
                )
                ,
                InfoErrorText(text: "Dünyaya açılmak, hem çevrendeki hem de dünyanın dört bir yanındaki insanları görmeni sağlar."),
                CurvyPlusRow(text: "KİMLERİ GÖREBİLDİĞİNİ KONTROL ET"),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      
                      CurvyPlusSelect(
                        text: "Dengelenmiş Öneriler", 
                        selectState: true, 
                        infoText: "Sana en uygun insanları gör ( varsayılan ayar )"
                      ),
                      SettingsDivider(),
                       CurvyPlusSelect(
                        text: "Son Zamanda Aktif", 
                        selectState: false, 
                        infoText: "En son aktif olan insanları en önce gör "
                      )

                  ]
                ),
                ),
                 CurvyPlusRow(text: "SENİ KİMLER GÖREBİLİR KONTROL ET"),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      
                      CurvyPlusSelect(
                        text: "Dengelenmiş Öneriler", 
                        selectState: true, 
                        infoText: "Sana en uygun insanları gör ( varsayılan ayar )"
                      ),
                      SettingsDivider(),
                       CurvyPlusSelect(
                        text: "Sadece Beğendiğim İnsanlar", 
                        selectState: false, 
                        infoText: "Sadece sağa kaydırdıklarım beni görsün"
                      )

                  ]
                ),
                )
                ,
                SettingHeader(settingName: "CONNECTIONS"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(
                        buttonText: "Kişileri Engelle",

                      )
                    ]
                  ),
                ),
                InfoErrorText(text: "Curvy’de görmek veya görünmek istemediğin kişileri, kişiler listesinden seç."),
                SettingHeader(settingName: "LİSAN SEÇİMİ"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(
                        buttonText: "Türkçe Olarak Seçildi",
                        valueText: "Değiştir",
                        isValueTextBold: true,
                      )
                    ],
                  ),
                ),
                SettingHeader(settingName: "GÖRÜNÜRLÜK"),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineSwitch(
                        settingName: "Beni VIP'de Gizle", 
                        switchState: false
                      ),
                      SettingsDivider(isFull: true,),
                        BasicInlineSwitch(
                        settingName: "Beni CurvyTURBO’da Önerme", 
                        switchState: false
                      ),
                      SettingsDivider(isFull: true,),
                       BasicInlineSwitch(
                        settingName: "Beni FreeStyle’da Gizle", 
                        switchState: false
                      ),
                      SettingsDivider(isFull: true,),
                      ColumnSwitch(
                        settingName: "Beni MatcherStyle’de Gizle", 
                        settingInfo: "Kapılıyken, kart destesinde gösterilmeyeceksin. Yine de beğenmiş olduğun kişiler profilini görebilir ve seninle eşleşebilir. Eşleşmelerini görmeye ve onlara sohbet etmeye devam edebilirsin.", 
                        switchState: false
                      )

                    ]
                  ),
                ),
                SettingHeader(settingName: "OKUNMA BİLDİRİMLERİ"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      ColumnSwitch(
                        settingName: "Okunma Bildirimlerini Kapat", 
                        settingInfo: "Bu ayar kapalı olduğunda, eşleşmelerin sohbetinizdeki okunma bildirimlerini etkinleştiremez.", 
                        switchState: false
                      )
                    ],
                  ),
                ),
                SettingHeader(settingName: "VERİ KULLANIMI"),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                     BasicInlineSwitch(
                      settingName: "Videoları Otomatik Oynat", 
                      switchState: true
                    )
                    ],
                  ),
                ),
                 SettingHeader(settingName: "ETKİNLİK DURUMU"),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                     BasicInlineSwitch(
                      settingName: "Şu An Çevrim İçi Durumunu Gizle", 
                      switchState: true
                    ),
                    SettingsDivider(),
                      BasicInlineSwitch(
                      settingName: "En Son Aktif Olma Durumunu Gizle", 
                      switchState: true
                    ),
                    ],
                  ),
                ),
                SettingHeader(settingName: "WEB PROFİLİ"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(
                        valueText: "Hemen Al",
                        buttonText: "Kullanıcı Adı",
                        isValueTextBold: true,
                      )
                    ],
                  ),
                ),
                InfoErrorText(text: "Herkese açık Kullanıcı Adı oluştur ve onu paylaş. Dünya genelinde insanların seni Curvy’de görmesini sağla."),
                SizedBox(height: Dimensions.h40,),
                SettingHeader(settingName: "BİLDİRİMLER"),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(
                        valueText: "Ayarla",
                        buttonText: "E-pasta Bildirimlerini Kapat",
                        isValueTextBold: true,
                      ),
                      SettingsDivider(),
                        BasicInlineButton(
                        valueText: "Ayarla",
                        buttonText: "Anlık Bildirimleri Kapat",
                        isValueTextBold: true,
                      ),
                      SettingsDivider(),
                      BasicInlineSwitch(
                        settingName: "Curvy Team Tekliflerini Kapat", 
                        switchState: false
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.h40,),
                SimpleButton(
                  text: "Satın Alınanları Geri Yükle",
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFD51CFF),
                      Color(0xFF6198EF)
                    ]
                  ),
                ),
                SizedBox(height: Dimensions.h300/10,),
                 SimpleButton(
                  text: "Curvy’i Paylaş ",
             
                ),
                 SettingHeader(settingName: "BİZE ULAŞ"),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(                     
                        buttonText: "Yardım ve Destek",                     
                      ),
                     
                    ],
                  ),
                ),
                 SettingHeader(settingName: "TOPLULUK"),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(                     
                        buttonText: "Topluluk Kuralları",                     
                      ),
                     
                    ],
                  ),
                ),
                   SettingHeader(settingName: "GİZLİLİK"),
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      BasicInlineButton(                     
                        buttonText: "Çerez Politikası",                     
                      ),
                      SettingsDivider(),
                       BasicInlineButton(                     
                        buttonText: "Gizlilik Politikası",                     
                      ),
                      SettingsDivider(),
                        BasicInlineButton(                     
                        buttonText: "Gizlilik Tercihleri",                     
                        valueText: "Ayarla",
                        isValueTextBold: true,
                      ),
                     
                    ],
                  ),
                ),
                SettingHeader(settingName: "YASAL"),
                 Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                      bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1)
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.h50,                        
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.w17),
                              child: Text(
                              "Lisanslar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.h16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            )
                          ]
                        ),
                      ),
                      SettingsDivider(),
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.h50,                        
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.w17),
                              child: Text(
                              "Hizmet Koşulları",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.h16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            )
                          ]
                        ),
                      ),
                     
                    ],
                  ),
                ),

                SizedBox(height: Dimensions.h40,),
                SimpleButton(text: "Çıkış"),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h21),
                  child: Image.asset("assets/images/settings_logo.png"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.h21),
                  child: Text(
                    "Versiyon 09.03.0",
                    style: TextStyle(
                      color: Color(0xFFC5C5C7)
                    ),
                  ),
                ),
                SimpleButton(text: "Hesabı Sil"),
                SizedBox(height: Dimensions.h140,)


                

              ],
            )),
          ));
    });
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const GradientRectSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

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
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0);

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
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor)
        : activeTrackColorTween;
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

class GradientRectRangeSliderTrackShape extends RangeSliderTrackShape {
  const GradientRectRangeSliderTrackShape({
    this.gradient = const LinearGradient(
      colors: [
        Colors.red,
        Colors.yellow,
      ],
    ),
    this.darkenInactive = true,
  });

  final LinearGradient gradient;
  final bool darkenInactive;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    assert(sliderTheme.overlayShape != null,
        'sliderTheme.overlayShape is required');
    assert(
        sliderTheme.trackHeight != null, 'sliderTheme.trackHeight is required');

    final double overlayWidth =
        sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight!;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);

    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackRight = trackLeft + parentBox.size.width - overlayWidth;
    final double trackBottom = trackTop + trackHeight;
    return Rect.fromLTRB(math.min(trackLeft, trackRight), trackTop,
        math.max(trackLeft, trackRight), trackBottom);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset startThumbCenter,
    required Offset endThumbCenter,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null,
        'sliderTheme.disabledActiveTrackColor is required');
    assert(sliderTheme.disabledInactiveTrackColor != null,
        'sliderTheme.disabledInactiveTrackColor is required');
    assert(sliderTheme.activeTrackColor != null,
        'sliderTheme.activeTrackColor is required');
    assert(sliderTheme.inactiveTrackColor != null,
        'sliderTheme.inactiveTrackColor is required');
    assert(sliderTheme.rangeThumbShape != null,
        'sliderTheme.rangeThumbShape iss required');
    assert(
        sliderTheme.trackHeight != null && sliderTheme.trackHeight! > 0,
        'sliderTheme.trackHeight != null and sliderTheme.trackHeight! > 0'
        'are required');

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );
    final ColorTween inactiveTrackColorTween = darkenInactive
        ? ColorTween(
            begin: sliderTheme.disabledInactiveTrackColor,
            end: sliderTheme.inactiveTrackColor,
          )
        : activeTrackColorTween;
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Offset leftThumbOffset;
    final Offset rightThumbOffset;
    switch (textDirection) {
      case TextDirection.ltr:
        leftThumbOffset = startThumbCenter;
        rightThumbOffset = endThumbCenter;
        break;
      case TextDirection.rtl:
        leftThumbOffset = endThumbCenter;
        rightThumbOffset = startThumbCenter;
        break;
    }
    final Size thumbSize =
        sliderTheme.rangeThumbShape!.getPreferredSize(isEnabled, isDiscrete);
    final double thumbRadius = thumbSize.width / 2;
    assert(thumbRadius > 0);

    final Radius trackRadius = Radius.circular(trackRect.height / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        leftThumbOffset.dx,
        trackRect.bottom,
        topLeft: trackRadius,
        bottomLeft: trackRadius,
      ),
      inactivePaint,
    );
    context.canvas.drawRect(
      Rect.fromLTRB(
        leftThumbOffset.dx,
        trackRect.top - (additionalActiveTrackHeight / 2),
        rightThumbOffset.dx,
        trackRect.bottom + (additionalActiveTrackHeight / 2),
      ),
      activePaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        rightThumbOffset.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topRight: trackRadius,
        bottomRight: trackRadius,
      ),
      inactivePaint,
    );
  }
}
