import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class ArchiveService extends GetxService {
  FirestoreService firestoreService;

  ArchiveService({required this.firestoreService});


  Future<List<UserModel>> getUsersWhoLikedMe() async {
    List<UserModel> usersWhoLikedMe = [];
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await firestoreService.getCurrentUser(userID);
    await Future.forEach(currentUser.users_who_liked_me!,(loopUserID) async { 
      var user = await firestoreService.getUser(loopUserID);
      usersWhoLikedMe.add(user);
    });

    return usersWhoLikedMe;
  }

  Future<void> addLikedUsers(String likedUserId) async {
    Map<String,dynamic> data = Map<String,dynamic>();

    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    UserModel user = await firestoreService.getCurrentUser(userID);
    print(user.users_i_liked);

    List<dynamic>? newILikedList = user.users_i_liked;
    newILikedList!.add(likedUserId);

    data["users_i_liked"] = newILikedList;
  
    await firestoreService.updateUser(data, userID);

  }


  Future<List<dynamic>> getUsersILiked() async {
    List<UserModel> usersILiked = [];
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await firestoreService.getCurrentUser(userID);
    
    return currentUser.users_i_liked!;
  }

  Future<List<dynamic>> getVipProfiles() async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    List<dynamic> vipProfilesList = [];

    var vipProfiles = (await firestoreService.getCollection("vip_profiles").orderBy("like_count").get()).docs;

    vipProfiles.forEach((profile) { 
      if((profile.data() as Map<String,dynamic>)["userID"] != currentUserID){
        vipProfilesList.add((profile.data() as Map<String,dynamic>)["userID"]);
      }      
      
    });
    
    
    return vipProfilesList;
  }
}