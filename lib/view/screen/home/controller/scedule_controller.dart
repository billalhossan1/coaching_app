import 'package:flutter/cupertino.dart';
import 'package:football_coaching_coach_app/model/upcomming_session_list_model.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:football_coaching_coach_app/view/screen/home/repo/home_screen_repo.dart';
import 'package:get/get.dart';

class ScheduleController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<UpComingSessionModel> scheduleList = <UpComingSessionModel>[].obs;
  ScrollController scheduleScrollController = ScrollController();
  int page = 1;
  int totalPage =1;


  @override
  void onInit() {
    getAllSchedule();
    scheduleScrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener(){
    if(scheduleScrollController.position.pixels == scheduleScrollController.position.maxScrollExtent){
      if(page<totalPage){
        page++;
        getAllSchedule(page: page);
      }
    }

  }

  Future<void>getAllSchedule({int page = 1})async{
    try{
      isLoading.value = true;
      Response response = await HomeScreenRepo().getUpcomingSession(page,all: true);
      isLoading.value = false;

      if(response.statusCode ==200){
        if(page==1){
          scheduleList.clear();
        }
        UpcomingSessionListModel upcomingSessionListModel = UpcomingSessionListModel.fromJson(response.body);
        scheduleList.addAll(upcomingSessionListModel.upComingSessionList??[]);
        totalPage = upcomingSessionListModel.pagination?.totalPage??0;
      }else{
        showCustomSnackBar(response.statusText??"Something went wrong");
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }


}