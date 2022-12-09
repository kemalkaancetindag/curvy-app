import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/edit_profile_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());

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
                                .pickImage(0, 1);
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
                            Get.find<EditProfileController>().pickImage(1, 1);
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
          context: context,
          builder: (context) {
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.white
                                      ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                        ],
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                        ],
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                        ],
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                        ],
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
                                    child: Center(
                                      child: Image.asset(
                                          "assets/images/zodiac_9.png"),
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "ARSLAN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                        ],
                      ),
                    ),
                    Container(
                      width: Dimensions.w254,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          Container(
                              margin:
                                  EdgeInsets.only(top: Dimensions.h300 / 10),
                              width: Dimensions.w120,
                              height: Dimensions.h300 / 10,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: Dimensions.w8),
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
                          top: Dimensions.h12 * 2, bottom: Dimensions.h12 * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
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
    }

    void showPersontypeDialog() {
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
                              bottom: Dimensions.h16 / 2, top: Dimensions.h16),
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
                                          text: "INTJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTP-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTP-T", isSelected: false)
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
                                          text: "INFJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFP-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFP-T", isSelected: false)
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
                              bottom: Dimensions.h16 / 2, top: Dimensions.h16),
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
                                          text: "INTJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INTP-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENTP-T", isSelected: false)
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
                                          text: "INFJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "INFP-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFJ-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFJ-T", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFP-A", isSelected: false),
                                      PersonTypeDialogButton(
                                          text: "ENFP-T", isSelected: false)
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
                              Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_cancel.png"),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/settings_modal_check.png"),
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
    }

    void showPetDialog() {
      showDialog(
          context: context,
          builder: (context) {
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
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.white
                                      ])),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Köpek",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Kedi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Kuş",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Balık",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Sürüngen",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Amfibik",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Hayvanım yok ama çok severim",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Hayvan istiyorum",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Hayvanlara alerjim var",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Tüm evcil hayvanlar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.h100 / 10,
                          bottom: Dimensions.h100 / 10),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Hoşlanmam",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Korkarım",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                    Container(
                      width: Dimensions.w99,
                      margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                          bottom: Dimensions.h100 / 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
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
    }

    void showSmokePreferenceDialog() {
      showDialog(
          context: context,
          builder: (context) {
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
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.white
                                      ])),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "İçkiyle birlikte",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Sosyal içici",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.h100 / 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Kullanmıyorum",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Sigara kullanan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
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
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Bırakmaya çalışıyorum",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                    Container(
                      width: Dimensions.w99,
                      margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                          bottom: Dimensions.h100 / 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
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
    }

    void showAlcoholPreferenceDialog() {
      showDialog(
          context: context,
          builder: (context) {
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
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.white
                                      ])),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Bana göre değil",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Nadiren",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.h100 / 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "İçmiyorum",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Özel günlerde",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.h100 / 5),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Çoğu gece",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Denemedim bile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
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
                          Container(
                              margin: EdgeInsets.only(
                                  left: Dimensions.w2 * 10,
                                  right: Dimensions.w9),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Hafta sonları sosyalleşirken",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                    Container(
                      width: Dimensions.w99,
                      margin: EdgeInsets.only(
                          top: Dimensions.h100 / 5,
                          bottom: Dimensions.h100 / 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
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
    }

    void showSexDialog() {
      showDialog(
          context: context,
          builder: (context) {
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
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.h300 / 10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.white
                                      ])),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Erkek",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "Kadın",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(Dimensions.h100 / 10),
                                child: Center(
                                  child: Text(
                                    "LGBTQ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
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
                          Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
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
    }

    void showSexualPreferenceDialog() {
      showDialog(
          context: context,
          builder: (context) {
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
                          top: Dimensions.h27, bottom: Dimensions.h100 / 10),
                      child: Center(
                          child: Text(
                        "CİNSEL YÖNELİM",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.h100 / 5),
                      )),
                    ),
                    Container(
                      width: Dimensions.w226+Dimensions.w22,
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
                          ),
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.h100 / 10),
                          child: Center(
                            child: Text(
                              "Biseksüel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                      width: Dimensions.w226+Dimensions.w22,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.h300 / 10),
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
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_cancel.png"),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Image.asset(
                                  "assets/images/settings_modal_check.png"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                )
              ),
            );
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
              onPressed: () {},
              child: Text(
                "Tamam",
                style: TextStyle(
                    color: Color(0xFF7B8491), fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Container(
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
                                    image: controller.images.length < 1
                                        ? null
                                        : controller.images[0]),
                              )),
                        ),
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
                                  image: controller.images.length < 2
                                      ? null
                                      : controller.images[1]),
                            )),
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
                                  image: controller.images.length < 3
                                      ? null
                                      : controller.images[2]),
                            ))
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
                                  image: controller.images.length < 4
                                      ? null
                                      : controller.images[3]),
                            )),
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
                                  image: controller.images.length < 5
                                      ? null
                                      : controller.images[4]),
                            )),
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
                                  image: controller.images.length < 6
                                      ? null
                                      : controller.images[5]),
                            ))
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
                                  image: controller.images.length < 7
                                      ? null
                                      : controller.images[6]),
                            )),
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
                                  image: controller.images.length < 8
                                      ? null
                                      : controller.images[7]),
                            )),
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
                                  image: controller.images.length < 9
                                      ? null
                                      : controller.images[8]),
                            ))
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
                        color: Color(0xFF7B8491), fontWeight: FontWeight.bold),
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
                        bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                        top: BorderSide(color: Color(0xFFC5C5C7), width: 1))),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
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
                                            "Balık",
                                            style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontWeight: FontWeight.bold),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
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
                                            "INTP",
                                            style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontWeight: FontWeight.bold),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
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
                                            "Hoşlanmam",
                                            style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontWeight: FontWeight.bold),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
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
                                            "Sigara Kullanan",
                                            style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontWeight: FontWeight.bold),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
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
                                            "Özel Günlerde",
                                            style: TextStyle(
                                                color: Color(0xFF7B8491),
                                                fontWeight: FontWeight.bold),
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
                        bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                        top: BorderSide(color: Color(0xFFC5C5C7), width: 1))),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
                                      child: Center(
                                        child: Text(
                                          "Erkek",
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
                        bottom: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                        top: BorderSide(color: Color(0xFFC5C5C7), width: 1))),
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
                                      padding:
                                          EdgeInsets.only(left: Dimensions.w11),
                                      child: Center(
                                        child: Text(
                                          "Heteroseksüel, Sorguluyor",
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
                          borderRadius: BorderRadius.circular(Dimensions.h52)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/edit_profile_logo.png"),
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
                          CupertinoSwitch(value: true, onChanged: (value) {})
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
                          CupertinoSwitch(value: true, onChanged: (value) {})
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
