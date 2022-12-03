import 'package:dio/dio.dart' as dio_package;
import 'package:get/get.dart';

class MobileApiClient extends GetConnect implements GetxService{
  final String baseUrl;
  late Map<String, String> _headers;
  @override
  Duration timeout = Duration(seconds: 20);

  MobileApiClient({required this.baseUrl});

  Future<dio_package.Response> dioPostData(dio_package.FormData form, String url) async {
    var dio = dio_package.Dio();
    try{
      dio_package.Response response = await dio.post(baseUrl+url, data:form);
      return response; 
    }
    catch(e){
      return dio_package.Response(statusCode: 1, statusMessage: e.toString(), requestOptions: dio_package.RequestOptions(path: ""));
    }
  }

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