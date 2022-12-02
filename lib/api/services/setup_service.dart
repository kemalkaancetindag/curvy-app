import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:get/get.dart';


class SetupService extends GetxService{
  MobileApiClient mobileApiClient;
  SetupService({required this.mobileApiClient});


  Future<Response> createUser(String url, FormData data) async {
    return await mobileApiClient.postData(data,url);
  }

  




}