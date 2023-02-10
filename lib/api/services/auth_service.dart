import 'dart:convert';
import 'dart:math';

import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService extends GetxService {
  final FirestoreService firestoreService;
  final RxBool isPremium = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthService({
    required this.firestoreService
  });

  void setIsPremium(bool newValue) {
    isPremium.value = newValue;
  }

  
  Future<void> googleAuth() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    
    final GoogleSignInAuthentication authentication =
        await account!.authentication;
    final credential = GoogleAuthProvider.credential(idToken: authentication.idToken,accessToken: authentication.accessToken);
        

    final UserCredential authResult = await _auth.signInWithCredential(credential);
        
    final User user = authResult.user!;

    var result = await firestoreService.getCollection('users').where('userID', isEqualTo: user.uid).get();
    
    if(result.docs.isNotEmpty){

      await Get.find<SharedPreferenceService>().saveUser(result.docs[0].data() as Map<String,dynamic>);
      await Get.find<SharedPreferenceService>().setLastUserID(result.docs[0].id);
    
      Get.toNamed(Routes.index);     
    }
    else{
      print(user);
      Get.find<SetupController>().setGoogleUser(user);
            
      Get.toNamed(Routes.validationNumber);
    }
    

    
  }

  Future<void> facebookAuth() async {
      LoginResult loginResult = await FacebookAuth.instance.login();
      if(loginResult.status == LoginStatus.success) {
        var facebookCred = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        var data = await FirebaseAuth.instance.signInWithCredential(facebookCred);
        print(data.user!.email);
      }
      
  }

  

  Future<void> phoneAuth(String number, Function(String) callback) async {
   

    await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: number,
    verificationCompleted: (PhoneAuthCredential credential) async {                
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e);
    },
    codeSent: (String verificationId, int? resendToken) async {            
      callback(verificationId);           
    },
    codeAutoRetrievalTimeout: (String verificationId) {

    },
  );

 

  }

   Future<UserCredential> confirmPhoneCode(String code, String verificationId) async {
     FirebaseAuth auth = FirebaseAuth.instance;
     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId:verificationId , smsCode: code);
     UserCredential user = await auth.signInWithCredential(credential);
     return user;
  }

  Future<void> appleAuth() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCred = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
      nonce: nonce
    );

    final oAuthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCred.identityToken,
      rawNonce: rawNonce
    );

    final authResult = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

    final appleUser = authResult.user;

    var result = await firestoreService.getCollection('users').where('userID', isEqualTo: appleUser!.uid).get();

    if(result.docs.isNotEmpty) {
        await Get.find<SharedPreferenceService>().saveUser(result.docs[0].data() as Map<String,dynamic>);
        await Get.find<SharedPreferenceService>().setLastUserID(result.docs[0].id);
        Get.toNamed(Routes.index);     
    } else {
      Get.find<SetupController>().setAppleUser(appleUser);            
      Get.toNamed(Routes.validationNumber);
    }

    



    print(authResult.user!.email);


  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    
    final digest = sha256.convert(bytes);
    return digest.toString();
  }



}
