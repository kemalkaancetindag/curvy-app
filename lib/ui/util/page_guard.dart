import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var isUserLoggedIn =
        Get.find<SharedPreferenceService>().checkIsUserLoggedIn();

    if (route == Routes.login && isUserLoggedIn) {
      return const RouteSettings(name: Routes.index);
    } else if (route != Routes.login && isUserLoggedIn) {
      return null;
    } else if (Routes.login == route && !isUserLoggedIn) {
      var sharedPreferenceService = Get.find<SharedPreferenceService>();
      var lastUserId = sharedPreferenceService.getLastUserID();

      if (lastUserId != null) {
        return const RouteSettings(name: Routes.secondLogin);
      }

      return null;
    }
  }
}
