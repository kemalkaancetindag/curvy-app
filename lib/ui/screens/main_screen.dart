import 'package:curvy_app/controllers/nav_controller.dart';
import 'package:curvy_app/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(builder: (controller) {
      return Scaffold(
        body: controller.mainPages[controller.currentIndex],
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}
