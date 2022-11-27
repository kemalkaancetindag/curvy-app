import 'package:curvy_app/ui/screens/setup_interests.dart';
import 'package:curvy_app/ui/widgets/basic_button.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SetupShowmeScreen extends StatelessWidget {
  const SetupShowmeScreen({super.key});

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
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlackBoldHeader(text: "Bana göster"),

            Column(
              children: [
                BasicButton(text: "KADIN", isSelected: true),
                BasicButton(text: "ERKEK", isSelected: false),
                BasicButton(text: "Hepsi", isSelected: false)
              ],
            ),

            GradientButton(text: "DEVAM ET", page: "interests",)
          ],
        ),
      ),
    );
  }
}