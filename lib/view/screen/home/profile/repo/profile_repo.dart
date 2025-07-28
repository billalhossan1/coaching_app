import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../../Service/api_client.dart';
import '../../../../../Service/api_url.dart';



class ProfileRepo{
  Future<Response>getProfile()async{

    try{
      Response response;
      response = await ApiClient.getData(
        ApiConstant.get_profile,
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>getCourseHistory(bool isPrevious,int page)async{

    try{
      Map<String,dynamic>query={
        "previous":isPrevious,
        "page":page
      };
      Response response;
      response = await ApiClient.getData(
        ApiConstant.getCourse,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

}