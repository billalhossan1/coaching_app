import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/course_model.dart';
import 'package:football_coaching_coach_app/model/manage_class_model.dart' hide SessionDetails;
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_by_id_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/repo/home_screen_repo.dart';
import 'package:get/get.dart';

import '../../../../model/course_overview_model.dart';
import '../../../../model/sessionListByIdModel.dart';
import '../../../../model/session_details_model.dart' hide Course;
import '../../../../model/vedio_list_model.dart';
import '../../../../utils/ToastMsg/toast_message.dart';
import '../repo/course_details_repo.dart';
import '../repo/manage_class_repo.dart';

class ManageClassController extends GetxController{
  RxBool isLoading = false.obs;
  var selectedClassValue = Rxn<String>(); // Store selected name
  var selectedCourseId = Rxn<String>();
  var selectedClassId =Rxn<String>();
  Rxn<Course>selectedCourse = Rxn<Course>();
  Rxn<ManageClass>sessionItemDetails = Rxn<ManageClass>();

  int page =1;


  @override
  void onInit() {
    initial();
    super.onInit();
  }

  void initial(){
    fetchStudentCourse();
  }


  RxString classId= ''.obs;
  void setClassId(String id){
    classId.value= id;
  }

  void setSelectedClassValue(String value) {
    selectedClassValue.value = value;

    final matchedCourse = courseList.firstWhere(
          (course) => course.name == value,
      orElse: () => Course(),
    );

    selectedCourse.value = matchedCourse;
    selectedCourseId.value = matchedCourse.sId ?? '';
    getOverview();
    getSessionList();
    getVideos(courseId: selectedCourseId.value!);
  }


  List<String> get classItems {
    final uniqueNames = <String>[];
    final seenNames = <String>{};
    for (var item in courseList) {
      final name = item.name ?? '';
      if (name.isNotEmpty && !seenNames.contains(name)) {
        uniqueNames.add(name);
        seenNames.add(name);
      }
    }
    return uniqueNames;
  }


    Future<void>manageClassById()async{
      isLoading.value = true;
      Response response = await ManageClassRepo().manageClassById(selectedClassId.value!);
      isLoading.value = false;
      if(response.statusCode==200){
        ManageClassModel manageClassModel = ManageClassModel.fromJson(response.body);
        sessionItemDetails.value = manageClassModel.data;
        update();
      }
  }

  RxList<Course> courseList = <Course>[].obs;
  Future<void> fetchStudentCourse() async {
    try {
      isLoading.value = true;
      Response response = await HomeScreenRepo().getCourse(page);
      if (response.statusCode == 200) {
        CourseListModel courseListModel = CourseListModel.fromJson(response.body);
        if (courseListModel.courseList != null) {
          courseList.clear();
          courseList.addAll(courseListModel.courseList??[]);



          update();
        }
      } else {
        // showCustomSnackBar("Error fetching on Student Course", isError: true);
      }
    } catch (e) {
      // showCustomSnackBar("Error: ${e.toString()}", isError: true);
      debugPrint("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
  RxBool isSessionIsLoading = false.obs;
  RxBool isVideosLoading = false.obs;
  RxBool isOverviewLoading = false.obs;
  RxBool isSessionDetailsLoading = false.obs;
  RxBool isSessionPaginationLoading = false.obs;
  RxBool isVideoPaginationLoading = false.obs;
  RxList<SessionItem> sessionList = RxList<SessionItem>();
  RxList<VideoModel> videoList = RxList<VideoModel>();
  Rxn<SessionDetails>sessionDetails = Rxn<SessionDetails>();
  Rxn<CourseOverview>courseOverview = Rxn<CourseOverview>();
  int selectedIndex = 0;
  String courseName = '';
  int videoPage = 1;
  int totalPage = 1;
  int videoTotalPage = 1;
  ScrollController sessionScrollController = ScrollController();
  ScrollController videoScrollController = ScrollController();


  void sessionScrollListener(){
    if(sessionScrollController.position.pixels == sessionScrollController.position.maxScrollExtent){
      if(page<totalPage){
        isSessionPaginationLoading.value = true;
        page++;
        getSessionList(page: page);
        isSessionPaginationLoading.value = false;

      }

    }
  }

  Future<void>getSessionList({int page =1})async{
    try{
      if(page==1){
        isSessionIsLoading.value=true;
      }
      Response response = await CourseDetailsRepo().getSessionByCourse(courseId: selectedCourseId.value!,page: page);
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
      selectedClassId.value=sessionId;
      print("===================selectedclass:${selectedClassId.value}");
      isSessionDetailsLoading.value=true;
      Response response = await CourseDetailsRepo().getSessionDetails(sessionId: sessionId);
      isSessionDetailsLoading.value=false;
      if(response.statusCode==200){
        SessionDetailsModel sessionDetailsModel = SessionDetailsModel.fromJson(response.body);
        sessionDetails.value = sessionDetailsModel.sessionDetails;
        update();
      }
      else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  void videoScrollControllerListener(){
    if(videoScrollController.position.pixels == videoScrollController.position.maxScrollExtent){
      if(videoPage<videoTotalPage){
        isVideoPaginationLoading.value = true;
        videoPage++;
        getVideos(courseId: selectedCourseId.value!,page: videoPage);
        isVideoPaginationLoading.value = false;

      }

    }
  }


  Future<void>getVideos({int page = 1,required String courseId})async{
    isVideosLoading.value = true;
    Response response = await CourseDetailsRepo().getVideos(courseId: courseId,page: page);
    isVideosLoading.value = false;
    if(response.statusCode==200){
      VideoListModel videoListModel = VideoListModel.fromJson(response.body);
      videoList.addAll(videoListModel.videoList??[]);
    }
    else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }

  Future<void>getOverview()async{
    try{
      isOverviewLoading.value = true;
      Response response = await CourseDetailsRepo().courseOverView(selectedCourseId.value!);
      isOverviewLoading.value = false;
      if(response.statusCode==200){
        CourseOverViewModel courseOverViewModel = CourseOverViewModel.fromJson(response.body);
        courseOverview.value = courseOverViewModel.courseOverview;
      }
      else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<void>updateAttandence(bool attendance,String userId)async{

    try{
      Response response = await ManageClassRepo().updateAttandence(attendance:  attendance,sessionId:  selectedClassId.value!,userId: userId);
      if(response.statusCode==200){
        print("success");

      }else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }
    }catch(e){debugPrint(e.toString());}


  }
}