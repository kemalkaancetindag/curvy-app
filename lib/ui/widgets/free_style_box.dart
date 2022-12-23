import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/freestyle_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class FreeStyleBox extends StatelessWidget {
  UserModel user;
  int distance;
  FreeStyleBox({super.key, required this.user, required this.distance});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FreestyleController>(builder: (controller) {
      return GestureDetector(
        onTap: (){
          controller.setSelectedUser(user);
        },
        child: Container(
          width: Dimensions.w111,
          height: Dimensions.h148,  
          margin: EdgeInsets.only(left: Dimensions.w11/2,right: Dimensions.w11/2, top: Dimensions.h100/18),        
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h8),
              image: DecorationImage(
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(user.images![0])}?alt=media'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.h45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.h8),
                            bottomRight: Radius.circular(Dimensions.h8)),
                        gradient: LinearGradient(
                            stops: [0.3, 0.7],
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.h7 / 2),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: Dimensions.w8 / 4,
                                    left: Dimensions.w8),
                                width: Dimensions.w8 / 2,
                                height: Dimensions.h8 / 2,
                                decoration: BoxDecoration(
                                    color: Color(0xFF05ED00),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h8 / 4)),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(right: Dimensions.w8 / 4),
                                child: Center(
                                  child: Text(
                                    "${user.name!}, ${DateTime.now().year - int.parse(user.birthdate!.split("/").last)}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.h100 / 10),
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/confirm_small.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.w99,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.w8, top: Dimensions.h7 / 2),
                          width: double.maxFinite,
                          child: Center(
                            child: Text(
                              "Antalya konumundan, ${distance}km uzakta, şuan online.",
                              style: TextStyle(
                                  fontSize: Dimensions.h14 / 2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
