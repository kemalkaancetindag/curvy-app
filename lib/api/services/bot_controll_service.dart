import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/models/bot_info_model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:get/get.dart';

class BotControllService extends GetxService {
  
  FirestoreService firestoreService;

  BotControllService({
    required this.firestoreService
  });



  Future<List<dynamic>> getBotUsers() async {
    List<dynamic> botUsers = [];
    var bots = (await firestoreService.getCollection("users").where("bot",isEqualTo: 1).get()).docs;   
    return bots;
  } 

  Future<void> saveNewBotInfos(List<Map<String,dynamic>> newBotInfos, String userID) async {
    var updateData = Map<String,dynamic>();

    updateData['bot_info_list'] = newBotInfos;
    firestoreService.updateUser(updateData, userID);
  }


}