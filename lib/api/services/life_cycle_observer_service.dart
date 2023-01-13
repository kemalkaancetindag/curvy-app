import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/api/services/shared_preference_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LifeCycleObserverService extends GetxService with WidgetsBindingObserver {
  FirestoreService firestoreService;

  LifeCycleObserverService({required this.firestoreService});

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    var updateData = Map<String, dynamic>();
    var userID = Get.find<SharedPreferenceService>().getUserID();

    if (userID != null) {
      if (state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused ||
          state == AppLifecycleState.detached) {
        updateData['online_status'] = false;
        await firestoreService.updateUser(updateData, userID);
      } else {
        updateData['online_status'] = true;
        await firestoreService.updateUser(updateData, userID);
      }
    }
  }
}
