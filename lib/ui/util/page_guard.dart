import 'package:curvy_app/api/services/auth_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isPremium.value
        ? null
        : const RouteSettings(name: Routes.login);
  }
}
