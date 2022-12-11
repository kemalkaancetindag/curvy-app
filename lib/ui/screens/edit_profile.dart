import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/pages/edit_profile_controller.dart';
import 'package:curvy_app/enums/alcohol_enum.dart';
import 'package:curvy_app/enums/animal_enum.dart';
import 'package:curvy_app/enums/enum_enum.dart';
import 'package:curvy_app/enums/personality_enum.dart';
import 'package:curvy_app/enums/profile_update_fields_enum.dart';
import 'package:curvy_app/enums/sex_enum.dart';
import 'package:curvy_app/enums/sexual_preference_enum.dart';
import 'package:curvy_app/enums/smoke_enum.dart';
import 'package:curvy_app/enums/zodiac_enum.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:curvy_app/ui/widgets/edit_profile_image_box.dart';
import 'package:curvy_app/ui/widgets/person_type_dialog_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  

  TextEditingController _aboutFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.find<EditProfileController>().onInit();
    void selectImageModal() {
      showDialog(
          
          context: context,
          builder: (builder) {
            return SimpleDialog(backgroundColor: Colors.transparent, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Dimensions.w270,
                    height: Dimensions.h209,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h22),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () async {
                            await Get.find<EditProfileController>()
                                .pickImage(0);
                            Get.back();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Dimensions.h22),
                                    topRight: Radius.circular(Dimensions.h22)),
                                color: Color(0xFFD446F4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/images/camera_icon.png"),
                                Text(
                                  "Kameranla Çek",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            Get.find<EditProfileController>().pickImage(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(Dimensions.h22),
                                  bottomRight: Radius.circular(Dimensions.h22)),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/images/gallery_icon.png"),
                                Text(
                                  "Galerinden Seç",
                                  style: TextStyle(
                                      fontSize: Dimensions.h21,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ]);
          });
    }

    void showZodiacSelectDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h520,
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
                            "Burç Seçimi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.h36),
                          ),
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.aries.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                      gradient: controller.zodiac ==
                                              Zodiac.aries.value
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                  Colors.white,
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.white
                                                ])
                                          : null),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_1.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "KOÇ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.libra.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.libra.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_2.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "TERAZİ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.taurus.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.taurus.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_3.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "BOĞA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.scorpio.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient: controller.zodiac ==
                                            Zodiac.scorpio.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_4.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "AKREP",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.gemini.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.gemini.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_5.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "İKİZLER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.sagittarius.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient: controller.zodiac ==
                                            Zodiac.sagittarius.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_6.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "YAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.cancer.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.cancer.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_7.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "YENGEÇ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.capricorn.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient: controller.zodiac ==
                                            Zodiac.capricorn.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_8.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "OĞLAK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.setZodiac(Zodiac.leo.value);
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: Dimensions.h300 / 10),
                                    width: Dimensions.w120,
                                    height: Dimensions.h300 / 10,
                                    decoration: BoxDecoration(
                                      gradient:
                                          controller.zodiac == Zodiac.leo.value
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
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: Dimensions.w8),
                                          child: Center(
                                            child: Image.asset(
                                                "assets/images/zodiac_9.png"),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              "ASLAN",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: Dimensions.h14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.aquarius.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient: controller.zodiac ==
                                            Zodiac.aquarius.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_10.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "KOVA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: Dimensions.w254,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.virgo.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.virgo.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_11.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "BAŞAK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setZodiac(Zodiac.pisces.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: Dimensions.h300 / 10),
                                  width: Dimensions.w120,
                                  height: Dimensions.h300 / 10,
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.zodiac == Zodiac.pisces.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: Dimensions.w8),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/images/zodiac_12.png"),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            "BALIK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Dimensions.h14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2,
                        width: Dimensions.w254,
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
                                controller.modalUpdateHandler(
                                    false, null, null);
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
                                controller.modalUpdateHandler(
                                    true,
                                    ProfileUpdateFields.zodiac.value,
                                    controller.zodiac);
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

    void showPersontypeDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
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
                            margin: EdgeInsets.only(top: Dimensions.h27),
                            child: Center(
                              child: Text(
                                "KİŞİLİK TİPİN NEDİR?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.h100 / 5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: Dimensions.h16 / 2,
                                top: Dimensions.h16),
                            child: Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17,
                                          bottom: Dimensions.h90 / 5),
                                      child: Column(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 3,
                                            child: Text(
                                              "ANALİZCİLER ",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h50),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        PersonTypeDialogButton(
                                          text: "INTJ-A",
                                          isSelected: controller.personality ==
                                              Personality.analysisINTJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisINTJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTJ-T",
                                          isSelected: controller.personality ==
                                              Personality.analysisINTJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisINTJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTP-A",
                                          isSelected: controller.personality ==
                                              Personality.analysisINTPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisINTPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTP-T",
                                          isSelected: controller.personality ==
                                              Personality.analysisINTPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisINTPT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTJ-A",
                                          isSelected: controller.personality ==
                                              Personality.analysisENTJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisENTJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTJ-T",
                                          isSelected: controller.personality ==
                                              Personality.analysisENTJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisENTJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTP-A",
                                          isSelected: controller.personality ==
                                              Personality.analysisENTPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisENTPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTP-T",
                                          isSelected: controller.personality ==
                                              Personality.analysisENTPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.analysisENTPT.value,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.h90 / 5),
                                        child: Column(
                                          children: [
                                            RotatedBox(
                                              quarterTurns: 3,
                                              child: Text(
                                                "DİPLOMATLAR ",
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: Dimensions.h50),
                                              ),
                                            )
                                          ],
                                        )),
                                    Column(
                                      children: [
                                        PersonTypeDialogButton(
                                          text: "INFJ-A",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticINFJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticINFJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFJ-T",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticINFJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticINFJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFP-A",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticINFPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticINFPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFP-T",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticINFPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticINFPT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFJ-A",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticENFJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticENFJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFJ-T",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticENFJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticENFJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFP-A",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticENFPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticENFPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFP-T",
                                          isSelected: controller.personality ==
                                              Personality.diplomaticENFPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.diplomaticENFPT.value,
                                        )
                                      ],
                                    )
                                  ],
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
                                bottom: Dimensions.h16 / 2,
                                top: Dimensions.h16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: Dimensions.w17,
                                          left: Dimensions.w17,
                                          bottom: Dimensions.h90 / 5),
                                      child: Column(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 3,
                                            child: Text(
                                              "GÖZCÜLER",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h50),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        PersonTypeDialogButton(
                                          text: "INTJ-A",
                                          isSelected: controller.personality ==
                                              Personality.scoutINTJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutINTJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTJ-T",
                                          isSelected: controller.personality ==
                                              Personality.scoutINTJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutINTJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTP-A",
                                          isSelected: controller.personality ==
                                              Personality.scoutINTPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutINTPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INTP-T",
                                          isSelected: controller.personality ==
                                              Personality.scoutINTPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutINTPT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTJ-A",
                                          isSelected: controller.personality ==
                                              Personality.scoutENTJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutENTJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTJ-T",
                                          isSelected: controller.personality ==
                                              Personality.scoutENTJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutENTJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTP-A",
                                          isSelected: controller.personality ==
                                              Personality.scoutENTPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutENTPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENTP-T",
                                          isSelected: controller.personality ==
                                              Personality.scoutENTPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.scoutENTPT.value,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.h90 / 5),
                                      child: Column(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 3,
                                            child: Text(
                                              "KAŞİFLER ",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimensions.h50),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        PersonTypeDialogButton(
                                          text: "INFJ-A",
                                          isSelected: controller.personality ==
                                              Personality.explorerINFJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerINFJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFJ-T",
                                          isSelected: controller.personality ==
                                              Personality.explorerINFJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerINFJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFP-A",
                                          isSelected: controller.personality ==
                                              Personality.explorerINFPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerINFPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "INFP-T",
                                          isSelected: controller.personality ==
                                              Personality.explorerINFPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerINFPT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFJ-A",
                                          isSelected: controller.personality ==
                                              Personality.explorerENFJA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerENFJA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFJ-T",
                                          isSelected: controller.personality ==
                                              Personality.explorerENFJT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerENFJT.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFP-A",
                                          isSelected: controller.personality ==
                                              Personality.explorerENFPA.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerENFPA.value,
                                        ),
                                        PersonTypeDialogButton(
                                          text: "ENFP-T",
                                          isSelected: controller.personality ==
                                              Personality.explorerENFPT.value,
                                          select: controller.setPersonality,
                                          personalityType:
                                              Personality.explorerENFPT.value,
                                        )
                                      ],
                                    )
                                  ],
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
                            width: Dimensions.w99,
                            margin: EdgeInsets.only(
                                top: Dimensions.h100 / 5,
                                bottom: Dimensions.h100 / 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.modalUpdateHandler(
                                        false, null, null);
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
                                      controller.modalUpdateHandler(
                                          true,
                                          ProfileUpdateFields.personType.value,
                                          controller.personality);
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_check.png"),
                                      ),
                                    )),
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

    void showPetDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h40 * 10 + Dimensions.h60,
                  width: Dimensions.w300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h27, bottom: Dimensions.h100 / 10),
                        child: Center(
                            child: Text(
                          "EVCİL HAYVAN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h100 / 5),
                        )),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.dog.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                      gradient:
                                          controller.pet == Animal.dog.value
                                              ? LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                      Colors.white,
                                                      Colors.transparent,
                                                      Colors.transparent,
                                                      Colors.white
                                                    ])
                                              : null),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Köpek",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.cat.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.pet == Animal.cat.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Kedi",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.bird.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.bird.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Kuş",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.fish.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.fish.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Balık",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.reptile.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.reptile.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Sürüngen",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.amphibic.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.amphibic.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Amfibik",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller
                                    .setPet(Animal.dontHaveButLikes.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.pet ==
                                            Animal.dontHaveButLikes.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Hayvanım yok ama çok severim",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.wants.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.wants.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Hayvan istiyorum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.allergic.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.allergic.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Hayvanlara alerjim var",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.setPet(Animal.allPets.value);
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.w2 * 10,
                                        right: Dimensions.w9),
                                    decoration: BoxDecoration(
                                      gradient:
                                          controller.pet == Animal.allPets.value
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
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(Dimensions.h100 / 10),
                                      child: Center(
                                        child: Text(
                                          "Tüm evcil hayvanlar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 10,
                            bottom: Dimensions.h100 / 10),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.dontLike.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.dontLike.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Hoşlanmam",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setPet(Animal.afraid.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.pet == Animal.afraid.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Korkarım",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
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
                        width: Dimensions.w99,
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 5,
                            bottom: Dimensions.h100 / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.modalUpdateHandler(
                                    false, null, null);
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
                                controller.modalUpdateHandler(
                                    true,
                                    ProfileUpdateFields.petPreference.value,
                                    controller.pet);
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

    void showSmokePreferenceDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h300,
                  width: Dimensions.w300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h27, bottom: Dimensions.h100 / 10),
                        child: Center(
                            child: Text(
                          "SİGARA KULLANIMI",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h100 / 5),
                        )),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSmoke(Smoke.withDrink.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                      gradient: controller.smoke ==
                                              Smoke.withDrink.value
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                  Colors.white,
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.white
                                                ])
                                          : null),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "İçkiyle birlikte",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setSmoke(Smoke.socialSmoker.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.smoke ==
                                            Smoke.socialSmoker.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Sosyal içici",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSmoke(Smoke.nonSmoker.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.smoke ==
                                            Smoke.nonSmoker.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Kullanmıyorum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setSmoke(Smoke.smoker.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.smoke == Smoke.smoker.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Sigara kullanan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                          bottom: Dimensions.h100 / 5,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSmoke(Smoke.tryingQuit.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.smoke ==
                                            Smoke.tryingQuit.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Bırakmaya çalışıyorum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
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
                        width: Dimensions.w99,
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 5,
                            bottom: Dimensions.h100 / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.modalUpdateHandler(
                                    false, null, null);
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
                                controller.modalUpdateHandler(
                                    true,
                                    ProfileUpdateFields.smokePreference.value,
                                    controller.smoke);
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_check.png"),
                                ),
                              ),
                            ),
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

    void showAlcoholPreferenceDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h31 * 11.5,
                  width: Dimensions.w300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h27, bottom: Dimensions.h100 / 10),
                        child: Center(
                            child: Text(
                          "ALKOL KULLANIMI",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h100 / 5),
                        )),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.notForMe.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                      gradient: controller.alcohol ==
                                              Alcohol.notForMe.value
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                  Colors.white,
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.white
                                                ])
                                          : null),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Bana göre değil",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.rarely.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.rarely.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Nadiren",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.notUsing.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.notUsing.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "İçmiyorum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller
                                    .setAlcohol(Alcohol.specialOccasions.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.specialOccasions.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Özel günlerde",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.h100 / 5),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.mostNights.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.mostNights.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Çoğu gece",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.notTried.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.notTried.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Denemedim bile",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                          bottom: Dimensions.h100 / 5,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setAlcohol(Alcohol.weekEnds.value);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w2 * 10,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                    gradient: controller.alcohol ==
                                            Alcohol.weekEnds.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Hafta sonları sosyalleşirken",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
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
                        width: Dimensions.w99,
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 5,
                            bottom: Dimensions.h100 / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.modalUpdateHandler(
                                    false, null, null);
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
                                controller.modalUpdateHandler(
                                    true,
                                    ProfileUpdateFields.alcholPreference.value,
                                    controller.alcohol);
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_check.png"),
                                ),
                              ),
                            ),
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

    void showSexDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                  height: Dimensions.h12 * 18,
                  width: Dimensions.w300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h16),
                      gradient: LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h27, bottom: Dimensions.h100 / 10),
                        child: Center(
                            child: Text(
                          "CİNSİYET SEÇİMİ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.h100 / 5),
                        )),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSex(Sex.women.value);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h300 / 10),
                                      gradient: controller.sex == Sex.women.value
                                          ? LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                  Colors.white,
                                                  Colors.transparent,
                                                  Colors.transparent,
                                                  Colors.white
                                                ])
                                          : null),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Kadın",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setSex(Sex.men.value);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient: controller.sex == Sex.men.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Erkek",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.setSex(Sex.lgbtq.value);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient: controller.sex == Sex.lgbtq.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "LGBTQ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 5,
                            bottom: Dimensions.h100 / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.setSex(Sex.notMention.value);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    gradient:
                                        controller.sex == Sex.notMention.value
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Belirtmek istemiyorum",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
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
                        width: Dimensions.w99,
                        margin: EdgeInsets.only(
                            top: Dimensions.h100 / 5,
                            bottom: Dimensions.h100 / 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.modalUpdateHandler(
                                    false, null, null);
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
                                  controller.modalUpdateHandler(
                                      true,
                                      ProfileUpdateFields.sex.value,
                                      controller.sex);
                                },
                                child: Container(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/settings_modal_check.png"),
                                  ),
                                ))
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

    void showSexualPreferenceDialog() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return GetBuilder<EditProfileController>(builder: (controller) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                ),
                child: Container(
                    height: Dimensions.h520,
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
                                top: Dimensions.h27,
                                bottom: Dimensions.h100 / 10),
                            child: Center(
                                child: Text(
                              "CİNSEL YÖNELİM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h100 / 5),
                            )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.heteroSexual.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                    gradient: controller.sexualPreferences!
                                            .contains(SexualPreference
                                                .heteroSexual.value)
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                Colors.white,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.white
                                              ])
                                        : null),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Heteroseksüel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.gey.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(SexualPreference.gey.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Gey",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.lesbian.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(
                                              SexualPreference.lesbian.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Lezbiyen",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                              onTap: () {
                                controller.setSexualPreferences(
                                    SexualPreference.bisexual.value);
                              },
                              child: Container(
                                  width: Dimensions.w226 + Dimensions.w22,
                                  decoration: BoxDecoration(
                                    gradient: controller.sexualPreferences!
                                            .contains(
                                                SexualPreference.bisexual.value)
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
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h300 / 10),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(Dimensions.h100 / 10),
                                    child: Center(
                                      child: Text(
                                        "Biseksüel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ))),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.asexual.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(
                                              SexualPreference.asexual.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Aseksüel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.demisexual.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(
                                              SexualPreference.demisexual.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Demiseksüel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.pansexual.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(
                                              SexualPreference.pansexual.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Panseksüel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.homosexual.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(
                                              SexualPreference.homosexual.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Homoseksüel",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.questioning.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(SexualPreference
                                              .questioning.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Sorguluyor",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setSexualPreferences(
                                  SexualPreference.dontMention.value);
                            },
                            child: Container(
                                width: Dimensions.w226 + Dimensions.w22,
                                decoration: BoxDecoration(
                                  gradient: controller.sexualPreferences!
                                          .contains(SexualPreference
                                              .dontMention.value)
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
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(Dimensions.h100 / 10),
                                  child: Center(
                                    child: Text(
                                      "Belirtmek istemiyorum",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 1,
                            width: Dimensions.w270,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Container(
                            width: Dimensions.w99,
                            margin: EdgeInsets.only(
                                top: Dimensions.h100 / 5,
                                bottom: Dimensions.h100 / 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.modalUpdateHandler(
                                        false, null, null);
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
                                      controller.modalUpdateHandler(
                                          true,
                                          ProfileUpdateFields
                                              .sexualPreference.value,
                                          controller.sexualPreferences);
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Image.asset(
                                            "assets/images/settings_modal_check.png"),
                                      ),
                                    ))
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Düzenle",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.find<EditProfileController>().updateEditFields();
                },
                child: Text(
                  "Tamam",
                  style: TextStyle(
                      color: Color(0xFF7B8491), fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: GetBuilder<EditProfileController>(builder: (editPageController) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<EditProfileController>(builder: (controller) {
                    return Container(
                        margin: EdgeInsets.only(top: Dimensions.h50),
                        padding: EdgeInsets.only(
                            left: Dimensions.w200 / 10,
                            right: Dimensions.w200 / 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                editPageController.setCurrentImageIndex(0);
                                selectImageModal();
                              },
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  strokeWidth: 2,
                                  radius: Radius.circular(Dimensions.h16 / 2),
                                  color: Color(0xFFD2D3D4),
                                  child: ClipRRect(
                                    clipBehavior: Clip.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.h8)),
                                    child: EditPorfileImageBox(
                                        image: controller.images!.length < 1
                                            ? null
                                            : controller.images![0]),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                editPageController.setCurrentImageIndex(1);
                                selectImageModal();
                              },
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  strokeWidth: 2,
                                  radius: Radius.circular(Dimensions.h16 / 2),
                                  color: Color(0xFFD2D3D4),
                                  child: ClipRRect(
                                    clipBehavior: Clip.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.h8)),
                                    child: EditPorfileImageBox(
                                        image: controller.images!.length < 2
                                            ? null
                                            : controller.images![1]),
                                  )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  editPageController.setCurrentImageIndex(2);
                                  selectImageModal();
                                },
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    strokeWidth: 2,
                                    radius: Radius.circular(Dimensions.h16 / 2),
                                    color: Color(0xFFD2D3D4),
                                    child: ClipRRect(
                                      clipBehavior: Clip.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.h8)),
                                      child: EditPorfileImageBox(
                                          image: controller.images!.length < 3
                                              ? null
                                              : controller.images![2]),
                                    ))),
                          ],
                        ));
                  }),
                  GetBuilder<EditProfileController>(builder: (controller) {
                    return Container(
                        margin: EdgeInsets.only(top: Dimensions.h300 / 15),
                        padding: EdgeInsets.only(
                            left: Dimensions.w200 / 10,
                            right: Dimensions.w200 / 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                               onTap: () {
                                  editPageController.setCurrentImageIndex(3);
                                  selectImageModal();
                                },
                              child:   DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 4
                                          ? null
                                          : controller.images![3]),
                                )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  editPageController.setCurrentImageIndex(4);
                                  selectImageModal();
                                },
                              child:    
                            DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 5
                                          ? null
                                          : controller.images![4]),
                                )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  editPageController.setCurrentImageIndex(5);
                                  selectImageModal();
                                },
                              child:  DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 6
                                          ? null
                                          : controller.images![5]),
                                ))
                            ),
                       
                           
                          ],
                        ));
                  }),
                  GetBuilder<EditProfileController>(builder: (controller) {
                    return Container(
                        margin: EdgeInsets.only(top: Dimensions.h300 / 15),
                        padding: EdgeInsets.only(
                            left: Dimensions.w200 / 10,
                            right: Dimensions.w200 / 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  editPageController.setCurrentImageIndex(6);
                                  selectImageModal();
                                },
                              child:  DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 7
                                          ? null
                                          : controller.images![6]),
                                )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  editPageController.setCurrentImageIndex(7);
                                  selectImageModal();
                                },
                              child:  DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 8
                                          ? null
                                          : controller.images![7]),
                                )),
                            ),
                            GestureDetector(
                               onTap: () {
                                  editPageController.setCurrentImageIndex(8);
                                  selectImageModal();
                                },
                              child:     DottedBorder(
                                borderType: BorderType.RRect,
                                strokeWidth: 2,
                                radius: Radius.circular(Dimensions.h16 / 2),
                                color: Color(0xFFD2D3D4),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: EditPorfileImageBox(
                                      image: controller.images!.length < 9
                                          ? null
                                          : controller.images![8]),
                                )),
                            ),
                           
                           
                        
                          ],
                        ));
                  }),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h31),
                    width: Dimensions.w325,
                    child: Center(
                      child: Text(
                        "Daha fazla fotoğraf ekleyerek profilinin tamamlanmasına %4 katkı sağlayabilir bu sayede daha fazla beğeni alabilirsin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF7B8491),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "HAKKIMDA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC5C5C7)),
                            top: BorderSide(color: Color(0xFFC5C5C7)))),
                    child: TextField(
                      controller: editPageController.aboutFieldController,
                      onChanged: (value) {
                        editPageController.aboutFieldController.text = value;
                        editPageController.aboutFieldController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: editPageController
                                    .aboutFieldController.text.length));
                      },
                      maxLines: 5,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.w300 / 20,
                            right: Dimensions.w300 / 20,
                            top: Dimensions.h12,
                            bottom: Dimensions.h12),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "İLGİ ALANLARIM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC5C5C7)),
                            top: BorderSide(color: Color(0xFFC5C5C7)))),
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    child: TextField(
                      maxLines: 3,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.w300 / 20,
                            right: Dimensions.w300 / 20,
                            top: Dimensions.h12,
                            bottom: Dimensions.h12),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "YAŞAM TARZI",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.h209,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFC5C5C7), width: 1),
                            top: BorderSide(
                                color: Color(0xFFC5C5C7), width: 1))),
                    child: Column(
                      children: [
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showZodiacSelectDialog();
                                },
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
                                              "Burç",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Text(
                                                editPageController.zodiac !=
                                                        null
                                                    ? Utils.getEnumValue(
                                                        Enums.zodiac,
                                                        editPageController
                                                            .zodiac!)
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showPersontypeDialog();
                                },
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
                                              "Kişilik Tipi",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Text(
                                                editPageController
                                                            .personality !=
                                                        null
                                                    ? Utils.getEnumValue(
                                                        Enums.personality,
                                                        editPageController
                                                            .personality!)
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showPetDialog();
                                },
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
                                              "Evcil Hayvan",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Text(
                                                editPageController.pet != null
                                                    ? Utils.getEnumValue(
                                                        Enums.animal,
                                                        editPageController.pet!)
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showSmokePreferenceDialog();
                                },
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
                                              "Sigara Kullanımı",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Text(
                                                editPageController.smoke != null
                                                    ? Utils.getEnumValue(
                                                        Enums.smoke,
                                                        editPageController
                                                            .smoke!)
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showAlcoholPreferenceDialog();
                                },
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
                                              "Alkol Kullanımı",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Text(
                                                editPageController.alcohol !=
                                                        null
                                                    ? Utils.getEnumValue(
                                                        Enums.alcohol,
                                                        editPageController
                                                            .alcohol!)
                                                    : "",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "MESLEĞİM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC5C5C7)),
                            top: BorderSide(color: Color(0xFFC5C5C7)))),
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    child: TextField(
                      controller: editPageController.jobFieldController,
                      onChanged: (value) {
                        editPageController.jobFieldController.text = value;
                        editPageController.jobFieldController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: editPageController
                                    .jobFieldController.text.length));
                      },
                      maxLines: 3,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.w300 / 20,
                            right: Dimensions.w300 / 20,
                            top: Dimensions.h12,
                            bottom: Dimensions.h12),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "MEZUNİYETİM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC5C5C7)),
                            top: BorderSide(color: Color(0xFFC5C5C7)))),
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    child: TextField(
                      controller: editPageController.graduationFieldController,
                      onChanged: (value) {
                        editPageController.graduationFieldController.text =
                            value;
                        editPageController.graduationFieldController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: editPageController
                                    .graduationFieldController.text.length));
                      },
                      maxLines: 3,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.w300 / 20,
                            right: Dimensions.w300 / 20,
                            top: Dimensions.h12,
                            bottom: Dimensions.h12),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "YAŞADIĞIN ŞEHİR",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFC5C5C7)),
                            top: BorderSide(color: Color(0xFFC5C5C7)))),
                    child: TextField(
                      maxLines: 3,
                      controller: editPageController.cityFieldController,
                      onChanged: (value) {
                        editPageController.cityFieldController.text = value;
                        editPageController.cityFieldController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: editPageController
                                    .cityFieldController.text.length));
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: Dimensions.w300 / 20,
                            right: Dimensions.w300 / 20,
                            top: Dimensions.h12,
                            bottom: Dimensions.h12),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h31),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "CİNSİYET",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.h45,
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFC5C5C7), width: 1),
                            top: BorderSide(
                                color: Color(0xFFC5C5C7), width: 1))),
                    child: Column(
                      children: [
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showSexDialog();
                                },
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
                                              Utils.getEnumValue(Enums.sex, editPageController.sex!),
                                              style: TextStyle(
                                                  color: Color(0xFF7B8491),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h31),
                    padding: EdgeInsets.only(left: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "CİNSEL YÖNELİM",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.h45,
                    margin: EdgeInsets.only(top: Dimensions.h7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFC5C5C7), width: 1),
                            top: BorderSide(
                                color: Color(0xFFC5C5C7), width: 1))),
                    child: Column(
                      children: [
                        Expanded(
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  padding: EdgeInsets.zero,
                                  primary: Colors.black.withOpacity(0.2),
                                ),
                                onPressed: () {
                                  showSexualPreferenceDialog();
                                },
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
                                              Utils.getEnumValue(Enums.sexualPreference, editPageController.sexualPreferences![0]),
                                              style: TextStyle(
                                                  color: Color(0xFF7B8491),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.w11),
                                          child: Row(
                                            children: [
                                              Icon(Icons.chevron_right_rounded)
                                            ],
                                          ))
                                    ],
                                  ),
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h21),
                    padding: EdgeInsets.only(
                        left: Dimensions.w25, right: Dimensions.w25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "PROFİLİNİ KONTROL ET",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: Dimensions.w120,
                          height: Dimensions.h27,
                          decoration: BoxDecoration(
                              color: Color(0xFFF03A00),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h52)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/images/edit_profile_logo.png"),
                              Text(
                                "CurvyPLUS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
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
                        bottom: Dimensions.h90, top: Dimensions.h12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(color: Color(0xFFC5C5C7)),
                            bottom: BorderSide(color: Color(0xFFC5C5C7)))),
                    child: Column(
                      children: [
                        Container(
                          height: Dimensions.h60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Yaşımı Gösterme",
                                style: TextStyle(
                                    color: Color(0xFF7B8491),
                                    fontWeight: FontWeight.bold),
                              ),
                              CupertinoSwitch(
                                  value: editPageController.showAge!,
                                  onChanged: (value) {
                                    editPageController.setShowAge(value);
                                  })
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 340,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                          ),
                        ),
                        Container(
                          height: Dimensions.h60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Mesafemi Gösterme",
                                style: TextStyle(
                                    color: Color(0xFF7B8491),
                                    fontWeight: FontWeight.bold),
                              ),
                              CupertinoSwitch(
                                  value: editPageController.showDistance!,
                                  onChanged: (value) {
                                    editPageController.setShowDistance(value);
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
