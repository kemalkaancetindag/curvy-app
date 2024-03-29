import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/ui/screens/validation_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginButton extends StatelessWidget {
  final String logo;
  final String text;
  final Function loginMethod;
  LoginButton({super.key, required this.logo, required this.text, required this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await loginMethod();       
        
      },
      child: Container(
        width: Dimensions.w320,
        height: Dimensions.h50,
        margin:  EdgeInsets.only(bottom: Dimensions.h21),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width:Dimensions.w2 ),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: Dimensions.w22,
              height: Dimensions.h22,
              margin:  EdgeInsets.only(left: Dimensions.w16),
              child: Center(
                child: SvgPicture.asset(logo),
              ),
            ),            
            Container(
              width: Dimensions.w254,
              child:   Row(              
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                Text(text, style: TextStyle(color: Colors.white),)
              ],
            ),
            )
          
          
            
          ]
        ),
      ),
    );
  }
}