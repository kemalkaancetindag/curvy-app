import 'dart:io';
import 'dart:math';

import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/enums/zodiac_enum.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  FirestoreService firestoreService;
  TextEditingController aboutFieldController = TextEditingController();
  TextEditingController graduationFieldController = TextEditingController();
  TextEditingController jobFieldController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();
  UserService userService;
  UserModel? _user;
  UserModel? get user => _user;
  List<dynamic>? _images;
  List<dynamic>? get images => _images;

  int? _zodiac;
  int? get zodiac => _zodiac;
  int? _personality;
  int? get personality => _personality;
  int? _pet;
  int? get pet => _pet;
  int? _smoke;
  int? get smoke => _smoke;
  int? _alcohol;
  int? get alcohol => _alcohol;
  int? _sex;
  int? get sex => _sex;
  List<dynamic>? _sexualPreferences;
  List<dynamic>? get sexualPreferences => _sexualPreferences;
  bool? _showAge;
  bool? get showAge => _showAge;
  bool? _showDistance;
  bool? get showDistance => _showDistance;

  int? _currentImageIndex;
  int? get currentImageIndex => _currentImageIndex;

  EditProfileController(
      {required this.firestoreService, required this.userService});

  @override
  Future<void> onInit() async {
    super.onInit();
    await setUser();
  }

  void setCurrentImageIndex(int index) {
    _currentImageIndex = index;
  }

  Future pickImage(int imageSource) async {
    ImagePicker imagePicker = ImagePicker();

    switch (imageSource) {
      case 0:
        XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
        if (image == null) return;

        if (currentImageIndex! < _images!.length - 1) {
          print("sa");
          print(_images![currentImageIndex!]);
          String imageRef =
              'user-images/SHmcTGDSV1f0HmPV7QBPOGEixcW2/${_images![currentImageIndex!].split('.')[0]}.${Utils.getMimetype(image.path)}';
          print(imageRef);
          await firestoreService.uploadImage(File(image.path), imageRef);
          Map<String, dynamic> newData = Map<String, dynamic>();

          _images![currentImageIndex!] = imageRef;
        } else {
          String mimeType = Utils.getMimetype(image.path);

          int randomInt = Random().nextInt(9999999);
          final imageRef =
              'user-images/SHmcTGDSV1f0HmPV7QBPOGEixcW2/$randomInt.$mimeType';
          print(imageRef);
          await firestoreService.uploadImage(File(image.path), imageRef);
          Map<String, dynamic> newData = Map<String, dynamic>();

          _images!.add(imageRef);
          newData['images'] = _images;
          await firestoreService.updateUser(
              newData, 'SHmcTGDSV1f0HmPV7QBPOGEixcW2');
        }

        break;
      case 1:
        XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        if (currentImageIndex! < _images!.length - 1) {
          print("sa");
          print(_images![currentImageIndex!]);
          String imageRef =
              'user-images/SHmcTGDSV1f0HmPV7QBPOGEixcW2/${_images![currentImageIndex!].split('.')[0]}.${Utils.getMimetype(image.path)}';
          print(imageRef);
          await firestoreService.uploadImage(File(image.path), imageRef);
          Map<String, dynamic> newData = Map<String, dynamic>();

          _images![currentImageIndex!] = imageRef;
        } else {
          String mimeType = Utils.getMimetype(image.path);

          int randomInt = Random().nextInt(9999999);
          final imageRef =
              'user-images/SHmcTGDSV1f0HmPV7QBPOGEixcW2/$randomInt.$mimeType';
          print(imageRef);
          await firestoreService.uploadImage(File(image.path), imageRef);
          Map<String, dynamic> newData = Map<String, dynamic>();

          _images!.add(imageRef);
          newData['images'] = _images;
          await firestoreService.updateUser(
              newData, 'SHmcTGDSV1f0HmPV7QBPOGEixcW2');
        }
        break;
    }
    update();
  }

  Future<void> setUser() async {
    UserModel? userModel =
        await userService.getUser('SHmcTGDSV1f0HmPV7QBPOGEixcW2');
    _user = userModel;
    print(userModel!.sexual_preference);
    setInitialFields(
        userModel!.about,
        userModel.city,
        userModel.graduation,
        userModel.job,
        userModel.sexual_preference,
        userModel.images,
        userModel.show_age,
        userModel.show_distance);
    update();
  }

  void setInitialFields(
      String? about,
      String? city,
      String? graduation,
      String? job,
      List<dynamic>? sexualPreferences,
      List<dynamic>? images,
      bool? showAge,
      bool? showDistance) {
    aboutFieldController.text = about ?? '';
    cityFieldController.text = city ?? '';
    graduationFieldController.text = graduation ?? '';
    jobFieldController.text = job ?? '';

    _sexualPreferences = sexualPreferences;
    _images = images;
    _showAge = showAge;
    _showDistance = showDistance;
  }

  void setZodiac(int zodiac) {
    _zodiac = zodiac;
    update();
  }

  void setPersonality(int personality) {
    _personality = personality;
    update();
  }

  void setPet(int pet) {
    _pet = pet;
    update();
  }

  void setSmoke(int smoke) {
    _smoke = smoke;
    update();
  }

  void setAlcohol(int alcohol) {
    _alcohol = alcohol;
    update();
  }

  void setSex(int sex) {
    _sex = sex;
    update();
  }

  void setSexualPreferences(int sexualPreference) {
    if (_sexualPreferences!.contains(sexualPreference) &&
        _sexualPreferences!.length != 1) {
      _sexualPreferences!.removeWhere((element) => element == sexualPreference);
    } else if (!_sexualPreferences!.contains(sexualPreference)) {
      _sexualPreferences!.add(sexualPreference);
    }

    update();
  }

  Future<void> modalUpdateHandler(
      bool isUpdate, String? updateField, dynamic? updateValue) async {
    if (isUpdate) {
      Map<String, dynamic> data = Map<String, dynamic>();
      data[updateField!] = updateValue!;
      await firestoreService.updateUser(data, 'SHmcTGDSV1f0HmPV7QBPOGEixcW2');
    }

    Get.back();
  }

  void setShowAge(bool value) {
    _showAge = value;
    update();
  }

  void setShowDistance(bool value) {
    _showDistance = value;
    update();
  }

  Future<void> updateEditFields() async {
    Map<String, dynamic> data = Map<String,dynamic>();
    if(aboutFieldController.text.isNotEmpty){
      data['about'] = aboutFieldController.text;
    }

    if(jobFieldController.text.isNotEmpty){
      data['job'] = jobFieldController.text;
    }

    if(graduationFieldController.text.isNotEmpty){
      data['graduation'] = graduationFieldController.text;
    }

    
    if(cityFieldController.text.isNotEmpty){
      data['city'] = cityFieldController.text;
    }

    data['show_age'] = _showAge;
    data['show_distance'] = _showDistance;

    await firestoreService.updateUser(data, 'SHmcTGDSV1f0HmPV7QBPOGEixcW2');

    Get.back();
    
  }

}
