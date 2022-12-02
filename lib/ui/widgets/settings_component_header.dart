import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsComponentHeader extends StatelessWidget {
  final String text;
  const SettingsComponentHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: Dimensions.h16,
        fontWeight: FontWeight.bold
      ),
    ),
    );
  }
}