import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/setup_add_image.dart';
import 'package:curvy_app/ui/widgets/add_image_box.dart';
import 'package:curvy_app/ui/widgets/black_bold_header.dart';
import 'package:curvy_app/ui/widgets/gradient_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SetupImageScreen extends StatelessWidget {
  const SetupImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                BlackBoldHeader(text: "Fotoğraf ekle"),
                Text(
                  "Devam etmek için en az 2 fotoğraf ekle",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: Dimensions.h16),
                ),
              ],
            ),
            GetBuilder<SetupController>(builder: ((controller) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              var status = await Permission.camera.status;
                              if (status.isGranted) {
                                controller.setCurrentImageIndex(0);
                                Get.to(() => SetupAddImageScreen());
                              } else {
                                await Permission.camera.request();
                              }
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 0,
                                  ),
                                ))),
                        GestureDetector(
                            onTap: () {
                              controller.setCurrentImageIndex(1);
                              Get.to(() => SetupAddImageScreen());
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 1,
                                  ),
                                ))),
                        GestureDetector(
                            onTap: () {
                              controller.setCurrentImageIndex(2);
                              Get.to(() => SetupAddImageScreen());
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 2,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              controller.setCurrentImageIndex(3);
                              Get.to(() => SetupAddImageScreen());
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 3,
                                  ),
                                ))),
                        GestureDetector(
                            onTap: () {
                              controller.setCurrentImageIndex(4);
                              Get.to(() => SetupAddImageScreen());
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 4,
                                  ),
                                ))),
                        GestureDetector(
                            onTap: () {
                              controller.setCurrentImageIndex(5);
                              Get.to(() => SetupAddImageScreen());
                            },
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                //padding: EdgeInsets.all(Dimensions.h8/2),
                                radius: Radius.circular(Dimensions.h8),
                                color: Color(0xFFD2D3D5),
                                child: ClipRRect(
                                  clipBehavior: Clip.none,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimensions.h8)),
                                  child: AddImageBox(
                                    index: 5,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setCurrentImageIndex(6);
                            Get.to(() => SetupAddImageScreen());
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              //padding: EdgeInsets.all(Dimensions.h8/2),
                              radius: Radius.circular(Dimensions.h8),
                              color: Color(0xFFD2D3D5),
                              child: ClipRRect(
                                clipBehavior: Clip.none,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.h8)),
                                child: AddImageBox(
                                  index: 6,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setCurrentImageIndex(7);
                            Get.to(() => SetupAddImageScreen());
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              //padding: EdgeInsets.all(Dimensions.h8/2),
                              radius: Radius.circular(Dimensions.h8),
                              color: Color(0xFFD2D3D5),
                              child: ClipRRect(
                                clipBehavior: Clip.none,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.h8)),
                                child: AddImageBox(
                                  index: 7,
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.setCurrentImageIndex(8);
                            Get.to(() => SetupAddImageScreen());
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              //padding: EdgeInsets.all(Dimensions.h8/2),
                              radius: Radius.circular(Dimensions.h8),
                              color: Color(0xFFD2D3D5),
                              child: ClipRRect(
                                clipBehavior: Clip.none,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.h8)),
                                child: AddImageBox(
                                  index: 8,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              );
            })),
            GestureDetector(
              onTap: () async {
                await Get.find<SetupController>().createImageFiles();
              },
              child: GradientButton(text: "DEVAM ET"),
            )
          ],
        ),
      ),
    );
  }
}
