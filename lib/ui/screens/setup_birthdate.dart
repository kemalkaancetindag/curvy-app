import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SetupBirthdateScreen extends StatelessWidget {
  SetupBirthdateScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BlackBoldHeader(text: "Doğum günün"),
                Container(
                    width: Dimensions.w218,
                    margin: EdgeInsets.only(top: Dimensions.h117),
                    child: GetBuilder<SetupController>(
                      builder: ((controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: Dimensions.w25,
                              child: TextField(                
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],              
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 0);
                                  if(value.length == 1){
                                    FocusScope.of(context).nextFocus();
                                  }
                                  
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 1);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Text("/",
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700)),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                              inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 2);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } 
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                              inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 3);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Text("/",
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700)),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                               inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 4);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                               inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 5);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                             inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 6);
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            ),
                            Container(
                              width: Dimensions.w25,
                              child: TextField(
                              inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],       
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: Dimensions.h27,
                                    fontWeight: FontWeight.w700),
                                onChanged: (value) {
                                  controller.addToBirthdate(value, 7);
                                  if (value.length == 1) {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                                cursorColor: Colors.black.withOpacity(0.4),
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black
                                                .withOpacity(0.4)))),
                              ),
                            )
                          ],
                        );
                      }),
                    )),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h7),
                  child: Text(
                    "Yaşını profiline giren herkes görebilecek",
                    style: TextStyle(color: Colors.black.withOpacity(0.4)),
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: (() {
                  Get.find<SetupController>().createBirthdate();
                }),
                child: GradientButton(
                  text: "DEVAM ET",
                  page: "setsex",
                ))
          ],
        ),
      ),
    );
  }
}
