import 'dart:io';

import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SetupController extends GetxController {
  String? _phoneNumberAppendix;
  String? _phoneNumber;
  String? _phoneConfirmationCode;
  String? _email;
  String? _name;
  String? _birthdate;
  int _sex = 0;
  bool _showSex = false;
  List<int> _sexPrefenrence = <int>[];
  bool _showSexPreference = false;
  int? _showMe;
  List<int> _interests = <int>[];
  List<String> _images = <String>["","","","","","","","",""];
  int _currentImageIndex = 0;
  String? _validationCodeString;
  String? _birthdateString;
  List<File> _imageFiles = <File>[];


  //TEMP
  List<String> _validationCode = <String>[];
  List<String> _birthdateList = <String>[];
  bool _isAfterSetup = false;
  

  String? get phoneNumberAppendix => _phoneNumberAppendix;
  String? get phoneNumber => _phoneNumber;
  String? get phoneConfirmationCode => _phoneConfirmationCode;
  String? get email => _email;
  String? get name => _name;
  String? get birthdate => _birthdate;
  int get sex => _sex;
  bool get showSex => _showSex;
  List<int> get sexPreference => _sexPrefenrence;
  bool get showSexPreference => _showSexPreference;
  int? get showMe => _showMe;
  List<int> get interests => _interests;
  List<String> get images => _images;
  int get currentImageIndex => _currentImageIndex;
  String? get validationCodeString => _validationCodeString;
  String? get birthdateString => _birthdateString;


  //TEMP
  List<String> get validationCode => _validationCode;
  List<String> get birtdateList => _birthdateList;
  bool get isAfterSetup => _isAfterSetup;
  

  @override
  void onInit() {
    super.onInit();
  }

  void setPhoneNumberAppendix(String? appendix) {
    _phoneNumberAppendix = appendix;
  }

  void addPhoneNumber(String phoneNumber) {
    
    if(phoneNumber == ""){
      Get.snackbar("Hata", "Telefon numarası boş olamaz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    if(_phoneNumberAppendix == null){
     Get.snackbar("Hata", "Alan kodu boş olamaz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _phoneNumber = '$_phoneNumberAppendix$phoneNumber';
    
    

     Get.to(() => ValidationCodeScreen());
    
  }

  void addToValidationCode(String codePiece, int index) {
    if (_validationCode.length < index + 1) {
      _validationCode.add(codePiece);
    } else {
      _validationCode[index] = codePiece;
    }

    
  }

  void createValidationCode() {
    if(_validationCode.length != 6) {
      Get.snackbar("Hata", "Yanlış kod girdiniz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _validationCodeString = _validationCode.join();

     Get.to(() => ValidationMailScreen());
  }

  void addEmail(String email) {
    if(email == ""){
      Get.snackbar("Hata", "E-mail alanı boş olamaz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _email = email;
    Get.to(() => WelcomeScreen());
  }

  void addName(String name) {
     if(name == ""){
      Get.snackbar("Hata", "İsim alanı boş olamaz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _name = name;
    Get.to(() => SetupBirthdateScreen());
  }

  void addToBirthdate(String birthdatePiece, int index) {
    if (_birthdateList.length < index + 1) {
      _birthdateList.add(birthdatePiece);
    } else {
      _birthdateList[index] = birthdatePiece;
    }
  }

  void createBirthdate() {
    
    if(_birthdateList.length != 8){
      Get.snackbar("Hata", "Hatalı doğum tarihi girdiniz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      _birthdateList.removeWhere((element) => element == "/");
      return;
    }
    _birthdateList.insert(2, "/");
    _birthdateList.insert(5, "/");
    
    _birthdateString = _birthdateList.join();
    _birthdateList.removeWhere((element) => element == "/");
    
    Get.to(() => SetupSexScreen());
    

  }

  void setSex(int sex) {
    _sex = sex;
    update();
  }

  void setShowSex(bool showSex) {
    _showSex = showSex;
    update();
  }

  void controlSexPreference(int preference) {
    if (_sexPrefenrence.contains(preference)) {
      _sexPrefenrence.removeWhere((element) => element == preference);
    } else {
      if (_sexPrefenrence.length == 3) {
        _sexPrefenrence.removeAt(_sexPrefenrence.length - 1);
      }
      _sexPrefenrence.add(preference);
    }
    update();
  }

  void setShowSexPreference(bool preference) {
    _showSexPreference = preference;
    update();
  }


  void setShowme(int preference){
      _showMe = preference;
      update();
  } 

  void controlInterests(int interest) {
    if(_interests.contains(interest)) {
      _interests.removeWhere((element) => element == interest);
    }
    else {
      _interests.add(interest);
    }
    update();
  }


  void setCurrentImageIndex(int index) {
    _currentImageIndex = index;
  }

  Future pickImage(int imageSource, int index) async {
    ImagePicker imagePicker = ImagePicker();
    
    switch(imageSource){
      case 0:

          XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
          if(image == null) return;
          _images[index] = image.path;
          break;
      case 1:
          XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
          if(image == null) return;
          _images[index] = image.path;
          break;

    }

    Get.to(() => SetupImageScreen());

  }


  void createImageFiles() {
    _images.removeWhere((element) => element == "");
    if(_images.length == 0){
       Get.snackbar("Hata", "En az bir fotoğraf eklemelisiniz.", backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
       _images = <String>["","","","","","","","",""];
       return;       
    }

    _images.forEach((element) {
      if(element != ""){
        _imageFiles.add(File(element));
      }
      
    });
    _isAfterSetup = true;

    Get.offAll(()=>IndexScreen());
  }

  void setAfterSetup( bool isAfterSetup) {
    _isAfterSetup = isAfterSetup;
  }
}
