import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/interest.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  FirebaseFirestore _getDb() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db;
  }

  CollectionReference getCollection(String collectionName) {
    FirebaseFirestore db = _getDb();
    CollectionReference collection = db.collection(collectionName);
    return collection;
  }

  Future<List<String>> uploadImages(List<String> images, String userID) async {
    Random random = Random();
    List<String> userImages = [];

    for (var image in images) {
      String mimeType = Utils.getMimetype(image);
      int randomInt = random.nextInt(9999999);
      final userImageRefrence = FirebaseStorage.instance
          .ref('user-images/$userID/$randomInt.$mimeType');
      await userImageRefrence.putFile(File(image));
      userImages.add('user-images/$userID/$randomInt.$mimeType');
    }

    return userImages;
  }

  Future<String> addToCollection(
      Map<String, dynamic> jsonMap, String collectionName, String loginMethod) async {
        print(loginMethod);
    FirebaseFirestore db = _getDb();
    CollectionReference collection = db.collection(collectionName);

    var collectionRef = await collection.add(jsonMap);
    return collectionRef.id;
  }

  Future<void> uploadImage(File image, String imageRef) async {
    final userImageRefrence = FirebaseStorage.instance.ref(imageRef);
    await userImageRefrence.putFile(image);
  }

  Future<void> updateUser(Map<String, dynamic> data, String userID) async {
    print("SEDDDDDD");
    print(data);
    var userSnapshot =
        await getCollection('users').where('userID', isEqualTo: userID).get();
    if (userSnapshot.docs.isNotEmpty) {
      String documentId = userSnapshot.docs[0].reference.id;
      await getCollection('users').doc(documentId).update(data);
    }
  }

  Future<void> checkInternet(String data) async {
    var db = _getDb();
    var data = Map<String, dynamic>();
    data['test'] = data;
    await db.collection('test').add(data);
  }

  Future<UserModel> getCurrentUser(String userID) async {
    var userSnapshot =
        await getCollection('users').where('userID', isEqualTo: userID).get();
    var user =
        UserModel.fromJson(userSnapshot.docs[0].data() as Map<String, dynamic>);
    return user;
  }

  Future<Chat> getChat(String chatID) async {
    var chatSnapshot = await getCollection('chats').doc(chatID).get();
    var chat = Chat.fromJson(chatSnapshot.data() as Map<String, dynamic>);
    return chat;
  }

  Future<void> sendMessageToChat(
      Map<String, dynamic> data, String chatID) async {
    await getCollection('chats').doc(chatID).update(data);
  }

  Future<void> updateChat(Map<String, dynamic> data, String chatID) async {
    await getCollection('chats').doc(chatID).update(data);
  }

  Future<UserModel> getUser(String userID) async {
    var userData =
        ((await getCollection('users').where('userID', isEqualTo: userID).get())
            .docs[0]
            .data() as Map<String, dynamic>);
    var user = UserModel.fromJson(userData);
    return user;
  }

  Future<Map<String, dynamic>?> getUserByPhoneNumber(String phoneNumber) async {
    var users = (await getCollection('users')
            .where("phone_number", isEqualTo: phoneNumber)
            .get())
        .docs;

    if (users.isEmpty) {
      return null;
    } else {
      return (users[0].data() as Map<String, dynamic>);
    }
  }

  Future<Map<String, dynamic>?> getUserAsMap(String userID) async {
    var userDocs =
        (await getCollection('users').where("userID", isEqualTo: userID).get())
            .docs;

    if (userDocs.isNotEmpty) {
      return (userDocs[0].data() as Map<String, dynamic>);
    }

    return null;
  }

  Future<Interest> getUserInterest(int interestID) async {
    var interests =
        ((await getCollection('app_storage').doc('LjrAgyjTlqUahB9JIdbe').get())
            .data() as Map<String, dynamic>)['interests'];
    var interest = interests
        .where((interest) => interest['interest_type'] == interestID)
        .toList()[0];
    var interestModel = Interest.fromJson(interest);
    return interestModel;
  }

  Future<List<Interest>> getInterests() async {
    List<Interest> interestModels = [];
    var interests =
        ((await getCollection('app_storage').doc('LjrAgyjTlqUahB9JIdbe').get())
            .data() as Map<String, dynamic>)['interests'] as List<dynamic>;

    interests.forEach((interest) {
      interestModels.add(Interest.fromJson(interest as Map<String, dynamic>));
    });

    return interestModels;
  }

  Future<bool> spendCurvyChip(String userID, int amount) async {
    UserModel user = await getUser(userID);

    if (user.curvy_chip! < amount) {
      Get.snackbar("Hata",
          "Bu işlemi gerçekleştirmek için CurvyCHIP bakiyeniz yetersiz.",
          colorText: Colors.white, backgroundColor: Color(0xFFD51CFF));
      return false;
    }

    var updateData = Map<String, dynamic>();
    updateData['curvy_chip'] = user.curvy_chip! - amount;

    await updateUser(updateData, userID);
    return true;
  }

  Future<bool> spendCurvyLike(String userID, int amount) async {
    UserModel user = await getUser(userID);

    if (user.curvy_like! < amount) {
      Get.snackbar("Hata",
          "Bu işlemi gerçekleştirmek için CurvyLIKE bakiyeniz yetersiz.",
          colorText: Colors.white, backgroundColor: Color(0xFFD51CFF));
      return false;
    }

    var updateData = Map<String, dynamic>();
    updateData['curvy_like'] = user.curvy_like! - amount;

    await updateUser(updateData, userID);
    return true;
  }

  Future updateUsersGeoHash() async {
    var currentUserID = Get.find<SharedPreferenceService>().getUserID();
    var locationData = Map<String,dynamic>();
    var updateData = Map<String,dynamic>();    
    var hashData = Map<String,dynamic>();
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

    var lat = position.latitude;
    var long = position.longitude;


    

    for(int i = 0; i < 4; i++ ) {

        

      switch(i) {
        case 0:
          var hash = Utils.encode(long, lat, 3);
          hashData["km100"] = hash;
          break;          
        case 1:
        var hash = Utils.encode(long, lat, 4);
          hashData["km40"] = hash;
          break;
        case 2:
          var hash = Utils.encode(long, lat, 5);
          hashData["km5"] = hash;
          break;
        case 3:
          var hash = Utils.encode(long, lat, 6);
          hashData["km2"] = hash;
          break;
      }
      
    }    

    locationData["latitude"] = lat;
    locationData["longitude"] = long;
    locationData["geohash"] = hashData;
    updateData["location"] = locationData;

    await updateUser(updateData, currentUserID!);
  
  } 

  Future<void> updateMatch(String user1ID, String user2ID) async {
    var matchDoc = (await getCollection("matches").where("user1.id", isEqualTo: user1ID).where("user2.id", isEqualTo: user2ID).get()).docs.first;
    var newMatchDoc = (matchDoc.data() as Map<String,dynamic>);
    newMatchDoc["user1"]["liked"] = true;
    newMatchDoc["user2"]["liked"] = true;
    await getCollection("matches").doc(matchDoc.id).update(newMatchDoc);
  }
}
