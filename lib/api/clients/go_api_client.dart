import 'package:get/get.dart';

class GoApiClient extends GetConnect implements GetxService{
  final String baseUrl;
  

  GoApiClient({required this.baseUrl});


  Future<Response> getData(String url) async{
    try{
      Response response = await get(url).timeout(Duration(seconds: 20));
      return response;
    }
    catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}