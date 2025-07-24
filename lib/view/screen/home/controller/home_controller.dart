import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/course_model.dart';
import 'package:football_coaching_coach_app/model/profile_analytics_model.dart';
import 'package:football_coaching_coach_app/model/proile_today_session_model.dart';
import 'package:football_coaching_coach_app/model/session_model.dart';
import 'package:football_coaching_coach_app/model/upcomming_session_list_model.dart' hide Course;
import 'package:football_coaching_coach_app/view/screen/home/repo/home_screen_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/ToastMsg/toast_message.dart';
import '../profile/model/profile_model.dart';
import '../profile/repo/profile_repo.dart';

class HomeController extends GetxController {
  // Observable state to track if text is expanded
  var isExpanded = false.obs;
  RxBool isProfileLoading = false.obs;
  RxBool isUpdateProfileLoading = false.obs;
  RxBool isCourseLoading = false.obs;
  RxBool isUpComingSessionLoading = false.obs;
  RxBool isUpComingTodaySessionLoading = false.obs;
  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();
  Rxn<ProfileAnalytics> profileAnalytics = Rxn<ProfileAnalytics>();
  Rxn<SingleSession> todaySession = Rxn<SingleSession>();
  RxList<Course> courseList = RxList<Course>();
  RxList<UpComingSessionModel> upComingSessionList = RxList<UpComingSessionModel>();
  int coursePage = 1;
  int courseTotalPage = 1;
  int upComingSessionPage = 1;
  int upComingSessionTotalPage = 1;
  ScrollController courseScrollController = ScrollController();
  ScrollController upComingSessionScrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactTEController = TextEditingController();
  TextEditingController nationalityTEController = TextEditingController();
  TextEditingController addressTEController = TextEditingController();
  // Toggle the expansion state
  Future<void> homeInit() async {
    getCourses();
    getUpcomingSession();
    getTodaySession();
    await getProfile();
    getProfileAnalytics();
    setTextEditingController();
    courseScrollController.addListener(_getCourseListener);
    upComingSessionScrollController.addListener(_getUpComingSessionListener);
}


void setTextEditingController(){
  nameController.text = profileModel.value?.profileModel?.name??'';
  contactTEController.text = profileModel.value?.profileModel?.contact??'';
  nationalityTEController.text = profileModel.value?.profileModel?.nationality??'';
  addressTEController.text = profileModel.value?.profileModel?.address??'';
}

  void onRefresh(){
    getCourses();
    getUpcomingSession();
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  ///Get profile

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


  //get course

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
      } else {
        showCustomSnackBar(response.statusText ?? "Something went wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  ////get session

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



  ////Update Profile

  File? selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _imagePicker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
  }


  Future<void>onTapUpdate(BuildContext context)async{
    isUpdateProfileLoading.value=true;
    Response response = await HomeScreenRepo().updateProfile(name: nameController.text.trim(), contact: contactTEController.text.trim(), nationality: nationalityTEController.text.trim(), address: addressTEController.text.trim() ,image: selectedImage??null);

    if(response.statusCode==200){
      showCustomSnackBar("Profile updated successfully",isError: false);
       await getProfile();
      isUpdateProfileLoading.value = false;
      Navigator.pop(context);
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
    isUpdateProfileLoading.value=false;
  }


  Future<void>getProfileAnalytics()async{
    Response response = await HomeScreenRepo().getProfileOverView();
    if(response.statusCode==200){
      ProfileAnalyticsModel profileAnalyticsModel = ProfileAnalyticsModel.fromJson(response.body);
      profileAnalytics.value = profileAnalyticsModel.profileAnalytics;
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }

  Future<void>getTodaySession()async{
    isUpComingTodaySessionLoading.value= true;
    Response response = await HomeScreenRepo().getUpcomingSessionToday();
    isUpComingTodaySessionLoading.value= false;
    if(response.statusCode==200){
      SingleSession session = SingleSession.fromJson(response.body);
      todaySession.value= session;
      print("===========================${session.title}");
      print("===========================${session.sId}");
      print("===========================${todaySession.value!.title}");
      print("===========================${todaySession.value!.sId}");
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }
}
