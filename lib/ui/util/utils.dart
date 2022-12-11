 import 'package:curvy_app/enums/enum_enum.dart';

class Utils {
  static String getMimetype(String fileName) {
    return fileName.split('/').last.split('.').last;
  }

  static String getEnumValue(String enumType, int value){
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

    List<String> sex = [
      "Erkek",
      "Kadın",
      "LGBTQ",
      "Belirtmek istemiyorum"
    ];

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
    switch(enumType){
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
      
        

    }

    return "";
  }
 }