

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';


class FirestoreService extends GetxService {
  FirebaseFirestore _getDb(){
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
    
    
    for(var image in images){
      String mimeType = Utils.getMimetype(image);      
      int randomInt = random.nextInt(9999999);
      final userImageRefrence = FirebaseStorage.instance.ref('user-images/$userID/$randomInt.$mimeType');
      await userImageRefrence.putFile(File(image));
      userImages.add('user-images/$userID/$randomInt.$mimeType');
    }

    return userImages;    
  
  }

  Future<void> addToCollection(Map<String, dynamic> jsonMap, String collectionName) async {
    FirebaseFirestore db = _getDb();
    CollectionReference collection = db.collection(collectionName);

    await collection.add(jsonMap);
  }

}

