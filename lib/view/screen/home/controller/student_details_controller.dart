import 'package:football_coaching_coach_app/model/student_details_model.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:get/get.dart';

import '../repo/course_details_repo.dart';

class StudentDetailsController extends GetxController{
  RxBool isLoading = false.obs;
  Rxn<StudentDetails>studentDetails = Rxn<StudentDetails>();
  String userId = '';
  String sessionId = '';

  @override
  void onInit() {
    initial();
    super.onInit();
  }

  void initial(){
    userId = Get.arguments['userId'];
    sessionId = Get.arguments['sessionId'];
    getStudentDetails();
  }

  Future<void>getStudentDetails()async{
    isLoading.value = true;
    Response response = await CourseDetailsRepo().studentDetails(userId: userId, sessionId: sessionId);
    isLoading.value = false;
    if(response.statusCode==200){
      StudentDetailsModel studentDetailsModel = StudentDetailsModel.fromJson(response.body);
      studentDetails.value = studentDetailsModel.studentDetails;
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }
}