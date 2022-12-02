import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/delete_account_last_chance.dart';
import 'package:curvy_app/ui/screens/settings_header_text.dart';
import 'package:curvy_app/ui/widgets/main_boost_button.dart';
import 'package:curvy_app/ui/widgets/settings_boost_button.dart';
import 'package:curvy_app/ui/widgets/settings_component_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Get.back();
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
                            margin: EdgeInsets.only(top: Dimensions.h100 / 20),
                            color: Colors.white,
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
                                      height: Dimensions.h45,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Telefon Numarası",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "905365087366",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
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
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
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
                                      height: Dimensions.h45,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Bağlantılı Hesaplar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
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
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
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
                                      height: Dimensions.h45,
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "email@email.com",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
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
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.h100 / 10,
                                bottom: Dimensions.h100 / 4),
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Hesabının güvence altına alınmasına yardımcı olmak için E-postanı doğrula.",
                                    style: TextStyle(
                                        fontSize: Dimensions.h14,
                                        color: Color(0xFFFF0000)),
                                  ),
                                )
                              ],
                            )),
                        SettingsHeaderText(text: "KEŞFET"),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h7),
                          color: Colors.white,
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
                                    height: Dimensions.h7 * 10,
                                    padding:
                                        EdgeInsets.only(top: Dimensions.h17),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Konum",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Şu Anki Konumum",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Muratpaşa, Antalya",
                                                  style: TextStyle(
                                                      color: Color(0xFF7B8491),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: Color(0xFF7B8491),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                  width: 340,
                                  height: 1,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                        data: SliderTheme.of(context).copyWith(
                                            trackShape:
                                                GradientRectSliderTrackShape(),
                                            thumbColor: Colors.white,
                                            thumbShape: RoundSliderThumbShape(
                                                elevation: 2),
                                            inactiveTrackColor:
                                                Color(0xFFC5C5C7),
                                            activeTrackColor:
                                                Color(0xFFC5C5C7)),
                                        child: Slider(
                                          value: 0.1,
                                          onChanged: (value) {},
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
                                            value: true, onChanged: (value) {})
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 340,
                                  height: 1,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                          "22-90+",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491)),
                                        )
                                      ],
                                    ),
                                    SliderTheme(
                                        data: SliderTheme.of(context),
                                        child: RangeSlider(
                                            onChanged: (value) {},
                                            values: RangeValues(0, 1))),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Sadece bu aralıktaki kişileri göster"),
                                        CupertinoSwitch(
                                            value: true, onChanged: (value) {})
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: 340,
                                  height: 1,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                      SettingsComponentHeader(text: "Küresel"),
                                      CupertinoSwitch(
                                          value: false, onChanged: (value) {})
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: Dimensions.h8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Dünyaya açılmak, hem çevrendeki hem de dünyanın dört bir yanındaki insanları görmeni sağlar.",
                                    style: TextStyle(color: Color(0xFF7B8491)),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          padding: EdgeInsets.only(
                              left: Dimensions.w17, right: Dimensions.w17),
                          margin: EdgeInsets.only(top: Dimensions.h14),
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.h52),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                      height: Dimensions.h60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SettingsComponentHeader(
                                                  text: "Dengelenmiş Öneriler"),
                                              Text(
                                                "Sana en uygun insanları gör ( varsayılan ayar )",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491)),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                              "assets/images/settings_tick_icon.png")
                                        ],
                                      ))),
                              SizedBox(
                                  width: 340,
                                  height: 1,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                      height: Dimensions.h60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SettingsComponentHeader(
                                                  text: "Son Zamanda Aktif"),
                                              Text(
                                                "En son aktif olan insanları en önce gör",
                                                style: TextStyle(
                                                    color: Color(0xFF7B8491)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: Dimensions.w17, right: Dimensions.w17),
                          margin: EdgeInsets.only(top: Dimensions.h14),
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.h52),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                      height: Dimensions.h60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    color: Color(0xFF7B8491)),
                                              )
                                            ],
                                          ),
                                          Image.asset(
                                              "assets/images/settings_tick_icon.png")
                                        ],
                                      ))),
                              SizedBox(
                                  width: 340,
                                  height: 1,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                      height: Dimensions.h60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    color: Color(0xFF7B8491)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.h36),
                          padding: EdgeInsets.only(
                            right: Dimensions.w17,
                            left: Dimensions.w17,
                          ),
                          width: double.maxFinite,
                          height: Dimensions.h50,
                          color: Colors.white,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SettingsComponentHeader(
                                    text: "Beni Curvy'de göster"),
                                CupertinoSwitch(
                                    value: false, onChanged: (value) {})
                              ]),
                        ),
                        Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                top: Dimensions.h8, bottom: Dimensions.h27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Kapılıyken, kart destesinde gösterilmeyeceksin. Yine de beğenmiş olduğun kişiler profilini görebilir ve seninle eşleşebilir. Eşleşmelerini görmeye ve onlara sohbet etmeye devam edebilirsin.",
                                    style: TextStyle(color: Color(0xFF7B8491)),
                                  ),
                                )
                              ],
                            )),
                        SettingsHeaderText(text: "CONNECTIONS"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: Dimensions.h7),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Kişileri Engelle",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                        ),
                        Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                top: Dimensions.h8, bottom: Dimensions.h27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Curvy’de görmek veya görünmek istemediğin kişileri,kişiler listesinden seç.",
                                    style: TextStyle(color: Color(0xFF7B8491)),
                                  ),
                                )
                              ],
                            )),
                        SettingsHeaderText(text: "LİSAN SEÇİMİ"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h31),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Türkçe Olarak Seçildi",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Değiştir",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF7B8491),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SettingsHeaderText(text: "VIP PROFİLLER"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h31),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "VIP Profilleri Yönet",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ayarlar",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF7B8491),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SettingsHeaderText(text: "OKUNMA BİLDİRİMLERİ"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: Dimensions.h7),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Okunma Bildirimlerini Yönet",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ayarlar",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF7B8491),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                            right: Dimensions.w17,
                            left: Dimensions.w17,
                          ),
                          width: double.maxFinite,
                          height: Dimensions.h50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SettingsComponentHeader(
                                    text: "Beni CurvyTURBO'da öner"),
                                CupertinoSwitch(
                                    value: false, onChanged: (value) {})
                              ]),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: Dimensions.h50),
                          padding: EdgeInsets.only(
                            right: Dimensions.w17,
                            left: Dimensions.w17,
                          ),
                          width: double.maxFinite,
                          height: Dimensions.h50,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SettingsComponentHeader(
                                    text: "Beni Keşfet'de göster"),
                                CupertinoSwitch(
                                    value: false, onChanged: (value) {})
                              ]),
                        ),
                        SettingsHeaderText(text: "VERİ KULLANIMI"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h36),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Videoları Otomatik Oynat",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                        ),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                          "Şu an çevrim içi",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                          "Son zamanlarda aktif olma durumu",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                        SettingsHeaderText(text: "WEB PROFİLİ"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                            top: Dimensions.h7,
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Kullanıcı Adı",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Hemen Al",
                                          style: TextStyle(
                                              color: Color(0xFF7B8491),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          color: Color(0xFF7B8491),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                top: Dimensions.h8, bottom: Dimensions.h27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Herkese açık Kullanıcı Adı oluştur ve onu paylaş.Dünya genelinde insanların seni Curvy’de görmesini sağla.",
                                    style: TextStyle(color: Color(0xFF7B8491)),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                          "E-posta",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                          "Anlık Bildirimler",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                          "Curvy Team",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                            width: double.maxFinite,
                            margin: EdgeInsets.only(
                                top: Dimensions.h8, bottom: Dimensions.h27),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 340,
                                  child: Text(
                                    "Uygulamada hangi bildirimleri görmek istediğini seç.",
                                    style: TextStyle(color: Color(0xFF7B8491)),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h36),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Satın Alınanları Geri Yükle",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h36),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Curvy'i Paylaş",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        SettingsHeaderText(text: "BİZE ULAŞ"),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h7, bottom: Dimensions.h31),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Yardım ve Destek",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                        ),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                              fontWeight: FontWeight.bold),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                          "Gizlilik Tercihleri",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                    color: Color(0xFF7B8491), width: 1),
                                bottom: BorderSide(
                                    color: Color(0xFF7B8491), width: 1),
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
                                              fontWeight: FontWeight.bold),
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
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
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
                                              fontWeight: FontWeight.bold),
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
                          width: double.maxFinite,
                          margin: EdgeInsets.only(
                              top: Dimensions.h36, bottom: Dimensions.h36),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.zero),
                              ),
                              onPressed: () {},
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.h45,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Çıkış",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )),
                Image.asset("assets/images/settings_logo.png"),
                Text(
                  "Versiyon 01.00.0",
                  style: TextStyle(color: Color(0xFF7B8491)),
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Color(0xFFC5C5C7), width: 1),
                          bottom:
                              BorderSide(color: Color(0xFFC5C5C7), width: 1))),
                  margin: EdgeInsets.only(
                      top: Dimensions.h36, bottom: Dimensions.h36),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: Colors.white,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => DeleteAccountLastChanceScreen());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.h45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hesabı Sil",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}

class GradientRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const GradientRectSliderTrackShape();

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

    LinearGradient gradient = const LinearGradient(
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
