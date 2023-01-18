import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsDivider extends StatelessWidget {
  bool? isFull;
  SettingsDivider({
    super.key,
    this.isFull
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFull == null ? Dimensions.w35*10 : double.maxFinite,
      height: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFC5C5C7)
        ),
      ),
    );
  }
}