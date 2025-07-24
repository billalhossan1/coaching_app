
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Service/api_client.dart';
import '../../../../Service/api_url.dart';


class HomeScreenRepo{
  Future<Response>getSession(String courseId)async{

    try{

      Map<String,dynamic>query={
        "course":courseId,
      };
      Response response;
      response = await ApiClient.getData(
        ApiConstant.getSession,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

  Future<Response>getCourse(int page)async{

    try{
      Map<String,dynamic>query={
        "page":page,
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

  Future<Response>getUpcomingSession(int page,{bool? all})async{

    try{
      Map<String,dynamic>query={
        "page":page,
        "all": all??''
      };

      Response response;
      response = await ApiClient.getData(
        ApiConstant.getUpComingSession,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

  Future<Response>createHomeWork({required String sessionId,required String tittle,required String description,required String deadline})async{

    try{
      Map<String,dynamic>body={
        "session":sessionId,
        "title":tittle,
        "description":description,
        "deadline":deadline
      };

      Response response;
      response = await ApiClient.postData(
        ApiConstant.getHomeWork,body: body
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

}