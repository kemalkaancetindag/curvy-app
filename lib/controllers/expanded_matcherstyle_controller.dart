import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class ExpandedMatcherStyleController extends GetxController {
  UserModel? _user;
  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    update();
  }

  void removeUser() {
    _user = null;
    update();
  }

}
