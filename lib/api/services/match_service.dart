import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:get/get.dart';

class MatchService extends GetxService {
  FirestoreService firestoreService;

  MatchService({required this.firestoreService});

  @override
  Future<void> onInit() async {
    super.onInit();
    checkForMatch('1', '2');
    
  }

  Future<void> checkForMatch(String user1ID, String user2ID) async {
    var matchCheckSnapshot = await firestoreService.getCollection('matches')
    .where('user1.id', isEqualTo: user1ID)
    .where('user2.id', isEqualTo: user2ID)
    .where('user1.liked', isEqualTo: true)    
    .where('user2.liked', isEqualTo: null)
    .get();


    if(matchCheckSnapshot.docs.isEmpty) {
      Map<String,dynamic> newMatch = Map<String,dynamic>();
      Map<String,dynamic> user1Data = Map<String,dynamic>();
      Map<String,dynamic> user2Data = Map<String,dynamic>();
      user1Data['id'] = user1ID;
      user1Data['liked'] = true;
      newMatch['user1'] = user1Data;

      user2Data['id'] = user2ID;
      user2Data['liked'] = null;
      newMatch['user2'] = user2Data;      
      await firestoreService.getCollection('matches').add(newMatch);
      
    }

    
  }

 

}