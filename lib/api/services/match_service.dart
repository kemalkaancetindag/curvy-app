import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class MatchService extends GetxService {
  FirestoreService firestoreService;

  MatchService({required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();        
  }

  Future<void> createMatch(String likedUserID) async {
    String currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var matchCheckSnapshot = await firestoreService.getCollection('matches')
    .where('user1.id', isEqualTo: currentUserID)
    .where('user2.id', isEqualTo: likedUserID)
    .where('user1.liked', isEqualTo: true)    
    .where('user2.liked', isEqualTo: null)
    .get();


    if(matchCheckSnapshot.docs.isEmpty) {

      var currentUserDoc = (await firestoreService.getCollection('users').where('userID', isEqualTo: currentUserID).get()).docs[0];
      var likedUserDoc = (await firestoreService.getCollection('users').where('userID', isEqualTo: likedUserID).get()).docs[0];

      var likedUserUpdateData = Map<String,dynamic>();
      var currentUserUpdateData = Map<String,dynamic>();

      var likedUserNewUsersWhoLikedMeList = UserModel.fromJson(likedUserDoc.data() as Map<String,dynamic>).users_who_liked_me;
      
      if(likedUserNewUsersWhoLikedMeList == null){
        likedUserUpdateData['users_who_liked_me'] = [currentUserID];        
      }
      else{
        likedUserNewUsersWhoLikedMeList.add(currentUserID);
        likedUserUpdateData['users_who_liked_me'] = likedUserNewUsersWhoLikedMeList;
      }
      

      var currentUsersNewUsersILikedList = UserModel.fromJson(currentUserDoc.data() as Map<String,dynamic>).users_i_liked;
      currentUsersNewUsersILikedList!.add(likedUserID);


      
      currentUserUpdateData['users_i_liked'] = currentUsersNewUsersILikedList;

      await firestoreService.getCollection('users').doc(currentUserDoc.id).update(currentUserUpdateData);
      await firestoreService.getCollection('users').doc(likedUserDoc.id).update(likedUserUpdateData);




      Map<String,dynamic> newMatch = Map<String,dynamic>();
      Map<String,dynamic> user1Data = Map<String,dynamic>();
      Map<String,dynamic> user2Data = Map<String,dynamic>();
      user1Data['id'] = currentUserID;
      user1Data['liked'] = true;
      newMatch['user1'] = user1Data;

      user2Data['id'] = likedUserID;
      user2Data['liked'] = null;
      newMatch['user2'] = user2Data;      
      await firestoreService.getCollection('matches').add(newMatch);

      
    }

    
  }

  Future<void> dislikeUser(String dislikedUserID) async {
    String currenUserID = Get.find<SharedPreferenceService>().getUserID();
    var currentUserDoc = (await firestoreService.getCollection('users').where('userID',isEqualTo: currenUserID).get()).docs[0];
    var user = UserModel.fromJson(currentUserDoc.data() as Map<String,dynamic>);

    var newUserDislikeList = user.un_liked_users!;
    newUserDislikeList.add(dislikedUserID);

    var data = Map<String,dynamic>();
    data['un_liked_users'] = newUserDislikeList;

    await firestoreService.getCollection('users').doc(currentUserDoc.id).update(data);
    
  }

 

}