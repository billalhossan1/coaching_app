import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/model/performance_model.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_by_id_controller.dart';
import 'package:get/get.dart';

import '../repo/manage_class_repo.dart';

class UpdateMarksController extends GetxController{
  RxBool updateIsLoading = false.obs;
  RxBool isLoading = false.obs;
  String sessionId= '';
  String userId= '';
  String userImage= '';
  String userName= '';
  List<Performance>performanceList = [];
  TextEditingController pacController = TextEditingController();
  TextEditingController shoController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  TextEditingController driController = TextEditingController();
  TextEditingController cooController = TextEditingController();
  TextEditingController phyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    await getStudentMark();
   if(performanceList.isNotEmpty){
     pacController.text = performanceList[0].score.toString();
     driController.text = performanceList[1].score.toString();
     shoController.text = performanceList[2].score.toString();
     cooController.text = performanceList[3].score.toString();
     phyController.text = performanceList[4].score.toString();
     pasController.text = performanceList[5].score.toString();
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
       await Get.find<ManageClassByIdController>().manageClassById();
       updateIsLoading.value = false;
       Get.back();

     }
     updateIsLoading.value = false;
   }


  }

}