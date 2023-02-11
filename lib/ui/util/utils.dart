import 'package:curvy_app/enums/enum_enum.dart';
import 'package:curvy_app/enums/settings_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String getMimetype(String fileName) {
    return fileName.split('/').last.split('.').last;
  }

  static String getEnumValue(String enumType, int value) {
    List<String> zodiacs = [
      "Koç",
      "Boğa",
      "İkizler",
      "Yengeç",
      "Kova",
      "Aslan",
      "Başak",
      "Terazi",
      "Akrep",
      "Yay",
      "Oğlak",
      "Balık"
    ];

    List<String> personalities = [
      "INTJ-A",
      "INTJ-T",
      "INTP-A",
      "INTP-T",
      "ENTJ-A",
      "ENTJ-T",
      "ENTP-A",
      "ENTP-T",
      "INFJ-A",
      "INFJ-T",
      "INFP-A",
      "INFP-T",
      "ENFJ-A",
      "ENFJ-T",
      "ENFP-A",
      "ENFP-T",
      "INTJ-A",
      "INTJ-T",
      "INTP-A",
      "INTP-T",
      "ENTJ-A",
      "ENTJ-T",
      "ENTP-A",
      "ENTP-T",
      "INFJ-A",
      "INFJ-T",
      "INFP-A",
      "INFP-T",
      "ENFJ-A",
      "ENFJ-T",
      "ENFP-A",
      "ENFP-T",
    ];

    List<String> pets = [
      "Köpek",
      "Kedi",
      "Kuş",
      "Balık",
      "Sürüngen",
      "Amfibik",
      "Hayvanım yok ama çok severim",
      "Hayvan istiyorum",
      "Hayvanlara alerjim var",
      "Tüm evcil hayvanlar",
      "Hoşlanmam",
      "Korkarım"
    ];

    List<String> smoke = [
      "İçkiyle birlikte",
      "Sosyal içici",
      "Kullanmıyorum",
      "Sigara kullanan",
      "Bırakmaya çalışıyorum"
    ];

    List<String> alcohol = [
      "Bana göre değil",
      "Nadiren",
      "İçmiyorum",
      "Özel günlerde",
      "Çoğu gece",
      "Denemedim bile",
      "Hafta sonları sosyalleşirken"
    ];

    List<String> sex = ["Erkek", "Kadın", "LGBTQ", "Belirtmek istemiyorum"];

    List<String> sexualPreferences = [
      "Heteroseksüel",
      "Gey",
      "Lezbiyen",
      "Biseksüel",
      "Aseksüel",
      "Demiseksüel",
      "Panseksüel",
      "Homoseksüel",
      "Sorguluyor",
      "Belirtmek istemiyorum"
    ];

    List<String> showme = ["Kadın", "Erkek", "Hepsi"];

    List<String> language = [
      "Almanca",
      "Arapça",
      "Endonezce",
      "Fransızca",
      "Hintçe",
      "İngilizce",
      "İspanyolca",
      "İtalyanca",
      "Rusça",
      "Türkçe"
    ];

    switch (enumType) {
      case Enums.zodiac:
        return zodiacs[value];
      case Enums.personality:
        return personalities[value];
      case Enums.animal:
        return pets[value];
      case Enums.smoke:
        return smoke[value];
      case Enums.alcohol:
        return alcohol[value];
      case Enums.sex:
        return sex[value];
      case Enums.sexualPreference:
        return sexualPreferences[value];
      case Enums.showme:
        return showme[value];
      case Enums.language:
        return language[value];
    }

    return "";
  }

  static dynamic getNestedMapData(String keys, Map<String, dynamic> data) {
    List<String> keyList = keys.split(".");
    String wantedKey = keyList.last;
    keyList = keyList.sublist(0, keyList.length - 1);
    if (keys == Settings.privacyPreferencesMarketingAppFlayer.value) {
      print(keyList);
      print(wantedKey);
    }

    dynamic wantedData;

    for (int i = 0; i < keyList.length; i++) {
      if (keys == Settings.privacyPreferencesMarketingAppFlayer.value) {
        print(keyList[i]);
      }

      var tempMap = (data[keyList[i]] as Map<String, dynamic>);
      if (keys == Settings.privacyPreferencesMarketingAppFlayer.value) {}

      if (i == keyList.length - 1) {
        wantedData = tempMap[wantedKey];
      }
    }

    return wantedData;
  }

  static Future handleError(Function func)  async {
    try{      
      await func();
    }
    catch(e) {
      Get.snackbar(
        "Hata", 
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Color(0xFFD51CFF)
      );      
    }
  }

  static Future handleNULL(dynamic result, String location) async {    
    if(result == null) {
       Get.snackbar(
        location, 
        "NULL",
        colorText: Colors.white,
        backgroundColor: Color(0xFFD51CFF)
      );      
    }
    else{
       Get.snackbar(
        location, 
        "NOT NULL",
        colorText: Colors.white,
        backgroundColor: Color(0xFFD51CFF)
      );      
    }
  }

  static String chars = "0123456789bcdefghjkmnpqrstuvwxyz";
  static int BITS_PER_BASE32_CHAR = 5;


static String encode(double longitude, double latitude, int precision) {
  String geocode = "";
  List<double> longitude_range = [-180, 180];
  List<double> latitude_range = [-90, 90];

  // go through each character for precision
  for (int i = 0; i < precision; i++) {
    int hash = 0;

    // generate a base32 char
    for (int j = 0; j < BITS_PER_BASE32_CHAR; j++) {
      bool isEvenBit = ((i * BITS_PER_BASE32_CHAR) + j) % 2 == 0;
      double val = isEvenBit ? longitude : latitude;
      List<double> range = isEvenBit ? longitude_range : latitude_range;
      double mid = (range[0] + range[1]) / 2;

      if (val > mid) {
        hash = (hash << 1) + 1;
        range[0] = mid;
      } else {
        hash = hash << 1;
        range[1] = mid;
      }
    }

    geocode += base32Char(hash);
  }

  return geocode;
}




static  String base32Char(int value) {
  return chars.substring(value, value + 1);
}



 
}
