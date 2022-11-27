import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValidationMailScreen extends StatelessWidget {
  const ValidationMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: Dimensions.w300,
                  child: Center(
                    child: BlackBoldHeader(text: "E-posta adresin nedir?"),
                  ),
                ),
                Container(
                  width: Dimensions.w314,
                  margin: EdgeInsets.only(top: Dimensions.h21),
                  child: Center(
                    child: Text(
                      "E-posta adresini doğrula, hesabına erişimini kaybetme.",
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                ),
                Container(
                  width: Dimensions.w314,
                  height: Dimensions.h50,
                  child: Center(
                    child: TextField(
                      cursorColor: Colors.black.withOpacity(0.4),
                      decoration: InputDecoration(
                          hintText: "E-posta",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.4)))),
                    ),
                  ),
                ),
              ],
            ),
            GradientButton(text: "DEVAM ET", page: "welcome",)
          ],
        ),
      ),
    );
  }
}
