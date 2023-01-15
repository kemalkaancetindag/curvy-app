import 'dart:io';

import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/mobile.api.routes.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/enums/login_method_enums.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class SetupController extends GetxController {
  //SERVICES
  User? _googleUser;
  String? _userPhoneId;
  int? _loginMethod;
  String? _verificationId;
  String? _phoneNumberAppendix = "TR+90";
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
  List<String> _images = <String>["", "", "", "", "", "", "", "", ""];
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
  String? _instanceToken;
  String? get instanceToken => _instanceToken;

  //TEMP
  List<String> get validationCode => _validationCode;
  List<String> get birtdateList => _birthdateList;
  bool get isAfterSetup => _isAfterSetup;

  SetupController();

  @override
  void onInit() {
    super.onInit();
  }

  void setGoogleUser(User user) {
    _googleUser = user;
  }

  void setLoginMethod(int loginMethod) {
    _loginMethod = loginMethod;
  }

  void setPhoneNumberAppendix(String? appendix) {
    _phoneNumberAppendix = appendix;
  }

  void _setVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  void addPhoneNumber(String phoneNumber) async {
    if (phoneNumber == "") {
      Get.snackbar("Hata", "Telefon numarası boş olamaz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    if (_phoneNumberAppendix == null) {
      Get.snackbar("Hata", "Alan kodu boş olamaz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _phoneNumber = '$_phoneNumberAppendix$phoneNumber';

    var user = await Get.find<FirestoreService>().getUserByPhoneNumber(_phoneNumber!);

    if(user != null) {
      if(_loginMethod == LoginMethod.google.value){
        Get.snackbar("Hata", "Bu numaraya kayıtlı bir hesap var lütfen telefon numarası ile giriş yapınız yada farklı bir telefon numarası deneyiniz.");      
        return;
      }

      if(_loginMethod == LoginMethod.phone.value) {
        Get.find<AuthService>().phoneAuth(_phoneNumber!, _setVerificationId);
        Get.toNamed(Routes.validationCode);
        return;
      }
            
    }
    else {
      Get.find<AuthService>().phoneAuth(_phoneNumber!, _setVerificationId);
      Get.toNamed(Routes.validationCode);
    }

    

    
  }

  void addToValidationCode(String codePiece, int index) {
    if (_validationCode.length < index + 1) {
      _validationCode.add(codePiece);
    } else {
      _validationCode[index] = codePiece;
    }
  }

  void createValidationCode() async {
    
    if (_validationCode.length != 6) {
      Get.snackbar("Hata", "Yanlış kod girdiniz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _validationCodeString = _validationCode.join();

    var phoneCredentials = await Get.find<AuthService>()
        .confirmPhoneCode(_validationCodeString!, _verificationId!);
    _userPhoneId = phoneCredentials.user!.uid;

    var usersCollection = Get.find<FirestoreService>().getCollection('users');
    var results =
        await usersCollection.where('userID', isEqualTo: _userPhoneId).get();

    if (results.docs.isNotEmpty) {
      await Get.find<SharedPreferenceService>().saveUser(results.docs[0].data() as Map<String,dynamic>);
      await Get.find<SharedPreferenceService>().setLastUserID(_userPhoneId!);
      Get.toNamed(Routes.index);
      return;
    }

    if (_loginMethod == LoginMethod.google.value || _loginMethod == LoginMethod.apple.value || _loginMethod == LoginMethod.facebook.value) {
      Get.toNamed(Routes.welcome);
      return;
    } else {
      Get.to(() => ValidationMailScreen());
      return;
    }
  }

  void addEmail(String email) {
    if (email == "") {
      Get.snackbar("Hata", "E-mail alanı boş olamaz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      return;
    }
    _email = email;
    Get.to(() => WelcomeScreen());
  }

  void addName(String name) {
    if (name == "") {
      Get.snackbar("Hata", "İsim alanı boş olamaz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
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
    if (_birthdateList.length != 8) {
      Get.snackbar("Hata", "Hatalı doğum tarihi girdiniz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
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

  void setShowme(int preference) {
    _showMe = preference;
    update();
  }

  void controlInterests(int interest) {
    if (_interests.contains(interest)) {
      _interests.removeWhere((element) => element == interest);
    } else {
      _interests.add(interest);
    }
    update();
  }

  void setCurrentImageIndex(int index) {
    _currentImageIndex = index;
  }

  Future pickImage(int imageSource, int index) async {
    ImagePicker imagePicker = ImagePicker();

    switch (imageSource) {
      case 0:
        XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
        if (image == null) return;
        _images[index] = image.path;
        break;
      case 1:
        XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        _images[index] = image.path;
        break;
    }

    Get.to(() => SetupImageScreen());
  }

  Future<void> createImageFiles() async {
    _images.removeWhere((element) => element == "");
    if (_images.length == 0) {
      Get.snackbar("Hata", "En az bir fotoğraf eklemelisiniz.",
          backgroundColor: Color(0xFFD446F4), colorText: Colors.white);
      _images = <String>["", "", "", "", "", "", "", "", ""];
      return;
    }

    //_isAfterSetup = true;
    if (_loginMethod == LoginMethod.google.value) {
      var userImages = await Get.find<FirestoreService>()
          .uploadImages(_images, _googleUser!.uid);
      await Geolocator.requestPermission();
      var position = await GeolocatorPlatform.instance.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

      var jsonUser = UserModel(
          userID: _googleUser!.uid,
          phone_number: _phoneNumber,
          phone_id: _userPhoneId,
          login_method: _loginMethod,
          sex: _sex,
          name: _name,
          birthdate: _birthdateString,
          email: _googleUser!.email,
          images: userImages,
          show_me: _showMe,
          show_sex: _showSex,
          show_sexual_preference: _showSexPreference,
          email_confirmation: true,
          phone_confirmation: true,
          sexual_preference: _sexPrefenrence,
          interests: _interests,
          location: UserLocation(
              latitude: position.latitude, longitude: position.longitude),
          instance_token: _instanceToken,
          users_who_liked_me: [],
          users_i_liked: []).toJson();

      await Get.find<FirestoreService>().addToCollection(jsonUser, 'users');
      await Get.find<SharedPreferenceService>().saveUser(jsonUser);
    } else if (_loginMethod == LoginMethod.phone.value) {
      var userImages = await Get.find<FirestoreService>()
          .uploadImages(_images, _userPhoneId!);

      await Geolocator.requestPermission();
      var position = await GeolocatorPlatform.instance.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

      var jsonUser = UserModel(
          userID: _userPhoneId,
          phone_number: _phoneNumber,
          phone_id: null,
          login_method: _loginMethod,
          sex: _sex,
          name: _name,
          birthdate: _birthdateString,
          email: _email,
          images: userImages,
          show_me: _showMe,
          show_sex: _showSex,
          show_sexual_preference: _showSexPreference,
          email_confirmation: false,
          phone_confirmation: true,
          sexual_preference: _sexPrefenrence,
          interests: _interests,
          location: UserLocation(
              latitude: position.latitude, longitude: position.longitude),
          instance_token: _instanceToken,
          users_who_liked_me: [],
          users_i_liked: []).toJson();

      var userDocID =
          await Get.find<FirestoreService>().addToCollection(jsonUser, 'users');

      await Get.find<SharedPreferenceService>().saveUser(jsonUser);

      await Get.find<SharedPreferenceService>().setLastUserID(userDocID);
    }

    Get.offAllNamed(Routes.index);
  }

  void setAfterSetup(bool isAfterSetup) {
    _isAfterSetup = isAfterSetup;
  }

  void setInstanceToken(String token) {
    _instanceToken = token;
  }
}
