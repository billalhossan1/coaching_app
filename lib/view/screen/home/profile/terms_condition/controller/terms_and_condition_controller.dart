import 'package:get/get.dart';

import '../../../../../../utils/ToastMsg/toast_message.dart';
import '../../about/repo/about_repo.dart';

class TermsAndConditionController extends GetxController{
  RxBool isLoading = false.obs;
  RxString termAndCondition = ''.obs;
  @override
  void onInit() {
    getTermsAndCondition();
    super.onInit();
  }


  Future<void>getTermsAndCondition()async{
    isLoading.value = true;
    Response response = await AboutRepo().disclaimer("terms");
    isLoading.value = false;
    if(response.statusCode == 200){
      termAndCondition.value = response.body["data"]["content"];
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }
}