import 'package:curvy_app/api/services/hub_service.dart';
import 'package:curvy_app/controllers/online_hub_controller.dart';
import 'package:curvy_app/ui/widgets/hub/hub_empty.dart';
import 'package:curvy_app/ui/widgets/hub/hub_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HubScreen  extends StatelessWidget {
  const HubScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      
      body: GetBuilder<OnlineHubController>(
        builder: (controller) {

          if(controller.amIAlone!){
            return HubEmptyWidget();  
          }
                    
          return HubFoundWidget();
          
        },
      ) ,
    ), 
      onWillPop: () async {
        await Get.find<OnlineHubController>().leftHub();
        
        
        return true;
      }
    );
  }
}