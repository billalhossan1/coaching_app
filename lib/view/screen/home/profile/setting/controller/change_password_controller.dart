import 'package:flutter/cupertino.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:get/get.dart';

import '../repo/change_pass_repo.dart';

class ChangePasswordController extends GetxController{
  RxBool isLoading = false.obs;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<void>onTapChangePass()async{
    if(formKey.currentState!.validate()){
      if(confirmPasswordController.text!=newPasswordController.text){
        return showCustomSnackBar("New password and confirm password does not match",isError: true);
      }else{
        isLoading.value=true;
        Response response = await ChangePassRepo().changePass(oldPass: oldPasswordController.text, newPass: newPasswordController.text, confirmPass: confirmPasswordController.text);
        isLoading.value=false;
        if(response.statusCode==200){
          Navigator.pop(Get.context!);
          showCustomSnackBar("Password Changed Successfully",isError: false);
        }else{
          showCustomSnackBar(response.statusText??"Something Went Wrong",isError: true);
        }
      }

    }else{
      return showCustomSnackBar("Please fill all the fields",isError: true);
    }

  }
}