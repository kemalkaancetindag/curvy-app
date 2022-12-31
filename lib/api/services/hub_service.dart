import 'package:curvy_app/api/services/firestore_service.dart';
import 'package:curvy_app/models/hub_storage.model.dart';
import 'package:get/get.dart';

class HubService extends GetxService {
  FirestoreService firestoreService;

  HubService({
    required this.firestoreService
  });


  Future<List<HubStorageModel>> getHubs() async {

    List<HubStorageModel> hubList = [];

    var hubs = (await firestoreService.getCollection("hub_storage").orderBy("hub_type").get()).docs;
    

    hubs.forEach((hub) { 
      
      var hubStorageObject = HubStorageModel.fromJson((hub.data() as Map<String,dynamic>));      
      hubList.add(hubStorageObject);
    });

    return hubList;
  }


}