import 'package:cached_network_image/cached_network_image.dart';
import 'package:curvy_app/api/services/hub_service.dart';
import 'package:curvy_app/constants/dimensions.dart';
import 'package:curvy_app/controllers/online_hub_controller.dart';
import 'package:curvy_app/models/hub_storage.model.dart';
import 'package:curvy_app/ui/widgets/explore_vertical_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  void generateTiles() async {
    _tiles = [];
    

    for(int i = 3; i < _storageHubs!.length; i++){
    
      
       _tiles!.add(
        GestureDetector(
          onTap: () {
            Get.find<HubService>().joinHub(i);
          },
          child:  ExploreVerticalBox(
          image:Image.network(
                   'https://firebasestorage.googleapis.com/v0/b/curvy-4e1ae.appspot.com/o/${Uri.encodeComponent(_storageHubs![i].hub_image!)}?alt=media',
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                     
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
          title: _storageHubs![i].hub_title!, 
          text: _storageHubs![i].hub_text!, 
          actionText: _storageHubs![i].hub_action_text!,
          marginLeft: Dimensions.w8/2,
          marginRight: Dimensions.w8/2,
          marginTop: Dimensions.h16,
        ),
        )
       
      );
    }
    
  }
  
  



}