import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasicInlineButton extends StatelessWidget {
  String? buttonText;
  String? valueText;
  Color? buttonTextColor;
  Color? valueTextColor;
  bool? isValueTextBold;

  BasicInlineButton({
    super.key,
    this.buttonText,
    this.valueText,
    this.buttonTextColor,
    this.valueTextColor,
    this.isValueTextBold
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Container(
      height: Dimensions.h50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.w17),
            child: Text(
              buttonText!,
              style: TextStyle(
                color: buttonTextColor ?? Colors.black,
                fontSize: Dimensions.h16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            children: [
              valueText != null ?
              Container(
                margin: EdgeInsets.only(right: Dimensions.w11),
                child: Text(
                  valueText!,
                  style: TextStyle(
                    color: valueTextColor ?? Color(0xFF7B8491),
                    fontSize: Dimensions.h16,
                    fontWeight: isValueTextBold! ? FontWeight.bold : null
                  ),
                ),
              )  : Container(),
              Container(
                margin: EdgeInsets.only(right: Dimensions.w17),
                child: Image.asset("assets/images/chevron_right.png"),
              )
            ],
          )
        ],
      ),
    ),
    );
  }
}