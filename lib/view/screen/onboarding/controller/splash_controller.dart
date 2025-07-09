import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';

class SplashController extends GetxController {
  RxDouble logoScale = 0.5.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
    _navigateToHome();
  }

  // Animate logo from small to large
  void _startAnimation() async {
    for (double i = 0.5; i <= 1.0; i += 0.05) {
      logoScale.value = i;
      await Future.delayed(const Duration(milliseconds: 75)); // Smooth animation
    }
  }

  // Navigate to HomeScreen after 2 seconds
  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(AppRoute.splashScreen2);
  }
}