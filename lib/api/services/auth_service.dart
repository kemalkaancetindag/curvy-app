import 'package:curvy_app/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  final RxBool isPremium = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void setIsPremium(bool newValue) {
    isPremium.value = newValue;
  }

  
  Future<void> googleAuth() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
 
    final GoogleSignInAuthentication authentication =
        await account!.authentication;
    final credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user!;
        
    Get.toNamed(Routes.validationNumber);
    
  }

  Future<void> facebookAuth() async {
    
    LoginResult result =  await FacebookAuth.instance.login();
    print("MESAJ");
    print(result.message);
    
    Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
    print(userData);


  }

  Future<void> phoneAuth(String number) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: number,
    verificationCompleted: (PhoneAuthCredential credential) async {
    
      print("complete");
      print(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      print(e);
    },
    codeSent: (String verificationId, int? resendToken) async {
      print("sent");
      print(verificationId);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: "123123");
      UserCredential user = await auth.signInWithCredential(credential);
      print(user.user!.uid);

    },
    codeAutoRetrievalTimeout: (String verificationId) {

    },
  );

  }

  
}
