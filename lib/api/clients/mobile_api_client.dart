import 'package:get/get.dart';

class MobileApiClient extends GetConnect implements GetxService{
  final String baseUrl;
  late Map<String, String> _headers;
  @override
  Duration timeout = Duration(seconds: 20);

  MobileApiClient({required this.baseUrl});

  Future<Response> postData(FormData form, String url) async {
    try{
      Response response = await post(url, form);
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }

  }

  Future<Response> getData(String url) async {
    try{
      Response response = await get(url);
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}