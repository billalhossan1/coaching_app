import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Service/api_client.dart';
import '../../../../Service/api_url.dart';

class CourseDetailsRepo{

  Future<Response>getSessionByCourse({required String courseId,required int page})async{

    try{
      Map<String,dynamic>query={
        "course":courseId,
        "page":page,
      };

      Response response;
      response = await ApiClient.getData(
          ApiConstant.getSessionById,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>getSessionDetails({required String sessionId})async{

    try{


      Response response;
      response = await ApiClient.getData(
          ApiConstant.sessionDetails(sessionId)
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>getVideos({required String courseId,required int page})async{

    try{
      Map<String,dynamic>query={
        "topic":courseId,
        "page":page
      };


      Response response;
      response = await ApiClient.getData(
          ApiConstant.getVideo,query: query);
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }
}