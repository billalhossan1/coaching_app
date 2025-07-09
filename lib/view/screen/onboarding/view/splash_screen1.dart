import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/AppImg/app_img.dart';
import '../controller/splash_controller.dart';


class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Obx(() => Transform.scale(
          scale: controller.logoScale.value,
          child: Image(image: AssetImage(AppImages.logo)),
        )),
      ),
    );
  }
}