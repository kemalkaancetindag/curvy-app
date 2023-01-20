import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeleteAccountReason extends StatelessWidget {
  final String icon;
  final String text;

  DeleteAccountReason({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w111,
      height: Dimensions.h7*10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Dimensions.h42,
            height: Dimensions.h42,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
                fit: BoxFit.contain
              )
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF7B8491),
              fontSize: Dimensions.h14,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}