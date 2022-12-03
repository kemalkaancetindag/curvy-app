import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:dio/dio.dart' as dio_package;
import 'package:get/get.dart';



class SetupService extends GetxService{
  MobileApiClient mobileApiClient;
  SetupService({required this.mobileApiClient});


  Future<dio_package.Response> createUser(String url, dio_package.FormData data) async {
    return await mobileApiClient.dioPostData(data,url);
  }

  




}