import 'package:football_coaching_coach_app/view/screen/home/controller/assign_home_work_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/course_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/course_history_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_by_id_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/student_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/update_marks_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/setting/controller/change_password_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/terms_condition/controller/terms_and_condition_controller.dart';
import 'package:get/get.dart';

import '../../view/screen/auth/controller/auth_controller.dart';
import '../../view/screen/home/bottom_nav_bar/controller/controller.dart';
import '../../view/screen/home/controller/home_controller.dart';
import '../../view/screen/home/controller/scedule_controller.dart';
import '../../view/screen/home/notificaiton/notification_controller.dart';
import '../../view/screen/home/profile/about/controller/about_screen_controller.dart';
import '../../view/screen/home/profile/academic_fee/controller/controller.dart';
import '../../view/screen/home/profile/app_support/controller/app_supprot_controller.dart';
import '../../view/screen/home/profile/course_history/controller/course_history_controller.dart';
import '../../view/screen/onboarding/controller/onboarding_controller.dart';
import '../../view/screen/onboarding/controller/splash_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AcademicFeesController(), fenix: true);
    Get.lazyPut(() => CoursesHistoryController(), fenix: true);
    Get.lazyPut(() => ScheduleController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => CourseDetailsController(), fenix: true);
    Get.lazyPut(() => AboutScreenController(), fenix: true);
    Get.lazyPut(() => TermsAndConditionController(), fenix: true);
    Get.lazyPut(() => AppSupportController(), fenix: true);
    Get.lazyPut(() => ManageClassByIdController(), fenix: true);
    Get.lazyPut(() => UpdateMarksController(), fenix: true);
    Get.lazyPut(() => AssignHomeWorkController(), fenix: true);
    Get.lazyPut(() => CourseHistoryController(), fenix: true);
    Get.lazyPut(() => ManageClassController(), fenix: true);
    Get.lazyPut(() => StudentDetailsController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
