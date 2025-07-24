import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/course_model.dart';
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
  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();
  RxList<Course>courseList = RxList<Course>();

  // Toggle the expansion state

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void>getProfile()async{
    try{
      isProfileLoading.value = true;
      Response response = await ProfileRepo().getProfile();
      isProfileLoading.value = false;
      if(response.statusCode==200){
        profileModel.value = ProfileModel.fromJson(response.body);
        update();
      }else{
        showCustomSnackBar(response.statusText ?? "Something went wrong");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<void>getCourses()async{
   try{
     isCourseLoading.value = true;
     Response response = await HomeScreenRepo().getCourse();
     isCourseLoading.value = false;

     if(response.statusCode==200){
       CourseListModel courseListModel = CourseListModel.fromJson(response.body);
       courseList.value = courseListModel.courseList??[];
       print("courseList:====================== ${courseList.length}");
     }else{
       showCustomSnackBar(response.statusText ?? "Something went wrong");
     }
   }catch(e){
     debugPrint(e.toString());
   }
  }





}
