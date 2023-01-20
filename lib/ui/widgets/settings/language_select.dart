import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/enums/language_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LanguageSelect extends StatelessWidget {
  String language;
  int value;
  bool isSelected;
  Function(int preference) actionFunction;

  LanguageSelect(
      {super.key,
      required this.language,
      required this.value,
      required this.isSelected,
      required this.actionFunction
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        actionFunction(value);
      },
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.h300 / 10),
        width: Dimensions.w254,
        height: Dimensions.h40,
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                      Colors.white,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white
                    ])
              : null,
          borderRadius: BorderRadius.circular(Dimensions.h300 / 10),
        ),
        child: Center(
          child: Text(
            language,
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.h21,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
