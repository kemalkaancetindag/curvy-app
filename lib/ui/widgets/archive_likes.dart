import 'package:curvy_app/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ArchiveLikes extends StatelessWidget {
  ArchiveLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: Dimensions.w209,
            child: Center(
              child: Text(
                "Curvy Turbo kullanarak eşleşme şansını artır.",
                textAlign: TextAlign.center,
                style: TextStyle(

                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.h100/5
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.h120,
            height: Dimensions.h120,
            margin: EdgeInsets.only(top: Dimensions.h100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/women.png"),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(Dimensions.h120/2)
            ),
          ),
          Container(
            width: Dimensions.w209,
            margin: EdgeInsets.only(top: Dimensions.h120+Dimensions.h8),
            child: Center(
              child: Text(
                "Curvy Turbo sayesinde eşleştiklerin burada görünecek",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Dimensions.h14,
                  color: Color(0xFF7B8491),
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.w209,
              margin: EdgeInsets.only(top: Dimensions.h8),
            child: Center(
              child: Text(
                "10X Görüntülenmek için",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Dimensions.h100/5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.w314,
            height: Dimensions.h60,
             margin: EdgeInsets.only(top: Dimensions.h14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h60/2),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFD51CFF),
                  Color(0xFF6198EF),
                ]
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: Dimensions.w8),
                  child: Center(
                    child: Image.asset("assets/images/turbo_icon.png"),
                  ),
                ),
                Container(
                  child: Text(
                    "Hemen Beni Turbola",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.h50/2,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}