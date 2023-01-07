import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class UserDetailController extends GetxController {
  FirestoreService firestoreService;

  UserModel? _user;
  UserModel? get user => _user;

  int beforeImageIndex = -1;
  int currentImageIndex = 0;
  int nextImageIndex = 1;

  List<List<double>> _imagePositions = [];
  List<List<double>> get imagePositions => _imagePositions;

  List<Widget> _imageIndicators = [];
  List<Widget> get imageIndicators => _imageIndicators;

  List<Widget> _imageCarousel = [];
  List<Widget> get imageCarousel => _imageCarousel;


  int? _distance;
  int? get distance => _distance;

  String userID;

  UserDetailController({required this.firestoreService, required this.userID});

  @override
  Future<void> onInit() async {
    await getInitialUser();
    listenUser(userID);
  }

  Future<void> getInitialUser() async {
    print(userID);
    _user = await firestoreService.getUser(userID);
    _distance = await calculateDistance(_user!.location!.latitude!, _user!.location!.longitude!,);   
    createPage();
    update();
  }

  void listenUser(String userID) async {
    var currentUserDoc = (await firestoreService
            .getCollection('users')
            .where('userID', isEqualTo: userID)
            .get())
        .docs[0];

    Stream<DocumentSnapshot> currentUserStream = firestoreService
        .getCollection('users')
        .doc(currentUserDoc.id)
        .snapshots();

    await for (var user in currentUserStream) {
      print("degisti");
      var userObject = UserModel.fromJson(user.data() as Map<String, dynamic>);
      _user = userObject;
      _distance = await calculateDistance(userObject.location!.latitude!, userObject.location!.longitude!);
      createPage();
      update();

    }
   
  }

  void createPage() {
    _imageCarousel = [];
    _imageIndicators = [];
    _imagePositions = [];


    for (int i = 0; i < _user!.images!.length; i++) {
      print(i);
      if (i == 0) {
        _imagePositions.add([0, 0]);
      } else {
        _imagePositions.add([Get.width, -Get.width]);

      
      }
        _imageCarousel.add(
          GetBuilder<UserDetailController>(
            builder: (controller){
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
              left: controller.imagePositions[i][0],
              top: 0,
              bottom: 0,
              right: controller.imagePositions[i][1],
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_user!.images![i])}?alt=media'),
                        fit: BoxFit.fill)),
              ));
            }
          )
        
        );

      _imageIndicators
          .add(GetBuilder<UserDetailController>(builder: (controller) {
        return Container(
          width: (Get.width / (_user!.images!.length + 0.5)),
          height: Dimensions.h60 / 10,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.h50 / 10)),
          child: Center(
            child: Container(
              width: (Get.width / (_user!.images!.length + 0.5)) / 1.05,
              height: Dimensions.h100 / 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h100 / 50),
                  gradient: controller.currentImageIndex == i
                      ? LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
                      : null),
            ),
          ),
        );
      }));
    }

    _imageCarousel.add(
      Positioned(
        top: Dimensions.h17,
        child: Container(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _imageIndicators,
          ),
        )
      )
    );

    _imageCarousel.add(
      Positioned(
          left: Dimensions.w270 / 10,
          top: Dimensions.h45,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.h8),
                  child: Image.asset("assets/images/report.png"),
                ),
                Container(
                    margin: EdgeInsets.only(top: Dimensions.h8),
                    child: Image.asset("assets/images/share.png"))
              ],
            ),
          )),
    );

    _imageCarousel.add(Positioned(
        right: Dimensions.w270 / 10,
        bottom: -Dimensions.h50 / 2,
        child: GestureDetector(
          onTap: (){
            Get.back();            
            clearState();
            Get.delete<UserDetailController>();
          },
          child: Container(
          width: Dimensions.h50,
          height: Dimensions.h50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.h50 / 2),
              gradient: LinearGradient(
                  colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
          child: Center(
            child: Image.asset("assets/images/expand_icon.png"),
          ),
        ),
        )));
  

    update();
  }

  void controllCarousel(double localX, double localY) {

    if(localY < Dimensions.h520 - (Dimensions.h50/2)){
      if(localX < (Get.width/2)){        
        if(beforeImageIndex >= 0){
            currentImageIndex = currentImageIndex - 1;
            nextImageIndex = currentImageIndex + 1;
            beforeImageIndex = currentImageIndex - 1;

            _imagePositions[currentImageIndex][0] = 0;
            _imagePositions[currentImageIndex][1] = 0;

            _imagePositions[nextImageIndex][0] = Get.width;
            _imagePositions[nextImageIndex][1] = -Get.width;
        }

      }
      else if(localX > (Get.width/2)) {
        if(nextImageIndex < _user!.images!.length){
          currentImageIndex = currentImageIndex + 1;
          nextImageIndex = currentImageIndex + 1;
          beforeImageIndex = currentImageIndex - 1;

          _imagePositions[currentImageIndex][0] = 0;
          _imagePositions[currentImageIndex][1] = 0;

          _imagePositions[beforeImageIndex][0] = -Get.width;
          _imagePositions[beforeImageIndex][1] = Get.width;
        }
      }
    }

    update();

  }


 Future<int> calculateDistance(double lat2, double lon2) async {
    String userID = Get.find<SharedPreferenceService>().getUserID();
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);
    var lat1 = currentUser.location!.latitude!;
    var lon1 = currentUser.location!.longitude!;
    var dLat = (lat2 - lat1) * math.pi / 180.0;
    var dLon = (lon2 - lon1) * math.pi / 180.0;
    var latTimesPi1 = (lat1) * math.pi / 180.0;
    var latTimesPi2 = (lat2) * math.pi / 180.0;

    var a = (math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) *
            math.cos(latTimesPi1) *
            math.cos(latTimesPi2));
    var rad = 6371;
    var c = 2 * math.asin(math.sqrt(a));

    return (rad * c).toInt();
  }

void clearState() {
  currentImageIndex = 0;
  nextImageIndex = 1;
  beforeImageIndex = -1;
  _user = null;
  _imagePositions = [];
  _imageCarousel = [];
  _imageIndicators = [];    
}

}
