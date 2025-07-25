import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:get/get.dart';

import '../repo/about_repo.dart';

class AboutScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxString about = ''.obs;
  @override
  void onInit() {
    getAbout();
    super.onInit();
  }


  Future<void>getAbout()async{
    isLoading.value = true;
    Response response = await AboutRepo().disclaimer("about");
    isLoading.value = false;
    if(response.statusCode == 200){
      about.value = response.body["data"]["content"];
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }

}