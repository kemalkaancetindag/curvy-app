import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/match_service.dart';
import 'package:curvy_app/api/services/recommendation_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:curvy_app/enums/swipe.dart';
import 'package:curvy_app/models/interest.model.dart';
import 'package:curvy_app/models/user.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class NewMatcherController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RecommendationService recommendationService;
  MatchService matchService;
  SharedPreferenceService sharedPreferenceService;
  FirestoreService firestoreService;

  PageController _mainPageController = PageController();
  PageController get mainPageController => _mainPageController;

  PageController _secondPageController = PageController();
  PageController get secondPageController => _secondPageController;

  List<UserModel>? _recommendedUsers;
  List<UserModel>? get recommendedUsers => _recommendedUsers;

  int _currentUserIndex = 9;
  int get currentUserIndex => _currentUserIndex;

  int _currentUserImageIndex = 0;
  int get currentUserImageIndex => _currentUserImageIndex;

  Swipe _swipe = Swipe.none;
  Swipe get swipe => _swipe;

  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  List<UserModel> _removedUsers = [];
  List<UserModel> get removedUsers => _removedUsers;

  bool _isMatcherStyle = true;
  bool get isMatcherStyle => _isMatcherStyle;

  List<dynamic> _unWantedUsers = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _swipeCount = 0;

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;

  AnimationStatus? _animationDirection;

  List<Interest> _currentRecommendedUsersInterests = [];
  List<Interest> get currentRecommendedUsersInterests => _currentRecommendedUsersInterests;

  int? _currentRecommendedUserDistance;
  int? get currentRecommendedUserDistance => _currentRecommendedUserDistance;

  double? _currentUserDistancePreference;
  double? get currentUserDistancePreference =>  _currentUserDistancePreference;

  bool _isSuperLike = false;
  bool get isSuperLike  => _isSuperLike;


  NewMatcherController(
      {required this.recommendationService,
      required this.matchService,
      required this.sharedPreferenceService,
      required this.firestoreService});

  Future<void> onInit() async {
    _isLoading = true;
    
    update();
    String currentUserID = sharedPreferenceService.getUserID()!;
    UserModel currentUser = await firestoreService.getUser(currentUserID);
    _currentUser = currentUser;
    _currentUserDistancePreference = currentUser.settings!.distance_preference!.distance;
    

    _unWantedUsers.addAll(currentUser.users_i_liked!);
    _unWantedUsers.addAll(currentUser.un_liked_users!);

    _recommendedUsers = [];

    var recommendations =
        await recommendationService.getRecommendations(_unWantedUsers);
    
    print("GELDİ");
    print(recommendations.length);

    if(recommendations.isEmpty){
      _isLoading = false;
      update();
      return;      
    }

    await Future.forEach(recommendations, (user) async {
      var userModel = UserModel.fromJson(user);
      _unWantedUsers.add(userModel.userID!);
      _recommendedUsers!.add(userModel);
    });

    _currentRecommendedUserDistance = await calculateDistance(_recommendedUsers!.last.location!.latitude!, _recommendedUsers!.last.location!.longitude!);

    

    await getCurrentRecommendedUsersInterests();

    await precacheBatchImage(_recommendedUsers!
        .sublist(_currentUserIndex - 2, _currentUserIndex + 1));

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    _animationController.addStatusListener(
      (status) {
        if (AnimationStatus.completed == status) {
          if (_animationDirection != null) {            
            removeListItem();
            getCurrentRecommendedUsersInterests();
            setSwipe(Swipe.none);
            _animationController.reset();
          }
        }
      },
    );
    _isLoading = false;
    update();
    super.onInit();
  }

  void updateCurrentUserIndex(bool increase) {
    if (increase) {
      _currentUserIndex -= 1;

    } else {
      _currentUserIndex -= 1;
    }

    setCurrentUserImageIndex(0);

    update();
  }

  Future<void> precacheBatchImage(List<UserModel> users) async {
    await Future.forEach(users, (user) async {
      await Future.forEach(user.images!, (image) async {
        await precacheImage(
            NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(image)}?alt=media'),
            Get.context!);
      });
    });
  }


  void setCurrentUserDistancePreference(double distance) {
    _currentUserDistancePreference = distance;
    update();
  }

  void setCurrentUserImageIndex(int index) {
    _currentUserImageIndex = index;
    update();
  }

  void setSwipe(Swipe swipe) {
    _swipe = swipe;
    update();
  }

  void setSuperlike(bool isSuperLike) {
    _isSuperLike = isSuperLike;
    update();
  }

  void animate(bool forward, Swipe swipe) {
    _swipe = swipe;
    update();
    if (forward) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void removeListItem() {
    _removedUsers.add(_recommendedUsers!.last);
    _recommendedUsers!.removeLast();
    update();
  }

  void addListItem() {
    _recommendedUsers!.add(_removedUsers.last);
    _removedUsers.removeLast();
    _animationController.reverse();
    update();
  }

  void setIsMatcherStyle(bool state) {
    _isMatcherStyle = state;
    update();
  }

  Future<void> likeUser(bool isButtonUsed) async {
    _swipeCount += 1;
    print(_recommendedUsers!.last.userID!);

    if (isButtonUsed) {
      animate(true, Swipe.right);
      _animationDirection = AnimationStatus.forward;      
      await matchService.createMatch(_recommendedUsers!.last.userID!);
      
    } else {
      removeListItem();
      await getCurrentRecommendedUsersInterests();
      await matchService.createMatch(_recommendedUsers!.last.userID!);
    }
    setCurrentUserImageIndex(0);
    _currentRecommendedUserDistance = await calculateDistance(_recommendedUsers!.last.location!.latitude!, _recommendedUsers!.last.location!.longitude!);
    await continuosSlide();
  }

  Future<void> dislikeUser(bool isButtonUsed) async {
    print(_recommendedUsers!.last.userID!);
    _swipeCount += 1;
    if (isButtonUsed) {
      animate(true, Swipe.left);
      _animationDirection = AnimationStatus.forward;
      await matchService.dislikeUser(_recommendedUsers!.last.userID!);
    } else {
      removeListItem();
      await getCurrentRecommendedUsersInterests();
      await matchService.dislikeUser(_recommendedUsers!.last.userID!);
    }
    setCurrentUserImageIndex(0);
    _currentRecommendedUserDistance = await calculateDistance(_recommendedUsers!.last.location!.latitude!, _recommendedUsers!.last.location!.longitude!);
    await continuosSlide();
  }

  Future<void> previousUser() async {
    addListItem();
    await getCurrentRecommendedUsersInterests();
    _currentRecommendedUserDistance = await calculateDistance(_recommendedUsers!.last.location!.latitude!, _recommendedUsers!.last.location!.latitude!);
    await matchService.removeLastAction(recommendedUsers!.last.userID!);
  }

  Future<void> continuosSlide() async {
    if (_swipeCount == 3) {
      var recommendations =
          await recommendationService.getRecommendations(_unWantedUsers);

      await Future.forEach(recommendations, (user) async {
        var userModel = UserModel.fromJson(user);
        _unWantedUsers.add(userModel.userID!);
        _recommendedUsers!.insert(0, userModel);
      });
      print("SAAAA");

      

      _swipeCount = 0;
    }


    update();
  }

  Future<void> changeDistanceAndReload() async {
    
    Map<String,dynamic> updateData = Map<String,dynamic>();

    updateData['settings.distance_preference.distance'] = _currentUserDistancePreference!;

    await firestoreService.updateUser(updateData, _currentUser!.userID!);

    await onInit();


    
  }

  
  Future<int> calculateDistance(double lat2, double lon2) async {
    String userID = Get.find<SharedPreferenceService>().getUserID()!;
    var currentUser = await Get.find<FirestoreService>().getCurrentUser(userID);
    print("MATCHER");
    print(_recommendedUsers!.last.location!.latitude);
    print(_recommendedUsers!.last.location!.longitude);
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

  Future<void> getCurrentRecommendedUsersInterests() async {
    _currentRecommendedUsersInterests = [];

    await Future.forEach(_recommendedUsers!.last.interests!, (interestID) async {
      var interest = await firestoreService.getUserInterest(interestID);
      _currentRecommendedUsersInterests.add(interest);
    });
    
  }
}
