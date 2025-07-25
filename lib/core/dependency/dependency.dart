import 'package:football_coaching_coach_app/view/screen/home/controller/course_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/setting/controller/change_password_controller.dart';
import 'package:get/get.dart';

import '../../view/screen/auth/controller/auth_controller.dart';
import '../../view/screen/home/bottom_nav_bar/controller/controller.dart';
import '../../view/screen/home/controller/home_controller.dart';
import '../../view/screen/home/controller/scedule_controller.dart';
import '../../view/screen/home/profile/academic_fee/controller/controller.dart';
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
    Get.lazyPut(() => CourseHistoryController(), fenix: true);
    Get.lazyPut(() => ScheduleController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => CourseDetailsController(), fenix: true);
  }
}
