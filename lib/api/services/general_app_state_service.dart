import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeneralAppStateService extends GetxService {
  SharedPreferenceService sharedPreferenceService;
  FirestoreService firestoreService;

  GeneralAppStateService({
    required this.sharedPreferenceService,
    required this.firestoreService
  });

  Future updateLocation() async {
    var userID = sharedPreferenceService.getUserID();
    var position = await GeolocatorPlatform.instance.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

    var updatedLocation = Map<String,dynamic>();

    updatedLocation['location.longitude'] = position.longitude;
    updatedLocation['location.latitude'] = position.latitude;

    await firestoreService.updateUser(updatedLocation, userID!);

  }

  Future updateInstanceToken() async {
    var userID = sharedPreferenceService.getUserID();
    var token = await FirebaseMessaging.instance.getToken();  


    var updatedToken = Map<String,dynamic>();

    updatedToken['instance_token'] = token;

    await firestoreService.updateUser(updatedToken, userID!);
  }

  Future setUserStatusOnline() async {
    var userID = sharedPreferenceService.getUserID();

    var data = Map<String,dynamic>();

    data['online_status'] = true;

    await firestoreService.updateUser(data, userID!);
  }

}