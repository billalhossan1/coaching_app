import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/session_details_model.dart';
import 'package:get/get.dart';

import '../../../../model/sessionListByIdModel.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../repo/course_details_repo.dart';

class CourseDetailsController extends GetxController{
  RxBool isSessionIsLoading = false.obs;
  RxBool isSessionDetailsLoading = false.obs;
  RxBool isSessionPaginationLoading = false.obs;
  RxList<SessionItem> sessionList = RxList<SessionItem>();
  Rxn<SessionDetails>sessionDetails = Rxn<SessionDetails>();
  String courseId = '';
  int page = 1;
  int totalPage = 1;
  ScrollController sessionScrollController = ScrollController();

  @override
  Future<void> onInit() async {
    courseId = Get.arguments['courseId'];
    await getSessionList(courseId);
    sessionScrollController.addListener(sessionScrollListener);
    if(sessionList.isNotEmpty){
      getSessionDetails(sessionList[0].sId??'');
    }
    super.onInit();
  }

  void sessionScrollListener(){
    if(sessionScrollController.position.pixels == sessionScrollController.position.maxScrollExtent){
      if(page<totalPage){
        isSessionPaginationLoading.value = true;
        page++;
        getSessionList(courseId,page: page);
        isSessionPaginationLoading.value = false;

      }

    }
  }

  Future<void>getSessionList(String courseId,{int page =1})async{
    try{
      if(page==1){
        isSessionIsLoading.value=true;
      }
      Response response = await CourseDetailsRepo().getSessionByCourse(courseId: courseId,page: page);
      isSessionIsLoading.value=false;
      if(page==1){
        sessionList.clear();
      }
      if(response.statusCode==200){
        SessionsListByIdModel upcomingSessionListModel = SessionsListByIdModel.fromJson(response.body);
        sessionList.addAll(upcomingSessionListModel.sessionList??[]);
        totalPage = upcomingSessionListModel.pagination?.totalPage??1;
      }else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }


  Future<void>getSessionDetails(String sessionId)async{
    try{
      isSessionDetailsLoading.value=true;
      Response response = await CourseDetailsRepo().getSessionDetails(sessionId: sessionId);
      isSessionDetailsLoading.value=false;
      if(response.statusCode==200){
        SessionDetailsModel sessionDetailsModel = SessionDetailsModel.fromJson(response.body);
        sessionDetails.value = sessionDetailsModel.sessionDetails;
      }
      else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

}