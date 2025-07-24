import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/course_model.dart';
import 'package:football_coaching_coach_app/model/upcomming_session_list_model.dart' hide Course;
import 'package:football_coaching_coach_app/view/screen/home/repo/home_screen_repo.dart';
import 'package:get/get.dart';

import '../../../../utils/ToastMsg/toast_message.dart';
import '../profile/model/profile_model.dart';
import '../profile/repo/profile_repo.dart';

class HomeController extends GetxController {
  // Observable state to track if text is expanded
  var isExpanded = false.obs;
  RxBool isProfileLoading = false.obs;
  RxBool isCourseLoading = false.obs;
  RxBool isUpComingSessionLoading = false.obs;
  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();
  RxList<Course> courseList = RxList<Course>();
  RxList<UpComingSessionModel> upComingSessionList = RxList<UpComingSessionModel>();
  int coursePage = 1;
  int courseTotalPage = 1;
  int upComingSessionPage = 1;
  int upComingSessionTotalPage = 1;
  ScrollController courseScrollController = ScrollController();
  ScrollController upComingSessionScrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactTEController = TextEditingController();
  TextEditingController nationalityTEController = TextEditingController();
  TextEditingController addressTEController = TextEditingController();
  // Toggle the expansion state
  void homeInit(){
    getProfile();
    getCourses();
    getUpcomingSession();
    courseScrollController.addListener(_getCourseListener);
    upComingSessionScrollController.addListener(_getUpComingSessionListener);
}

  void onRefresh(){
    getCourses();
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void> getProfile() async {
    try {
      isProfileLoading.value = true;
      Response response = await ProfileRepo().getProfile();
      isProfileLoading.value = false;
      if (response.statusCode == 200) {
        profileModel.value = ProfileModel.fromJson(response.body);
        update();
      } else {
        showCustomSnackBar(response.statusText ?? "Something went wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _getCourseListener() {
    if (courseScrollController.position.pixels ==
        courseScrollController.position.maxScrollExtent) {
      coursePage++;
      if (coursePage <= courseTotalPage) {
        getCourses(page: coursePage);
      } else {
        return;
      }
    }
  }


  Future<void> getCourses({int page = 1}) async {
    try {
      isCourseLoading.value = true;
      Response response = await HomeScreenRepo().getCourse(page);
      isCourseLoading.value = false;

      if (response.statusCode == 200) {
        if (coursePage == 1) {
          courseList.clear();
        }
        CourseListModel courseListModel = CourseListModel.fromJson(
          response.body,
        );
        courseList.value = courseListModel.courseList ?? [];
        courseTotalPage=courseListModel.pagination?.totalPage??1;
        print("courseList:====================== ${courseList.length}");
      } else {
        showCustomSnackBar(response.statusText ?? "Something went wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _getUpComingSessionListener() {
    if (courseScrollController.position.pixels ==
        courseScrollController.position.maxScrollExtent) {
      upComingSessionPage++;
      if (upComingSessionPage <= upComingSessionTotalPage) {
        getUpcomingSession(page: upComingSessionPage);
      } else {
        return;
      }
    }
  }

  Future<void> getUpcomingSession({int page =1})async{
    try{
      isUpComingSessionLoading.value=true;
      Response response=await HomeScreenRepo().getUpcomingSession(page);
      isUpComingSessionLoading.value=false;
      if(response.statusCode==200){
        if(page==1){
          upComingSessionList.clear();
        }
        UpcomingSessionListModel upcomingSessionListModel=UpcomingSessionListModel.fromJson(response.body);
        upComingSessionList.value=upcomingSessionListModel.upComingSessionList??[];
        upComingSessionTotalPage=upcomingSessionListModel.pagination?.totalPage??1;
      }else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }

    }catch(e){
      debugPrint(e.toString());
    }
  }
}
