import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class BuyCurvyChipController extends GetxController {
    ui.Image? activeImage;
  ui.Image? passiveImage;

  int currentPage = 1;

  @override
  Future<void> onInit() async {

    activeImage =
        await _loadImage("assets/images/curvy_chip_border_image.png");
    update();
  }

  Future _loadImage(String imagePath) async {
    ByteData bd = await rootBundle.load(imagePath);

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final ui.Codec codec = await ui.instantiateImageCodec(bytes);

    final ui.Image image = (await codec.getNextFrame()).image;

    return image;
  }

  void setCurrentPage(int page) {
    currentPage = page;
    update();
  }
}