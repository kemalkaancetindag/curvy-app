import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  FirestoreService firestoreService;

  UserService({
    required this.firestoreService
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    getUser('SHmcTGDSV1f0HmPV7QBPOGEixcW2');
  }


  Future<UserModel?> getUser(String userId) async {
    var userSnapshot = await firestoreService.getCollection('users').where('userID',isEqualTo: userId).get();
    if(userSnapshot.docs.isNotEmpty){
      var user = userSnapshot.docs[0].data();      
      var userModel = UserModel.fromJson((user as Map<String,dynamic>));    
      
      return userModel;
    }

    return null;

  }

}