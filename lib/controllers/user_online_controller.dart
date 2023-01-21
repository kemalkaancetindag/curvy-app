import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class UserOnlineController extends GetxController {
  FirestoreService firestoreService;
  String userID;
  UserModel? _user;
  UserModel? get user => _user;
  int? _distance;
  int? get distance => _distance;

  UserOnlineController({required this.firestoreService, required this.userID});

  @override
  Future<void> onInit() async {
    super.onInit();

    await setInitialOnlineStatus();
    _distance = await calculateDistance(
        _user!.location!.latitude!, _user!.location!.longitude!);
    update();
    await addUserListener();
  }

  Future setInitialOnlineStatus() async {
    var userSnapshot = await firestoreService
        .getCollection('users')
        .where("userID", isEqualTo: userID)
        .get();
        
    if(userSnapshot.docs.isEmpty){
      print(userID);
    }
    _user = UserModel.fromJson(
        (userSnapshot.docs[0].data() as Map<String, dynamic>));

    update();
  }

  Future addUserListener() async {
    firestoreService
        .getCollection('users')
        .where("userID", isEqualTo: userID)
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        switch (change.type) {
          case DocumentChangeType.modified:
            _user = UserModel.fromJson(
                (event.docs[0].data() as Map<String, dynamic>));

            update();
            break;
          case DocumentChangeType.removed:
            break;
          case DocumentChangeType.added:
            break;
        }
      }
    });
  }

  Future<int> calculateDistance(double lat2, double lon2) async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);
    var lat1 = currentUser.location!.latitude!;
    var lon1 = currentUser.location!.longitude!;
    var dLat = (lat2 - lat1) * math.pi / 180.0;
    var dLon = (lon2 - lon1) * math.pi / 180.0;
    var latTimesPi1 = (lat1) * math.pi / 180.0;
    var latTimesPi2 = (lat2) * math.pi / 180.0;

    var a = (math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) *
            math.cos(latTimesPi1) *
            math.cos(latTimesPi2));
    var rad = 6371;
    var c = 2 * math.asin(math.sqrt(a));

    return (rad * c).toInt();
  }
}
