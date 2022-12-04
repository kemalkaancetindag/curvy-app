import 'package:curvy_app/api/clients/mobile_api_client.dart';
import 'package:get/get.dart';

Future<void> initClients() async {
  Get.put(MobileApiClient(baseUrl: "http://10.0.2.2:3000"));
}