import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/enums/package_type_enum.dart';
import 'package:curvy_app/enums/swipe_control_action_enums.dart';
import 'package:curvy_app/models/package_control_model.dart';

class SwipeUtils {

  static Future<int> checkCanSwipe(FirestoreService firestoreService, String userID) async {
    var userPackageInfo = (await firestoreService.getCurrentUser(userID)).package_control!;
    if(userPackageInfo.package_type == PackageType.platinium.value || userPackageInfo.package_type == PackageType.plus.value) {
      return SwipeControlAction.pass.value;      
    } else {
      if(userPackageInfo.allowed_swipe_count == 0) {
        return SwipeControlAction.noSwipesLeft.value;
      }
      if(userPackageInfo.allowed_swipe_count == 8) {

        var data = PackageControlModel(
          swipes_left_to_ad: userPackageInfo.swipes_left_to_ad,
          allowed_swipe_count: userPackageInfo.allowed_swipe_count! - 1,
          package_type: userPackageInfo.package_type,
          last_update_date: DateTime.now().millisecondsSinceEpoch,
           daily_back_count: userPackageInfo.daily_back_count
        ).toJson();

        Map<String,dynamic> updateData = Map<String,dynamic>();
        updateData['package_control'] = data;
        await firestoreService.updateUser(updateData, userID);

        return SwipeControlAction.premiumReminder.value;

      } else if(userPackageInfo.swipes_left_to_ad == 0) {
        var data = PackageControlModel(
          swipes_left_to_ad: 14,
          allowed_swipe_count: userPackageInfo.allowed_swipe_count! - 1,
          package_type: userPackageInfo.package_type,
          last_update_date: DateTime.now().millisecondsSinceEpoch,
           daily_back_count: userPackageInfo.daily_back_count
        ).toJson();
        
        Map<String,dynamic> updateData = Map<String,dynamic>();
        updateData['package_control'] = data;
        await firestoreService.updateUser(updateData, userID);
        return SwipeControlAction.ad.value;
        
      }

       var data = PackageControlModel(
          swipes_left_to_ad: userPackageInfo.swipes_left_to_ad! - 1,
          allowed_swipe_count: userPackageInfo.allowed_swipe_count! - 1,
          package_type: userPackageInfo.package_type,
          last_update_date: DateTime.now().millisecondsSinceEpoch,
           daily_back_count: userPackageInfo.daily_back_count
        ).toJson();
        
        Map<String,dynamic> updateData = Map<String,dynamic>();
        updateData['package_control'] = data;

        await firestoreService.updateUser(updateData, userID);
        return SwipeControlAction.pass.value;

    }
  }  


  static Future<int> checkCanGoBack(FirestoreService firestoreService, String userID) async {
    var userPackageInfo = (await firestoreService.getCurrentUser(userID)).package_control;

    if(userPackageInfo!.package_type == PackageType.plus.value || userPackageInfo.package_type == PackageType.platinium.value) {
      return 1;
    } else if(userPackageInfo.daily_back_count != 0) {
        var data = PackageControlModel(
          swipes_left_to_ad: userPackageInfo.swipes_left_to_ad,
          allowed_swipe_count: userPackageInfo.allowed_swipe_count,
          package_type: userPackageInfo.package_type,
          last_update_date: DateTime.now().millisecondsSinceEpoch,
          daily_back_count: userPackageInfo.daily_back_count! - 1
        ).toJson();
        
        Map<String,dynamic> updateData = Map<String,dynamic>();
        updateData['package_control'] = data;

        await firestoreService.updateUser(updateData, userID);
      return 1;

    

    }

    return 0;
  }
}