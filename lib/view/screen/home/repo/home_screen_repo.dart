


import 'dart:io';

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

  Future<Response>getProfileOverView()async{

    try{

      Response response;
      response = await ApiClient.getData(
        ApiConstant.getProfileAnalytics,
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

  Future<Response>getUpcomingSessionToday()async{

    try{

      Response response;
      response = await ApiClient.getData(
        ApiConstant.getUpComingSessionToday
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





  Future<Response>updateProfile({required String name,required String contact,required String nationality,required String address,File? image})async{


      try {
        Map<String, String> body = {
          "name": name,
          "contact": contact,
          "nationality": nationality,
          "address": address,
        };
        List<MultipartBody> multipartBody = [];
        if (image != null) {
          multipartBody.add(MultipartBody("image", image));
        }
        Response response;
        response = await ApiClient.patchMultipartData(
          ApiConstant.update_profile,
          body,
          multipartBody: multipartBody,
        );
        return response;
      } catch (e) {
        return Response(statusCode: 1, statusText: "Error: ${e.toString()}");
      }
  }

}