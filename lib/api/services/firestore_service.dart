

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/models/chat.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/util/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> uploadImage(File image, String imageRef) async {
      final userImageRefrence = FirebaseStorage.instance.ref(imageRef);
      await userImageRefrence.putFile(image);
  }

  Future<void> updateUser(Map<String,dynamic> data, String userID) async{
    var userSnapshot = await  getCollection('users').where('userID', isEqualTo: userID).get();
    if(userSnapshot.docs.isNotEmpty){
      String documentId = userSnapshot.docs[0].reference.id;
      print(documentId);
      print(data);
      await getCollection('users').doc(documentId).update(data);
    }
  }

  Future<void> checkInternet(String data) async {
    var db = _getDb();
    var data = Map<String,dynamic>();
    data['test'] = data;
    await db.collection('test').add(data);
  }

  Future<UserModel> getCurrentUser(String userID) async {
    var userSnapshot = await  getCollection('users').where('userID', isEqualTo: userID).get();
    var user = UserModel.fromJson(userSnapshot.docs[0].data() as Map<String,dynamic>);
    return user;
  }

  Future<Chat> getChat(String chatID) async {
    var chatSnapshot = await getCollection('chats').doc(chatID).get();
    var chat =  Chat.fromJson(chatSnapshot.data() as Map<String,dynamic>);
    return chat;
  } 

  Future<void> sendMessageToChat(Map<String,dynamic> data, String chatID) async {
    await getCollection('chats').doc(chatID).update(data);
  }

   Future<void> updateChat(Map<String,dynamic> data, String chatID) async {
    await getCollection('chats').doc(chatID).update(data);
  }


  Future<UserModel> getUser(String userID) async {
    var userData = ((await getCollection('users').where('userID',isEqualTo: userID).get()).docs[0].data() as Map<String,dynamic>);
    var user = UserModel.fromJson(userData);
    return user;
  }





}

