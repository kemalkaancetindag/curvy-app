import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/ui/util/utils.dart';
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

    
      for (int i = 3; i < 7; i++) {
        if (i == 3) {
         updatedLocation['location.geohash.km100'] = Utils.encode(position.longitude, position.latitude, i);              
        } else if (i == 4) {
          updatedLocation['location.geohash.km40'] = Utils.encode(position.longitude, position.latitude, i);
        } else if (i == 5) {
          updatedLocation['location.geohash.km5'] = Utils.encode(position.longitude, position.latitude, i);
        } else if (i == 6) {
          updatedLocation['location.geohash.km2'] = Utils.encode(position.longitude, position.latitude, i);
        }
      }

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