import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/send_feedback.dart';
import 'package:curvy_app/ui/widgets/delete_account_reason.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DeleteAccountWhyScreen extends StatelessWidget {
  const DeleteAccountWhyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Hesabı Sil",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimensions.h31),
              width: Dimensions.w254,
              child: Center(
                child: Text(
                  "Hesabını silmek istediğine emin misin?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.h21,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h7),
              width: Dimensions.w254,
              child: Center(
                child: Text(
                  "Neden ayrılmak istediğini lütfen bizimle paylaş",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF7B8491), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: Dimensions.h12),
                child: SizedBox(
                  width: Dimensions.w325,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                  ),
                )),
            Container(
                height: Dimensions.h165,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SendFeedbackScreen());
                      },
                      child: DeleteAccountReason(
                        icon: "assets/images/delete_account_reason_1.png",
                        text: "ARIZA VAR",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SendFeedbackScreen());
                      },
                      child: DeleteAccountReason(
                        icon: "assets/images/delete_account_reason_2.png",
                        text: "BEĞENMEDİM",
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: Dimensions.h12),
                child: SizedBox(
                  width: Dimensions.w325,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                  ),
                )),
            Container(
                height: Dimensions.h165,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SendFeedbackScreen());
                      },
                      child: DeleteAccountReason(
                        icon: "assets/images/delete_account_reason_3.png",
                        text: "EN BAŞA DÖN",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SendFeedbackScreen());
                      },
                      child: DeleteAccountReason(
                        icon: "assets/images/delete_account_reason_4.png",
                        text: "BİRİNİ BULDUM",
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: Dimensions.h12),
                child: SizedBox(
                  width: Dimensions.w325,
                  height: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFC5C5C7)),
                  ),
                )),
            Container(
                height: Dimensions.h165,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SendFeedbackScreen());
                      },
                      child: DeleteAccountReason(
                        icon: "assets/images/delete_account_reason_5.png",
                        text: "ARA VERİYORUM",
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => SendFeedbackScreen());
                        },
                        child: DeleteAccountReason(
                          icon: "assets/images/delete_account_reason_6.png",
                          text: "ÖZEL BİR HİKAYE",
                        ))
                  ],
                )),
            Container(
              child: Center(
                child: Image.asset("assets/images/settings_logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
