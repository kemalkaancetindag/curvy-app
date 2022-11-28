import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/widgets/add_image_box.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupImageScreen extends StatelessWidget {
  const SetupImageScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                BlackBoldHeader(text: "Fotoğraf ekle"),
                Text(
                  "Devam etmek için en az 2 fotoğraf ekle",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: Dimensions.h16),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [AddImageBox(), AddImageBox(), AddImageBox()],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [AddImageBox(), AddImageBox(), AddImageBox()],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.h17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [AddImageBox(), AddImageBox(), AddImageBox()],
                  ),
                ),
              ],
            ),
            GradientButton(text: "DEVAM ET")
          ],
        ),
      ),
    );
  }
}
