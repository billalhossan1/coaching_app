import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../../../Service/api_client.dart';
import '../../../../../../Service/api_url.dart';



class ChangePassRepo{
  Future<Response>changePass({required String oldPass,required String newPass,required String confirmPass})async{

    try{

      Map<String,dynamic>body={
        "currentPassword":oldPass,
        "newPassword":newPass,
        "confirmPassword":confirmPass,

      };
      Response response;
      response = await ApiClient.postData(
        ApiConstant.change_password,
        body: body,
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

}