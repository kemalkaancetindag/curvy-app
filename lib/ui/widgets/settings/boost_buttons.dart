import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/pages/buy_plus_premium_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BoostButtons extends StatelessWidget {
  LinearGradient backgroundGradient;
  String packageName;
  String packageIcon;
  double marginTop;
  String route;
  bool? isPlus;

  BoostButtons({
    super.key,
    required this.backgroundGradient,
    required this.packageName,
    required this.packageIcon,
    required this.marginTop,
    required this.route,
    this.isPlus
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(route == Routes.buyPlusPremium){
         Get.put(BuyPlusPremiumController(isPlus: isPlus));
        }
        Get.toNamed(route);
      },
      child:  Container(
      margin: EdgeInsets.only(top: marginTop),
      width: Dimensions.w310,
      height: Dimensions.h7*10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.h50),
        gradient: backgroundGradient
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Dimensions.h50,
            height: Dimensions.h50,
            margin: EdgeInsets.only(right: Dimensions.w11),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(packageIcon),
                fit: BoxFit.contain
              )
            ),
          ),
          Text(
            packageName,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.h27,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),

    ),
    );
  }
}