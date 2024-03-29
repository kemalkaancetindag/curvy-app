import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreenInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool isUnderlined; 
  WelcomeScreenInfo({super.key, required this.title, required this.info, required this.isUnderlined});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.w320,
      margin: EdgeInsets.only(bottom: Dimensions.h40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset("assets/svg/setup/welcome_tick.svg")],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: Dimensions.h27, fontWeight: FontWeight.bold),
              ),
              Container(
                width: Dimensions.w270,
                child: Center(
                  child: Text(
                     info,
                      style: TextStyle(
                        fontSize: Dimensions.h16,                        
                      ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
