import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/screens/delete_account_why.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DeleteAccountLastChanceScreen extends StatelessWidget {
  DeleteAccountLastChanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Hesabı Sil",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.only(top: Dimensions.h148),
                child: Center(
                  child: Image.asset("assets/images/pause_icon.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Dimensions.h21),
                child: Center(
                  child: Text(
                    "HESABIMI DONDUR",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.h21
                    ),
                  ),
                ),
              ),
              Container(
                width: Dimensions.w226,
                margin: EdgeInsets.only(top: Dimensions.h8),
                child: Center(
                  child: Text(
                    
                    "Bunun yerine hesabının korunmasını ama başkalarına gösterimemesini istersen hesabını dondurabilirsin. Bu özelliği ayarlardan açıp kapatabilirsin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7B8491)
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Dimensions.h87),
                child: Center(
                  child: Image.asset("assets/images/settings_logo.png"),
                ),
              ),
              Container(
                width: Dimensions.w270,
                height: Dimensions.h42,
                margin: EdgeInsets.only(top: Dimensions.h31),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Dimensions.h50/2)
                ),
                child: Center(
                  child: Text(
                    "HESABIMI DONDUR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.h21,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => DeleteAccountWhyScreen());
                },
                child:   Container(
                margin: EdgeInsets.only(top: Dimensions.h31),
                child: Center(
                  child:Text(
                    "Hesabımı Sil",
                    style: TextStyle(
                      color: Color(0xFF7B8491),
                      fontWeight: FontWeight.bold
                    ),
                  ) ,
                ),
              )
              )
            
          ],
        ),
      ),
    );
  }
}