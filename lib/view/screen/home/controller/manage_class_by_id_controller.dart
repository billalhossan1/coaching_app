import 'package:flutter/cupertino.dart';
import 'package:football_coaching_coach_app/model/manage_class_model.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:football_coaching_coach_app/view/screen/home/repo/manage_class_repo.dart';
import 'package:get/get.dart';

class ManageClassByIdController extends GetxController{
  Rxn<ManageClass>manageClass = Rxn<ManageClass>();
  String sessionId= '';
  String courseName= '';
  bool? attendance;
  RxBool isLoading = false.obs;



  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  void _initial(){
    sessionId = Get.arguments?['sessionId']??'';
    courseName = Get.arguments?['courseName']??'';

    manageClassById();
  }

  Future<void>manageClassById()async{
    isLoading.value = true;
    Response response = await ManageClassRepo().manageClassById(sessionId);
    isLoading.value = false;
    if(response.statusCode==200){
      ManageClassModel manageClassModel = ManageClassModel.fromJson(response.body);
      manageClass.value = manageClassModel.data;
    }
  }






  Future<void>updateAttandence(bool attendance,String userId)async{

   try{
     Response response = await ManageClassRepo().updateAttandence(attendance:  attendance,sessionId:  sessionId,userId: userId);
     if(response.statusCode==200){
       print("success");

     }else{
       showCustomSnackBar(response.statusText??"Something went wrong");
     }
   }catch(e){debugPrint(e.toString());}


  }





}