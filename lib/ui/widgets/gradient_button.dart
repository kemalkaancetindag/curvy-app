import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/login.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/screens/setup_interests.dart';
import 'package:curvy_app/ui/screens/setup_name.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/screens/setup_showme.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/screens/validation_number.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final String? page;
  const GradientButton({super.key, required this.text,  this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Dimensions.w320,
        height: Dimensions.h50,
        margin: EdgeInsets.only(bottom: Dimensions.h27),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white),)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFD51CFF), Color(0xFF00FFE1)]),
            borderRadius: BorderRadius.circular(25)),
      );
  }
}
