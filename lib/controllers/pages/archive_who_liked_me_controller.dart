import 'dart:math' as math;

import 'package:curvy_app/api/services/archive_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class ArchiveWhoLikedMeController extends GetxController {
  ArchiveService archiveService;

  List<UserModel>? _usersWhoLikedMe;
  List<UserModel>? get usersWhoLikedMe => _usersWhoLikedMe;
  List<List<double>>? _positions;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;

  ArchiveWhoLikedMeController({required this.archiveService});

  @override
  Future<void> onInit() async {
    super.onInit();
    _usersWhoLikedMe = await archiveService.getUsersWhoLikedMe();
    _generateTiles();

    update();
  }

  double _calculateDistance(double x1, double y1, double x2, double y2) {
    double distance =
        math.sqrt(math.pow((x2 - x1), 2) + math.pow((y2 - y1), 2));

    return distance;
  }

  void _generateTiles() {
    _positions = [];

    int currentUserIndex = 1;

    int maxRadius = 50;
    int minRadius = 30;

    double totalCircleArea = 0;

    int currentSquareSide = 300;

    double screenCenterX = Get.width / 2;
    double screenCenterY = Get.height / 2;

    _tiles = [];

    _tiles!.add(Positioned(
        top: screenCenterY - maxRadius,
        left: screenCenterX - maxRadius,
        child: Container(
          width: maxRadius * 2,
          height: maxRadius * 2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_usersWhoLikedMe![0].images![0])}?alt=media'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(maxRadius.toDouble())),
        )));

    _positions!.add([screenCenterX, screenCenterY, maxRadius.toDouble()]);

    var random = math.Random();

    List<UserModel>? selectedUsers;

    if (_usersWhoLikedMe!.length > 30) {
      selectedUsers = _usersWhoLikedMe!.sublist(0, 30);
    } else {
      selectedUsers = _usersWhoLikedMe!;
    }

    while (tiles!.length < selectedUsers.length) {
      int? randomCenterXDiff;
      int? randomCenterYDiff;

      if (totalCircleArea > math.pow(currentSquareSide, 2) - 30000) {
        currentSquareSide = currentSquareSide * 2;
      }

      int randomRadiusDiff = random.nextInt(maxRadius - minRadius);
      int randomRadius = randomRadiusDiff + minRadius;

      randomCenterXDiff = random.nextInt(currentSquareSide);
      randomCenterYDiff = random.nextInt(currentSquareSide);

      double randomCenterX =
          randomCenterXDiff + (screenCenterX - (currentSquareSide / 2));
      double randomCenterY =
          randomCenterYDiff + (screenCenterY - (currentSquareSide / 2));

      bool overlapping = false;

      for (int i = 0; i < _positions!.length; i++) {
        double distance = _calculateDistance(
            randomCenterX, randomCenterY, _positions![i][0], _positions![i][1]);

        if (distance < _positions![i][2] + randomRadius) {
          overlapping = true;
        }
      }

      if (!overlapping) {
        _tiles!.add(Positioned(
            top: randomCenterY - randomRadius,
            left: randomCenterX - randomRadius,
            child: Container(
              width: randomRadius * 2,
              height: randomRadius * 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_usersWhoLikedMe![currentUserIndex].images![0])}?alt=media'),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(randomRadius.toDouble())),
            )));

        totalCircleArea += math.pi * math.pow(randomRadius, 2);
        _positions!
            .add([randomCenterX, randomCenterY, randomRadius.toDouble()]);
        currentUserIndex += 1;
      }
    }
  }
}
