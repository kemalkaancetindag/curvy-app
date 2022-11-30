import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/ui/widgets/circle_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                  top: -Dimensions.h666,
                  left: -Dimensions.w316,
                  child: Container(
                    width: Dimensions.w1023,
                    height: Dimensions.h1023,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.h1023 / 2),
                        gradient: LinearGradient(
                            colors: [Colors.white, Color(0xFFE2C1FC)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )),
              Positioned(
                  child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Column(
                  children: [
                    Image.asset("assets/images/main_logo.png"),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: Dimensions.w160,
                      height:200,
                      child: Stack(
                        children: [
                          Positioned(
                              child: CustomPaint(
                                  foregroundPainter: CircleProgress(),
                                  child: Container(
                                    width: 300,
                                    height: 300,
                                    child: Center(
                                      child: Container(
                                        width: Dimensions.w140,
                                        height: Dimensions.h140,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.w140 / 2)),
                                      ),
                                    ),
                                  ))),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              width: Dimensions.w160,
                              height: Dimensions.h40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.h22),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFD51CFF),
                                    Color(0xFF00FFE1)
                                  ]
                                )
                              ),
                              child: Center(
                                child: Text(
                                  "%65 Tamamlandı",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                            )
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFF05ED00),
                            borderRadius: BorderRadius.circular(4)
                          ),
                        ),
                        Container(
                          child: Text(
                            "Gülçitay, 25",
                            style: TextStyle(
                              fontSize: Dimensions.h22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Center(
                            child: Image.asset("assets/images/confirm_icon.png"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
