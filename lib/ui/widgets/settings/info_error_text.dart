import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InfoErrorText extends StatelessWidget {
  String text;
  Color? textColor;
  InfoErrorText({
    super.key,
    required this.text,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w35*9,
      margin: EdgeInsets.only(top: Dimensions.h100/10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
        text,
        style: TextStyle(
          color: textColor ?? Color(0xFF7B8491),
          fontSize: Dimensions.h14,
          fontWeight: FontWeight.bold
        ),
      ),
        ],
      )

    );
  }
}