import 'package:get/get.dart';

import '../../../../../../utils/ToastMsg/toast_message.dart';
import '../../about/repo/about_repo.dart';

class AppSupportController extends GetxController{
  RxBool isLoading = false.obs;
  RxString appSupport = ''.obs;
  @override
  void onInit() {
    getAppSupport();
    super.onInit();
  }


  Future<void>getAppSupport()async{
    isLoading.value = true;
    Response response = await AboutRepo().disclaimer("support");
    isLoading.value = false;
    if(response.statusCode == 200){
      appSupport.value = response.body["data"]["content"];
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }
}