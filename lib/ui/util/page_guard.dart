import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageGuard extends GetMiddleware {
  final isUserLoggedIn = Get.find<SharedPreferenceService>().checkIsUserLoggedIn();
 
  @override
  RouteSettings? redirect(String? route) {
    print(isUserLoggedIn);
    print(route);
    print('bilinen');
    print(Routes.login);
    if(route == Routes.login && isUserLoggedIn){
      return const RouteSettings(name: Routes.index);
    }
    else if(route != Routes.login && isUserLoggedIn){
      return null;
    }
    else if(Routes.login == route  && !isUserLoggedIn){
      return null;
    }
 
  }
}
