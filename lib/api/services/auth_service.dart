import 'package:get/get.dart';

class AuthService extends GetxService {
  final RxBool isPremium = true.obs;

  void setIsPremium(bool newValue) {
    isPremium.value = newValue;
  }
}