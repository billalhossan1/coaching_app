import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Service/api_client.dart';
import '../../../../Service/api_url.dart';


class AuthRepo{
  Future<Response>login({required String email,required dynamic password,required String? deviceToken})async{

    try{

      Map<String,dynamic>body={
        "email":email,
        "password":password,
        "deviceToken":deviceToken
      };
      Response response;
      response = await ApiClient.postData(
        ApiConstant.auth_login,
        body: body,
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

}