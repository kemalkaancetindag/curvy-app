import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SaveAccountScreen extends StatelessWidget {
  const SaveAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
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
                BlackBoldHeader(text: "Hesap Kurtarma"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Dimensions.w314,
                      margin: EdgeInsets.only(top: Dimensions.h117),
                      child: Center(
                          child: TextField(
                        cursorColor: Colors.black.withOpacity(0.4),
                        decoration: InputDecoration(
                          hintText: "E-posta",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.4))))
                      )),
                    ),
                    Container(
                        width: Dimensions.w300,
                        margin: EdgeInsets.only(top: Dimensions.h7),
                        child: Text(
                          "E-posta adresine, hesabını kurtarmanı sağlayacak bir bağlantı göndereceğiz. Lütfen doğru e-posta adresine giriniz.",
                          style: TextStyle(
                              fontSize: Dimensions.h12,
                              color: Colors.black.withOpacity(0.4)),
                        ))
                  ],
                ),
              ],
            ),
            GradientButton(text: "E-POSTA GÖNDER",)
          ],
        ),
      ),
    );
  }
}
