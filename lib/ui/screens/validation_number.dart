import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ValidationNumberScreen extends StatelessWidget {
  ValidationNumberScreen({super.key});

  
  

  final _phoneNumberFieldController = TextEditingController();
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
                      BlackBoldHeader(text: "Numaram"),
                      Column(
                        children: [
                          Container(
                            width: Dimensions.w314,
                            margin: EdgeInsets.only(top: Dimensions.h117),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GetBuilder<SetupController>(
                                      builder: (controller) {
                                    return Container(
                                      width: 81,
                                      child: Center(
                                        child: DropdownButton(
                                            itemHeight: 50,
                                            value: controller.phoneNumberAppendix,
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("TR+90"),
                                                value: "TR+90",
                                              )
                                            ],
                                            onChanged: (o) {
                                              controller
                                                  .setPhoneNumberAppendix(o);
                                            }),
                                      ),
                                    );
                                  }),
                                  Container(
                                    width: Dimensions.w218,
                                    height: Dimensions.h50,
                                    child: Center(
                                      child: TextField(
                                          keyboardType: TextInputType.number,
                                          controller:
                                              _phoneNumberFieldController,
                                          cursorColor:
                                              Colors.black.withOpacity(0.4),
                                          decoration: InputDecoration(
                                              hintText: "5xx xxx xx xx",
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 0),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.4))))),
                                    ),
                                  )
                                ]),
                          ),
                          Container(
                              width: Dimensions.w314,
                              child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text:
                                          "Sana doğrulama kodu içeren bir SMS göndereceğiz. Mesaj ve veriler ücrete tabi olabilir.",
                                      style: TextStyle(
                                          fontSize: Dimensions.h14,
                                          color: Colors.black.withOpacity(0.4)),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                "Numaranın değişmesi durumunda ne olacağını öğrenmek içi linke git.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline)),
                                      ]))),
                        ],
                      ),
                    ],
                  ),
                  GetBuilder<SetupController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller
                            .addPhoneNumber(_phoneNumberFieldController.text);
                       
                      },
                      child: GradientButton(
                        text: "DEVAM ET",
                        page: "vcode",
                      ),
                    );
                  })
                ])));
  }
}
