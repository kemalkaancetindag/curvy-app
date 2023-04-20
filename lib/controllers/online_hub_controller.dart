import 'dart:async';

import 'package:curvy_app/api/services/chat_service.dart';
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

  String _curvyLikeMessageText = "";
  String curvyChipMessageText = "";

  @override
  Future<void> onInit() async {
    hubService.listenHub(hubId);
  }

  Future<void> updateHubData(
      OnlineHub updatedData, HubStorageModel storedHub) async {
    String currentUserId = Get.find<SharedPreferenceService>().getUserID()!;
    _currentUser = await Get.find<FirestoreService>().getUser(currentUserId);

    _hubData = updatedData;
    _hubStorageData = storedHub;


    var onlineUserIDS = updatedData.each_users_users![currentUserId];

    if (onlineUserIDS.isEmpty) {
      _amIAlone = true;
      if (_timer != null) {
        _timer!.cancel();
      } else {}
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
            await Get.find<FirestoreService>().getUser(userID! as String);
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
                            width: Dimensions.h12,
                            height: Dimensions.h12,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/location_white.png"),
                                    fit: BoxFit.cover)),
                            margin: EdgeInsets.only(right: Dimensions.w8),
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
                      width: Dimensions.h27,
                      height: Dimensions.h27,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/expand_icon.png"),
                              fit: BoxFit.cover)),
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
                  child: Container(
                    width: Dimensions.h36,
                    height: Dimensions.h36,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/matcher_back.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<OnlineHubController>().dislikeUser();
                  },
                  child: Container(
                      width: Dimensions.h52,
                      height: Dimensions.h52,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.h52 / 2),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/matcher_dislike.png"),
                              fit: BoxFit.cover))),
                ),
                GestureDetector(
                  onTap: () {
                    showCurvyLikeDialog();
                  },
                  child: Container(
                    width: Dimensions.h45,
                    height: Dimensions.h45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/matcher_superlike.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<OnlineHubController>().likeUser();
                  },
                  child: Container(
                    width: Dimensions.h52,
                    height: Dimensions.h52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.h52 / 2),
                        image: DecorationImage(
                            image: AssetImage("assets/images/matcher_like.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  width: Dimensions.h36,
                  height: Dimensions.h36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.h36 / 2),
                      image: DecorationImage(
                          image: AssetImage("assets/images/matcher_turbo.png"),
                          fit: BoxFit.cover)),
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
    print("GERİ");
    if(_timer != null) {
      _timer!.cancel();
    }
    
    if(_onlineUsers!.last.bot == 1) {
      var updateData = Map<String,dynamic>();
      updateData['last_seen_on_hub'] = _onlineUsers!.last.userID!;      
      await Get.find<FirestoreService>().updateUser(updateData, currentUser!.userID!);
    }
    
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

          await firestoreService
              .getCollection('matches')
              .doc(match.id)
              .delete();

          _currentUserIndex -= 1;
        } else {
          var newUserUnlikedList = user.un_liked_users!
              .where((id) => id != _onlineUsers![_currentUserIndex].userID)
              .toList();

          var userData = Map<String, dynamic>();
          userData['un_liked_users'] = newUserUnlikedList;
          userData['remaining_daily_back_count'] =
              user.remaining_daily_back_count! - 1;

          await firestoreService.updateUser(userData, currentUser!.userID!);

          _currentUserIndex -= 1;
        }
      }
    }
    generateFoundSlider();
    update();
  }

  void sendCurvyChipMessage() async {
    var result = await Get.find<ChatService>().startNewChat(
        curvyChipMessageText, _onlineUsers![_currentUserIndex].userID!, 2);

    if (result) {
      await Get.find<MatchService>()
          .createMatch(_onlineUsers![_currentUserIndex].userID!);
      curvyChipMessageText = "";
      _currentUserIndex += 1;
      if (_currentUserIndex < _onlineUsers!.length) {
        generateFoundSlider();
      } else {
        _amIAlone = true;
      }

      update();
    }
  }

  void showCurvyLikeDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              width: Dimensions.w35 * 10,
              height: Dimensions.h22 * 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.h16 * 2),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD51CFF), Color(0xFF6198EF)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    height: Dimensions.h36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: Dimensions.w8 / 2),
                          child: Center(
                            child: Image.asset(
                                "assets/images/curvy_like_dialog.png"),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "CurvyLIKE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Dimensions.h21),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.h12 / 2)),
                                  child: Padding(
                                    padding: EdgeInsets.all(Dimensions.w9 / 3),
                                    child: Center(
                                      child: Text(
                                        "168",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Dimensions.h9),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.h100 / 10),
                    width: Dimensions.w320,
                    height: Dimensions.h60,
                    child: Text(
                      "CurvyLIKE ile CurvyCHIP arasındaki fark CuvyLIKE ile gönderdiğiniz mesajın muhattabı sizinle sağa kaydırarak eşleşe bilir ve Premium hesabınızla sohbetinize devam edebilirsiniz CurvyCHIP ile yazdığınızda eşleşme şansınızı kaybedersiniz ve fakat muhatabınız sizi engellemediği sürece tüm mesajlarınız alıcısına ulaştırılır.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.h100 / 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Dimensions.w325,
                    height: Dimensions.h90,
                    margin: EdgeInsets.only(top: Dimensions.h12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: Dimensions.w270,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.h16)),
                          child: TextField(
                            onChanged: (value) {
                              _curvyLikeMessageText = value;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            maxLines: 10,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(Dimensions.w9),
                                hintText: "Bir mesaj yaz",
                                hintStyle: TextStyle(color: Color(0xFFC5C5C7)),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var result = await Get.find<ChatService>()
                                    .startNewChat(
                                        _curvyLikeMessageText,
                                        _onlineUsers![_currentUserIndex]
                                            .userID!,
                                        1);
                                if (result) {
                                  _curvyLikeMessageText = "";
                                  await Get.find<MatchService>().createMatch(
                                      _onlineUsers![_currentUserIndex].userID!);

                                  _currentUserIndex += 1;
                                  if (_currentUserIndex <
                                      _onlineUsers!.length) {
                                    generateFoundSlider();
                                  } else {
                                    _amIAlone = true;
                                  }

                                  update();

                                  Get.back();
                                }
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                      "assets/images/curvy_dialog_send_icon.png"),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_mic_icon.png"),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Image.asset(
                                    "assets/images/curvy_dialog_add_icon.png"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void setHubID(String hubID) {
    hubId = hubID;
  }
}
