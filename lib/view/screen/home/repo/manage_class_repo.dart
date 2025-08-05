import 'package:get/get_connect/http/src/response/response.dart';

import '../../../../Service/api_client.dart';
import '../../../../Service/api_url.dart';

class ManageClassRepo{

  Future<Response>manageClassById(String sessionId)async{

    try{

      Response response;
      response = await ApiClient.getData(
          ApiConstant.manageClassByIdUrl(sessionId)
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

  Future<Response>getHomeWork(String homeWorkId)async{

    try{

      Response response;
      response = await ApiClient.getData(
          ApiConstant.homeWorkUrl(homeWorkId)
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>updatePerformance({List<
      Map<String, dynamic>>?performance,required String userId,required String sessionId})async{

    try{
      Map<String,dynamic>body={
        "user":userId,
        // "attendance":attendance,
        "performance":performance,
        "session":sessionId
      };

      Response response;
      response = await ApiClient.postData(
          ApiConstant.updatePerformanceUrl,body: body
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }

  Future<Response>updateAttandence({required String userId,required String sessionId,required bool attendance})async{

    try{
      Map<String,dynamic>body={
        "user":userId,
        "atandance":attendance.toString(),
        // "performance":performance,
        "session":sessionId
      };

      Response response;
      response = await ApiClient.postData(
          ApiConstant.updateAttandence,body: body
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>getPerformanceMark({required String userId,required String sessionId})async{

    try{
      Map<String,dynamic>query={
        "user":userId,
        "session":sessionId
      };

      Response response;
      response = await ApiClient.getData(
          ApiConstant.performanceStudentMark,query: query
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }


  Future<Response>assignHomeWork({required String tittle,required String sessionId,required String description})async{

    try{
      Map<String,dynamic>body={
        "session":sessionId,
        "title":tittle,
        "description":description,
      };

      Response response;
      response = await ApiClient.postData(
          ApiConstant.assignHomeWork,body: body
      );
      return response;

    }catch(e){
      return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
    }

  }
}