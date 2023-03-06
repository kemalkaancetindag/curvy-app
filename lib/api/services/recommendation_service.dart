import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/enums/showme_enum.dart';
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
    var currentUserDistancePref = currentUser.settings!.distance_preference!.distance!;
    var users;

    if(currentUserDistancePref <= 100 && currentUserDistancePref > 40) {
      users = (await firestoreService.getCollection("users").where("userID", isNotEqualTo: currentUserId).where("location.geohash.km100", isEqualTo: currentUser.location!.geohash!.km100).get()).docs;
    } else if(currentUserDistancePref <= 40 && currentUserDistancePref > 5) {
      users = (await firestoreService.getCollection("users").where("userID", isNotEqualTo: currentUserId).where("location.geohash.km40", isEqualTo: currentUser.location!.geohash!.km40).get()).docs;
    } else if(currentUserDistancePref <= 5 && currentUserDistancePref > 2) {
      users = (await firestoreService.getCollection("users").where("userID", isNotEqualTo: currentUserId).where("location.geohash.km5", isEqualTo: currentUser.location!.geohash!.km5).get()).docs;
    } else if(currentUserDistancePref <= 2){
      users = (await firestoreService.getCollection("users").where("userID", isNotEqualTo: currentUserId).where("location.geohash.km2", isEqualTo: currentUser.location!.geohash!.km2).get()).docs;
    }
    

    List<dynamic> recommendedUsers = []; 

    for(var recommendedUser in users){
       var user = UserModel.fromJson(recommendedUser.data() as Map<String,dynamic>);       
       
      if((currentUser.show_me! == user.sex && !unWantedUsers.contains(user.userID))) {                  
          recommendedUsers.add(recommendedUser.data());
      }

      if(currentUser.show_me == Showme.all.value && !unWantedUsers.contains(user.userID)) {
        recommendedUsers.add(recommendedUser.data());
      }

      if(recommendedUsers.length == 10) {      
        break;
      }
    }

   

    return recommendedUsers;


  }

  

}