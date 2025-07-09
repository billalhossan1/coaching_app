import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final PageController pageController = PageController();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  void startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (currentPage.value < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }

      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    if(index==2){
      Get.toNamed(AppRoute.signInScreen);
    }
  }

  void pauseAutoSlide() {
    _timer?.cancel();
  }

  void resumeAutoSlide() {
    startAutoSlide();
  }
}
