import 'package:get/get.dart';

import '../../view/screen/auth/controller/auth_controller.dart';
import '../../view/screen/home/bottom_nav_bar/controller/controller.dart';
import '../../view/screen/home/controller/home_controller.dart';
import '../../view/screen/home/profile/academic_fee/controller/controller.dart';
import '../../view/screen/home/profile/course_history/controller/course_history_controller.dart';
import '../../view/screen/home/shop/controller/shop_controller.dart';
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
    Get.lazyPut(() => ShopController(), fenix: true);
    Get.lazyPut(() => AcademicFeesController(), fenix: true);
    Get.lazyPut(() => CourseHistoryController(), fenix: true);
  }
}
