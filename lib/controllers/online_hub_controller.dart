import 'dart:async';

import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/hub_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/models/hub_storage.model.dart';
import 'package:curvy_app/models/online_hub.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:curvy_app/ui/screens/hub.dart';
import 'package:curvy_app/ui/widgets/matcher_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineHubController extends GetxController {
  HubService hubService;
  String hubId;
  OnlineHub? _hubData;
  OnlineHub? get hubData => _hubData;

  HubStorageModel? _hubStorageData;
  HubStorageModel? get hubStorageData => _hubStorageData;

  int _remainingTime = 10;
  int get remainingTime => _remainingTime;

  bool? _amIAlone = true;
  bool? get amIAlone => _amIAlone;

  double _popUpBottomPosition = Dimensions.h14;
  double get popUpBottomPosition => _popUpBottomPosition;

  List<UserModel>? _onlineUsers;
  List<UserModel>? get onlineUsers => _onlineUsers;

  int _currentUserIndex = 0;
  int get currentUserIndex => _currentUserIndex;

  List<List<double>>? _positions;
  List<List<double>>? get positions => _positions;

  List<Widget>? _foundCurrentUserCarousel;
  List<Widget>? get foundCurrentUserCarousel => _foundCurrentUserCarousel;

  int? beforeImageIndex;
  int currentImageIndex = 0;
  int nextImageIndex = 1;

  Timer? _timer;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  bool isMessageAreaExpanded = false;

  bool stopTimer = false;

  OnlineHubController({required this.hubService, required this.hubId});

  @override
  Future<void> onInit() async {
    hubService.listenHub(hubId);
  }

  Future<void> updateHubData(OnlineHub updatedData, HubStorageModel storedHub) async {
    String currentUserId = Get.find<SharedPreferenceService>().getUserID();
    _currentUser = await Get.find<FirestoreService>().getUser(currentUserId);
    


    _hubData = updatedData;
    _hubStorageData = storedHub;

    var onlineUserIDS =
        updatedData.users!.where((id) => id != currentUserId).toList();

    onlineUserIDS = onlineUserIDS
        .where((id) => !_currentUser!.users_i_liked!.contains(id))
        .toList();

    onlineUserIDS = onlineUserIDS
        .where((id) => !_currentUser!.un_liked_users!.contains(id))
        .toList();

    if (onlineUserIDS.isEmpty) {
      _amIAlone = true;
      if(_timer != null){
        _timer!.cancel();
      }
      else{
        
      }
      Timer.periodic(Duration(seconds: 1), (timer) {
        _timer = timer;
        
        if (stopTimer) {
          timer.cancel();
        }

        _remainingTime = _remainingTime - 1;

        if (_remainingTime == 0) {
          _timer!.cancel();
          if (_hubData!.hub_type! + 1 != 19) {
            _remainingTime = 10;
            hubService.nextHub(_hubData!.hub_type! + 1, _hubData!.hub_id!);
          }
        }

        update();
      });
    } else {
      
      _amIAlone = false;
      _onlineUsers = [];
      await Future.forEach(onlineUserIDS, (userID) async {
        var onlineUserModel =
            await Get.find<FirestoreService>().getUser(userID);
        _onlineUsers!.add(onlineUserModel);
      });
      
      generateFoundSlider();
      update();
    }
  }

  void slidePopUp(double yChange) {
    _popUpBottomPosition = _popUpBottomPosition - yChange;
    update();
  }

  void decidePopUpAction() {
    if (_popUpBottomPosition < -200) {
      _popUpBottomPosition = -Get.height;
      stopTimer = true;
      _remainingTime = 10;
    } else {
      _popUpBottomPosition = Dimensions.h14;
    }

    update();
  }

  void generateFoundSlider() {
    currentImageIndex = 0;
    nextImageIndex = 1;
    beforeImageIndex = null;
    _positions = [];

    _foundCurrentUserCarousel = [];

    for (int i = 0; i < _onlineUsers![_currentUserIndex].images!.length; i++) {
      if (i == 0) {
        _positions!.add([0, 0]);
      } else {
        _positions!.add([Get.width, -Get.width]);
      }

      _foundCurrentUserCarousel!
          .add(GetBuilder<OnlineHubController>(builder: (controller) {
        return AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            top: 0,
            bottom: 0,
            left: controller.positions![i][0],
            right: controller.positions![i][1],
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(controller.onlineUsers![controller.currentUserIndex].images![i])}?alt=media'),
                      fit: BoxFit.fill)),
            ));
      }));
    }

    _foundCurrentUserCarousel!.add(
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: Dimensions.h100,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.h16 * 2),
                bottomRight: Radius.circular(Dimensions.h16 * 2),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ])),
        ),
      ),
    );

    _foundCurrentUserCarousel!.add(
      Positioned(
          bottom: Dimensions.h7 * 13,
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          _onlineUsers![_currentUserIndex].online_status!
                              ? Container(
                                  width: Dimensions.h8,
                                  height: Dimensions.h8,
                                  margin: EdgeInsets.only(
                                      left: Dimensions.w11,
                                      right: Dimensions.w9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h8 / 2),
                                      color: Color(0xFF05ED00)),
                                )
                              : Container(),
                          Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.h16 * 2,
                                      fontWeight: FontWeight.bold),
                                  text:
                                      "${_onlineUsers![_currentUserIndex].name!.split(" ").first},",
                                  children: [
                                    TextSpan(
                                        text:
                                            "${DateTime.now().year - int.parse(_onlineUsers![_currentUserIndex].birthdate!.split("/").last)}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h230 / 10))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: Dimensions.w8),
                            child: Center(
                              child: Image.asset(
                                  "assets/images/location_white.png"),
                            ),
                          ),
                          Container(
                            child: Text(
                              "10km uzaklıkta",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Image.asset("assets/images/expand_icon.png"),
                    )
                  ],
                )
              ],
            ),
          )),
    );

    _foundCurrentUserCarousel!.add(
      Positioned(
          left: 0,
          right: 0,
          bottom: Dimensions.h12,
          child: Container(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () async {
                    await Get.find<OnlineHubController>().goBack();
                  },
                  child:  Container(
                  child: Center(
                    child: Image.asset("assets/images/matcher_back.png"),
                  ),
                ),
                ),
               
                GestureDetector(
                  onTap: () {
                    Get.find<OnlineHubController>().dislikeUser();
                  },
                  child: Container(
                    child: Center(
                      child: Image.asset("assets/images/matcher_dislike.png"),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Image.asset("assets/images/matcher_superlike.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<OnlineHubController>().likeUser();
                  },
                  child: Container(
                    child: Center(
                      child: Image.asset("assets/images/matcher_like.png"),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Image.asset("assets/images/matcher_turbo.png"),
                  ),
                )
              ],
            ),
          )),
    );

    List<Widget> indicatorList = [];

    for (int i = 0; i < _onlineUsers![_currentUserIndex].images!.length; i++) {
      indicatorList.add(GetBuilder<OnlineHubController>(builder: (controller) {
        return Container(
          width: Dimensions.w300 /
              (_onlineUsers![_currentUserIndex].images!.length + 0.5),
          height: Dimensions.h7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.h50 / 10)),
          child: Center(
            child: Container(
              width: (Dimensions.w300 /
                      (_onlineUsers![_currentUserIndex].images!.length + 0.5)) /
                  1.1,
              height: Dimensions.h7 / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h8 / 4),
                  gradient: controller.currentImageIndex == i
                      ? LinearGradient(
                          colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])
                      : null),
            ),
          ),
        );
      }));
    }

    _foundCurrentUserCarousel!.add(Positioned(
        left: 0,
        right: 0,
        top: Dimensions.h22,
        child: Container(
          width: Dimensions.w300,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: indicatorList),
        )));
  }

  void controlCurrentUserCarousel(double xLocation, double yLocation) {
    if (xLocation < Get.width / 2) {
      if (currentImageIndex != 0) {
        currentImageIndex = currentImageIndex - 1;
        beforeImageIndex = currentImageIndex - 1;
        nextImageIndex = currentImageIndex + 1;

        _positions![currentImageIndex][0] = 0;
        _positions![currentImageIndex][1] = 0;

        _positions![nextImageIndex][0] = Get.width;
        _positions![nextImageIndex][1] = -Get.width;
      }
    } else {
      if (nextImageIndex < _onlineUsers![_currentUserIndex].images!.length) {
        currentImageIndex = currentImageIndex + 1;
        beforeImageIndex = currentImageIndex - 1;
        nextImageIndex = currentImageIndex + 1;

        _positions![currentImageIndex][0] = 0;
        _positions![currentImageIndex][1] = 0;

        _positions![beforeImageIndex!][0] = -Get.width;
        _positions![beforeImageIndex!][1] = Get.width;
      }
    }

    update();
  }

  void expandMessageArea() {
    isMessageAreaExpanded = !isMessageAreaExpanded;
    update();
  }

  Future<void> leftHub() async {
    _timer!.cancel();
    await hubService.stopListeningHub();
    _hubStorageData = null;
    _popUpBottomPosition = Dimensions.h14;
    _remainingTime = 10;
    stopTimer = true;
    

    _onlineUsers = null;
    _currentUserIndex = 0;
    _foundCurrentUserCarousel = null;
    currentImageIndex = 0;
    nextImageIndex = 1;
    beforeImageIndex = null;
    await hubService.leftHub(hubId);
  }

  Future<void> likeUser() async {

    await Get.find<MatchService>()
        .createMatch(_onlineUsers![_currentUserIndex].userID!);
    _currentUserIndex += 1;
    if (_currentUserIndex < _onlineUsers!.length) {
      generateFoundSlider();
    } else {
      _amIAlone = true;
    }

    update();
  }

  Future<void> dislikeUser() async {
    await Get.find<MatchService>()
        .dislikeUser(_onlineUsers![_currentUserIndex].userID!);
    _currentUserIndex += 1;
    if (_currentUserIndex < _onlineUsers!.length) {
      _currentUserIndex += 1;
      generateFoundSlider();
    } else {
      _amIAlone = true;
    }

    update();
  }

  Future<void> goBack() async {
    var firestoreService = Get.find<FirestoreService>();
    var user = await firestoreService.getUser(_currentUser!.userID!);

    if (user.remaining_daily_back_count! > 0) {
      if (_currentUserIndex > 0) {
        var matches = (await firestoreService
                .getCollection('matches')
                .where(
                  'user1.id',
                  isEqualTo: currentUser!.userID,
                )
                .where('user2.id',
                    isEqualTo: _onlineUsers![_currentUserIndex].userID)
                .get())
            .docs;

        if (matches.isNotEmpty) {
          

          var likedUser = await firestoreService
              .getUser(_onlineUsers![_currentUserIndex].userID!);

          var newUserILikedList = user.users_i_liked!
              .where((id) => id != _onlineUsers![_currentUserIndex].userID!)
              .toList();
          var newLikeduserWhoLikedMeList = likedUser.users_who_liked_me!
              .where((id) => id != currentUser!.userID)
              .toList();

          var userData = Map<String, dynamic>();
          var likedUserData = Map<String, dynamic>();

          userData['users_i_liked'] = newUserILikedList;
          userData['remaining_daily_back_count'] =
              user.remaining_daily_back_count! - 1;

          likedUserData['users_who_liked_me'] = newLikeduserWhoLikedMeList;

          await firestoreService.updateUser(userData, _currentUser!.userID!);
          await firestoreService.updateUser(userData, _currentUser!.userID!);

          await firestoreService.updateUser(
              likedUserData, _onlineUsers![_currentUserIndex].userID!);

          var match = matches[0];

          await firestoreService.getCollection('matches').doc(match.id).delete();

          _currentUserIndex -= 1;
        }
        else {
          var newUserUnlikedList = user.un_liked_users!.where((id) => id != _onlineUsers![_currentUserIndex].userID).toList();

          var userData = Map<String, dynamic>();
          userData['un_liked_users'] = newUserUnlikedList;
          userData['remaining_daily_back_count'] = user.remaining_daily_back_count! - 1;

          await firestoreService.updateUser(userData, currentUser!.userID!);

          _currentUserIndex -= 1;

        }
      }
    }
    generateFoundSlider();
    update();
  }

  void setHubID(String hubID) {
    hubId = hubID;
  }
}
