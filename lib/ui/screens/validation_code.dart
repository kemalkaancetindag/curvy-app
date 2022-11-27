import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ValidationCodeScreen extends StatelessWidget {
  const ValidationCodeScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
              BlackBoldHeader(text: "Doğrulama"),
              Text(
                "905365083366",
                style: TextStyle(color: Colors.black.withOpacity(0.4)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Tekrar Gönder",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: Dimensions.w314,
                margin: EdgeInsets.only(top: Dimensions.h66),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: Colors.black.withOpacity(0.4),
                          decoration:  InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      ),
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          onChanged: (value) {
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
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      ),
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: Colors.black.withOpacity(0.4),
                          decoration:  InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      ),
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          onChanged: (value) {
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
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      ),
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          onChanged: (value) {
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
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      ),
                      Container(
                        width: Dimensions.w35,
                        child: TextField(
                          style: TextStyle(
                              fontSize: Dimensions.h40,
                              fontWeight: FontWeight.w700),
                          cursorColor: Colors.black.withOpacity(0.4),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.4)))),
                        ),
                      )
                    ]),
              )
            ],
          ),
          GradientButton(text: "DEVAM ET", page: "vmail",)
        ]),
      ),
    );
  }
}
