
import 'package:curvy_app/api/clients/go_api_client.dart';
import 'package:get/get.dart';

Future<void> initClients() async {
  Get.put(GoApiClient(baseUrl: "http://10.0.2.2:8080"));
}