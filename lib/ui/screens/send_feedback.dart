import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SendFeedbackScreen extends StatelessWidget {
  SendFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F7F7),
        elevation: 0,
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
        color: Color(0xFFF7F7F7),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimensions.h31),
              child: Center(
                child: Text(
                  "Geribildirim Gönder",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.h21,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: Dimensions.w254,
              margin: EdgeInsets.only(top: Dimensions.h36),
              child: Center(
                child: Text(
                  "Denetimini bizimle paylaşırsan en kısa zamanda hem sana yardımcı oluruz hemde diğer üyelerimizin aynı problemle karşılaşmaması için kendimizi geliştirebiliriz.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF7B8491), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: Dimensions.w31),
              margin: EdgeInsets.only(top: Dimensions.h21),
              child: Row(
                children: [
                  Text(
                    "DİĞER",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: Dimensions.h209,
              color: Colors.white,
              child: TextField(
                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: Dimensions.w31, top: Dimensions.h100/10, bottom:Dimensions.h100/10 ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Yazmaya buradan başlayabilirsin",
                  
                ),
                cursorColor: Colors.black,
                maxLines: 12,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimensions.h22),
              child: Center(
                child: Text(
                  "Hesap silme işlemine Devam et",
                  style: TextStyle(
                    color: Color(0xFF7B8491),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
