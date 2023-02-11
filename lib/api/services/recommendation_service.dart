import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class RecommendationService extends GetxService {

  FirestoreService firestoreService;

  RecommendationService({
    required this.firestoreService
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    
  }

  Future<List<dynamic>> getRecommendations(List<dynamic> unWantedUsers) async {
    var currentUserId = Get.find<SharedPreferenceService>().getUserID();
    var currentUser = await firestoreService.getUser(currentUserId!);
    var users = (await firestoreService.getCollection("users").where("userID", isNotEqualTo: currentUserId).get()).docs;

    List<dynamic> recommendedUsers = []; 

    for(var recommendedUser in users){
       var user = UserModel.fromJson(recommendedUser.data() as Map<String,dynamic>); 
       var distance = await calculateDistance(user.location!.latitude!, user.location!.longitude!);
      if(distance < currentUser.settings!.distance_preference!.distance!) {        
        if(currentUser.sexual_preference!.contains(user.sex) && !unWantedUsers.contains(user.userID)) {                  
          recommendedUsers.add(recommendedUser.data());
        }

      }

      if(recommendedUsers.length == 10) {      
        break;
      }
    }

   

    return recommendedUsers;


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