import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/mange_class/manage_class.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppImg/app_img.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../home_screen.dart';
import '../../profile/profile.dart';
enum UserType { member, guest }

class BottomNavController extends GetxController {
  final authController = Get.find<AuthController>();
  final HomeController homeController = Get.find<HomeController>();
  RxInt selectedIndex = 0.obs;

  @override
  Future<void> onInit() async {
   await homeController.getProfile();
    super.onInit();
  }

  // Method to change page
  void changePage(int index) {
    selectedIndex.value = index;
    update();
  }

  // Get pages based on user type
  List<Widget> getPages() {
    return [
      const HomeScreen(),
      ManageClass(),
      ProfileScreen()
    ];
  }

  // Get navigation items based on user type
  List<Map<String, String>> getNavItems() {
      return [
        {'nonSelected': AppImages.homeGrey, 'selected': AppImages.homeGreen},
        {'nonSelected': AppImages.manageGrey, 'selected': AppImages.manageClassGreen},
        {'nonSelected': AppImages.menuGrey, 'selected': AppImages.menuGreen},
      ];
    }
}