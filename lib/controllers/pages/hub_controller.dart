import 'package:curvy_app/api/services/hub_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/models/hub_storage.model.dart';
import 'package:curvy_app/ui/widgets/explore_vertical_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HubController extends GetxController {
  HubService hubService;

  List<HubStorageModel>? _storageHubs;
  List<HubStorageModel>? get storageHubs => _storageHubs;

  List<Widget>? _tiles;
  List<Widget>? get tiles => _tiles;


  HubController({
    required this.hubService
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    _storageHubs = await hubService.getHubs();
    generateTiles();    
    update();
  }

  void generateTiles() {
    _tiles = [];
    
    _storageHubs!.skip(3).forEach((hub) { 
      _tiles!.add(
        ExploreVerticalBox(
          image: hub.hub_image!, 
          title: hub.hub_title!, 
          text: hub.hub_text!, 
          actionText: hub.hub_action_text!,
          marginLeft: Dimensions.w8/2,
          marginRight: Dimensions.w8/2,
          marginTop: Dimensions.h16,
        )
      );
    });

  }


  
  



}