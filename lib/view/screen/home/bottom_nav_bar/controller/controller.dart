import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppImg/app_img.dart';
import '../../../auth/controller/auth_controller.dart';
import '../../../guest/guest_auth/sign_in_screen.dart';
import '../../elit_training/elit_training.dart';
import '../../enroll_elit/enroll_elit.dart';
import '../../home_screen.dart';
import '../../profile/profile.dart';
import '../../profile_state/profile_state.dart';
import '../../shop/shop.dart';
enum UserType { member, guest }

class BottomNavController extends GetxController {
  final authController = Get.find<AuthController>();
  RxInt selectedIndex = 0.obs;

  // Method to change page
  void changePage(int index) {
    selectedIndex.value = index;
    update();
  }

  // Get pages based on user type
  List<Widget> getPages() {
    return [
      HomeScreen(),
      ShopScreen(),
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