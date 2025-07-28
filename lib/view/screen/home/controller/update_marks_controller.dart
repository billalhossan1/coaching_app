import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/performance_model.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_by_id_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_controller.dart';
import 'package:get/get.dart';

import '../repo/manage_class_repo.dart';

class UpdateMarksController extends GetxController{
  RxBool updateIsLoading = false.obs;
  RxBool isLoading = false.obs;
  String sessionId= '';
  String userId= '';
  String userImage= '';
  String userName= '';
  int avarageMark = 0;
  List<Performance>performanceList = [];
  TextEditingController pacController = TextEditingController();
  TextEditingController shoController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  TextEditingController driController = TextEditingController();
  TextEditingController cooController = TextEditingController();
  TextEditingController phyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? manage;

  int parseScore(int? score) {
    if (score == null) return 0;
    try {
      return score;
    } catch (_) {
      return 0;
    }
  }
  int safeScore(int? score) {
    if (score == null) return 0;
    return score;
  }


  @override
  void onInit() {
    initial();

    super.onInit();
  }
  void initial()async{
    userId = Get.arguments['userId'];
    sessionId = Get.arguments['sessionId'];
    userName = Get.arguments['userName'];
    userImage = Get.arguments['userImage'];
    manage = Get.arguments?['manage']??'';
    print("=============================manage:$manage");
    await getStudentMark();
   if(performanceList.isNotEmpty){
     pacController.text = safeScore(performanceList[0].score).toString();
     driController.text = safeScore(performanceList[1].score).toString();
     shoController.text = safeScore(performanceList[2].score).toString();
     cooController.text = safeScore(performanceList[3].score).toString();
     phyController.text = safeScore(performanceList[4].score).toString();
     pasController.text = safeScore(performanceList[5].score).toString();


     int totalScore =
         parseScore(performanceList[0].score) +
             parseScore(performanceList[1].score) +
             parseScore(performanceList[2].score) +
             parseScore(performanceList[3].score) +
             parseScore(performanceList[4].score) +
             parseScore(performanceList[5].score);
     avarageMark = totalScore ~/ 6;

     update();
   }
    print("pacController.text = ${pacController.text}");
    print("shoController.text = ${shoController.text}");
    print("pasController.text = ${pasController.text}");
    print("driController.text = ${driController.text}");
    print("cooController.text = ${cooController.text}");
    print("phyController.text = ${phyController.text}");
  }


  Future<void>getStudentMark()async{
    isLoading.value = true;
    Response response = await ManageClassRepo().getPerformanceMark(userId: userId,sessionId: sessionId);
    isLoading.value = false;
    if(response.statusCode==200) {
      PerformanceModel performanceModel = PerformanceModel.fromJson(response.body);
      performanceList= performanceModel.performance??[];
    }

  }

  Future<void>updatePerformance()async{
   if(formKey.currentState!.validate()){
     List<Map<String, dynamic>>?performance=[ {
       "topic": "PAC",
       "score": pacController.text.trim()
     },
       {
         "topic": "DRI",
         "score": driController.text.trim()
       },
       {
         "topic": "SHO",
         "score": shoController.text.trim()
       },
       {
         "topic": "COO",
         "score": cooController.text.trim()
       },
       {
         "topic": "PHY",
         "score": phyController.text.trim()
       },
       {
         "topic": "PAS",
         "score": pasController.text.trim()
       }];
     updateIsLoading.value = true;
     Response response = await ManageClassRepo().updatePerformance(performance:  performance,sessionId:  sessionId,userId: userId);
     if(response.statusCode==200){
       if(manage!.isEmpty){
         await Get.find<ManageClassByIdController>().manageClassById();
       }

      else{
         print("api call===================================");
         await Get.find<ManageClassController>().getSessionDetails(sessionId);
       }

       updateIsLoading.value = false;
       Get.back();

     }
     updateIsLoading.value = false;
   }


  }

}