import 'package:flutter/cupertino.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/repo/manage_class_repo.dart';
import 'package:get/get.dart';

class AssignHomeWorkController extends GetxController{
  RxBool isLoading = false.obs;
  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String sessionId = '';
  @override
  void onInit() {
    sessionId=Get.arguments['sessionId'];
    super.onInit();
  }

  Future<void>assignHomeWork()async{
    isLoading.value = true;
    Response response = await ManageClassRepo().assignHomeWork(tittle: tittleController.text.trim(), sessionId: sessionId, description: descriptionController.text.trim());
    isLoading.value = false;
    if(response.statusCode==200){

      Get.back();
      showCustomSnackBar("Home work assigned successfully",isError: false);

    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }


}