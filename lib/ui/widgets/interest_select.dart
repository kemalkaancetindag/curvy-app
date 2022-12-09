import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InterestSelect extends StatelessWidget {
  final String assetName;
  final String text;
  final bool isSelected;

  InterestSelect(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w155,
      height: Dimensions.h45,
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFD446F4) : Colors.white,
          border: Border.all(color: isSelected ? Color(0xFFD446F4) : Colors.black.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color.fromRGBO(233, 64, 87, 0.2),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: Offset(0, 15), // changes position of shadow
                  ),
                ]
              : null),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(assetName),
          Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: Dimensions.h16),
          )
        ],
      ),
    );
  }
}
