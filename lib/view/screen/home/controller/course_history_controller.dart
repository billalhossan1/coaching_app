import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/course_history_model.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:get/get.dart';

import '../profile/repo/profile_repo.dart';

class CourseHistoryController extends GetxController{
  RxBool isPresentLoading = false.obs;
  RxBool isPrevLoading = false.obs;
  int presentPage = 1;
  int prevPage = 1;
  int presentTotalPage=1;
  int prevTotalPage=1;

  ScrollController presentScrollController = ScrollController();
  ScrollController prevScrollController = ScrollController();

  RxList<CourseHistoryItem>presentCourseList = RxList<CourseHistoryItem>();
  RxList<CourseHistoryItem>previousCourseList = RxList<CourseHistoryItem>();

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  void initial(){
    presentScrollController.addListener(presentCourseScrollListener);
    prevScrollController.addListener(prevCourseScrollListener);
    getPresentCourse();
    getPrevCourse();
  }

  void presentCourseScrollListener(){
    if(presentScrollController.position.pixels == presentScrollController.position.maxScrollExtent){
      if(presentPage<presentTotalPage){
        presentPage++;
        getPresentCourse(page: presentPage);
      }
    }
  }



  Future<void>getPresentCourse({int page =1})async{
    isPresentLoading.value = true;
    Response response = await ProfileRepo().getCourseHistory(false,presentPage);
    isPresentLoading.value = false;
    if(response.statusCode==200){
      CourseHistoryModel courseListModel = CourseHistoryModel.fromJson(response.body);

      presentCourseList.addAll(courseListModel.courseList??[]);
      presentTotalPage = courseListModel.pagination!.totalPage!;

    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }


  void prevCourseScrollListener(){
    if(prevScrollController.position.pixels == prevScrollController.position.maxScrollExtent){
      if(prevPage<prevTotalPage){
        prevPage++;
        getPrevCourse(page: prevPage);
      }
    }
  }
  Future<void>getPrevCourse({int page =1})async{
    isPrevLoading.value = true;
    Response response = await ProfileRepo().getCourseHistory(true,prevPage);
    isPrevLoading.value = false;
    if(response.statusCode==200){
      CourseHistoryModel courseListModel = CourseHistoryModel.fromJson(response.body);
      previousCourseList.addAll(courseListModel.courseList!);
      prevTotalPage = courseListModel.pagination!.totalPage!;
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }

}