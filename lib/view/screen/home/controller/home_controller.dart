import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/ToastMsg/toast_message.dart';
import '../profile/model/profile_model.dart';
import '../profile/repo/profile_repo.dart';

class HomeController extends GetxController {
  // Observable state to track if text is expanded
  var isExpanded = false.obs;
  RxBool isProfileLoading = false.obs;
  Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();

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



}
