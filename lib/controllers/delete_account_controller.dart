import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/enums/login_method_enums.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  FirestoreService firestoreService;

  int? _deleteType;
  int? get deleteType => _deleteType;

  String _feedBackText = "";
  String get feedBackText => _feedBackText;


  DeleteAccountController({
    required this.firestoreService
  });

  void setDeleteType(int type) {    
    _deleteType = type;

    Get.toNamed(Routes.sendFeedback);
  }

  void setFeedBackText(String text) {
    _feedBackText = text;
    update();
  }

  void deleteAccount() async {
    String? userID = Get.find<SharedPreferenceService>().getUserID();
    print(userID);
    

    if(userID != null) {
      UserModel user = await firestoreService.getUser(userID);

      if(user.platinum_member! || user.plus_member!){
        Get.snackbar(
          "Hata", 
          "Premium üyeler üyelikleri bitene kadar hesaplarını silemez",
          backgroundColor: Color(0xFFD51CFF),
          colorText: Colors.white
        );
        return; 
      }
      else if (user.login_method! == LoginMethod.google.value){
        
        var data = Map<String,dynamic>();
        data["userID"] = userID;
        data["type"] = _deleteType;
        data["text"] = _feedBackText;
        await firestoreService.getCollection("delete_account_request").doc().set(data);      
      }      


    }

  }

  





}