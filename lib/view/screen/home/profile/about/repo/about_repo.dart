import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../../../Service/api_client.dart';
import '../../../../../../Service/api_url.dart';

class AboutRepo{
  Future<Response>disclaimer(String type)async{

    try{
      Map<String,dynamic>query={
        "type":type
      };
      Response response;
      response = await ApiClient.getData(
        ApiConstant.disclaimer,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }
}