import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsHeaderText extends StatelessWidget {
  final String text;
  const SettingsHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(left: Dimensions.w17),
      child: Text(
          text,
          style: TextStyle(
              color: const Color(0xFF7B8491),
              fontSize: Dimensions.h14,
              fontWeight: FontWeight.bold),
        ),
    );
  }
}
