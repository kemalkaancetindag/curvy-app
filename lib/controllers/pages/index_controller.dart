import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/general_app_state_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/api/services/user_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:camera/camera.dart';
import 'package:curvy_app/controllers/pages/confirm_me_controller.dart';
import 'package:curvy_app/controllers/setup_controller.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/screens/confirm_me.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPageController extends GetxController {
    UserService userService;
    String? _userID;

    UserModel? _user;
    UserModel? get user => _user;

    int? _compilation;
    int? get compilation => _compilation;

    int? tappedButton;

    IndexPageController({
      required this.userService
    });

    @override
  Future<void> onInit() async {    
    super.onInit();
    
    _userID = Get.find<SharedPreferenceService>().getUserID();
    _compilation = await calculateCompilationPercent();
    update();
    await Get.find<GeneralAppStateService>().setUserStatusOnline();    
    
    await setUser();
    
    await Get.find<GeneralAppStateService>().updateLocation();
    await Get.find<GeneralAppStateService>().updateInstanceToken();
    
    
    
  }

  void buttonAnimation(int? id) {
    tappedButton = id;
    update();
  }

  void showConfirmationDialog() {
      showGeneralDialog(
            context: Get.context!,
            pageBuilder: (context, _, __) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Dimensions.w300,
                        height: Dimensions.h450,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.h16)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: Dimensions.h21),
                              child: Center(
                                child: Image.asset(
                                    "assets/images/confirm_me_icon.png"),
                              ),
                            ),
                            Container(
                              width: Dimensions.w267,
                              height: Dimensions.h42,
                              child: Center(
                                child: Text(
                                  "Nasıl Çalışır?",
                                  style: TextStyle(
                                      fontSize: Dimensions.h27,
                                      color: Color(0xFF7B8491),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              width: Dimensions.w267,
                              height: Dimensions.h148,
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style:
                                          TextStyle(color: Color(0xFF7B8491)),
                                      text:
                                          "Yüz tanıma teknolojimiz, video selfinde bulunan yüzü profilindeki fotoğraflarla karşılaştırır. Doğrulama tamamlandıktan sonra, genellikle 24 saatten kısa bir süre içerisinde yüz tanıma bilgilerini sileriz.",
                                      children: [
                                        TextSpan(
                                            text:
                                                " Bunun nasıl çalıştığı hakkında daha fazla bilgi edin.",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color(0xFF7B8491)))
                                      ]),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await availableCameras().then(((value) {
                                  print("DESC");
                                  print(value.length);
                                  
                                  Get.find<SetupController>()
                                      .setAfterSetup(false);
                                  Get.back();
                                  
                                  Get.put(ConfirmMeController(cameras: value));
                                  Get.to(() => ConfirmMePage(cameras: value));
                                }));
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: Dimensions.h50 / 2),
                                width: Dimensions.w222,
                                height: Dimensions.h50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.h50 / 2),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFD51CFF),
                                          Color(0xFF00FFE1)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)),
                                child: Center(
                                  child: Text(
                                    "Beni Doğrula",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Dimensions.h22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: Dimensions.h21),
                                  width: Dimensions.w222,
                                  height: Dimensions.h50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.4),
                                          width: Dimensions.w300 / 100),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h50 / 2)),
                                  child: Center(
                                    child: Text(
                                      "Belki daha sonra",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: Dimensions.h22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
  }

    Future<void> setUser() async {
      UserModel? user = await userService.getUser(_userID!);
      _user = user;
      update();
    }
  
  Future<int> calculateCompilationPercent() async {
    double percentPerField = 100/13;
    double compilation = 0;
    var user = await Get.find<FirestoreService>().getUser(_userID!);

    if(user.zodiac != null) {
      compilation += percentPerField;
    }

    if(user.person_type != null) {
      compilation += percentPerField;
    }

    if(user.pet_preference != null) {
      compilation += percentPerField;
    }

    if(user.smoke_preference != null) {
      compilation += percentPerField;
    }

    if(user.alchol_preference != null) {
      compilation += percentPerField;
    }

    if(user.job != null && user.job!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.city != null && user.city!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.about != null && user.about!.isNotEmpty) {
      compilation += percentPerField;
    }

    if(user.interests != null && user.interests!.isNotEmpty) {
      compilation += percentPerField;
    }

    compilation += (3 * percentPerField);

    



    return compilation.toInt();
    
  }



  

}