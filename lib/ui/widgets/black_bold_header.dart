import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlackBoldHeader extends StatelessWidget {
  final String text;
  BlackBoldHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimensions.h40,        
        fontWeight: FontWeight.w800
      ),
    );
  }
}