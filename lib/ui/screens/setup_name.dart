import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SetupNameScreen extends StatelessWidget {
  SetupNameScreen({super.key});

  final _nameFieldController = TextEditingController();

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
        padding: EdgeInsets.only(left: Dimensions.w48, right: Dimensions.w48),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [BlackBoldHeader(text: "Adım")],
                ),
                Container(
                  width: Dimensions.w314,
                  margin: EdgeInsets.only(top: Dimensions.h117),
                  child: Center(
                    child: TextField(
                      controller: _nameFieldController,
                      cursorColor: Colors.black.withOpacity(0.4),
                      decoration: InputDecoration(
                          hintText: "İsim",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.4)))),
                    ),
                  ),
                ),
                Container(
                  width: Dimensions.w314,
                  margin: EdgeInsets.only(top: Dimensions.h7),
                  child: Center(
                    child: Text(
                      "Curvy'de bu isimle görüneceksin ve bunu değiştiremeyeceksin.",
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
                )
              ],
            ),
            GetBuilder<SetupController>(builder: (controller) {
              return GestureDetector(
                onTap: () {
                  controller.addName(_nameFieldController.text);
                  Get.to(() => SetupBirthdateScreen());
                },
                child: GradientButton(
                  text: "DEVAM ET",
                  page: "setbirth",
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
