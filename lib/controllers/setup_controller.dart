import 'package:get/get.dart';

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
  //TEMP
  List<String> _validationCode = <String>[];
  List<String> _birthdateList = <String>[];

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

  //TEMP
  List<String> get validationCode => _validationCode;
  List<String> get birtdateList => _birthdateList;

  @override
  void onInit() {
    super.onInit();
  }

  void setPhoneNumberAppendix(String? appendix) {
    _phoneNumberAppendix = appendix;
  }

  void addPhoneNumber(String phoneNumber) {
    _phoneNumber = '$_phoneNumberAppendix$phoneNumber';
    print('$_phoneNumberAppendix$phoneNumber');
  }

  void addToValidationCode(String codePiece, int index) {
    if (_validationCode.length < index + 1) {
      _validationCode.add(codePiece);
    } else {
      _validationCode[index] = codePiece;
    }
  }

  void addEmail(String email) {
    _email = email;
  }

  void addName(String name) {
    _name = name;
  }

  void addToBirthdate(String birthdatePiece, int index) {
    if (_birthdateList.length < index + 1) {
      _birthdateList.add(birthdatePiece);
    } else {
      _birthdateList[index] = birthdatePiece;
    }
    print(_birthdateList);
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
}
