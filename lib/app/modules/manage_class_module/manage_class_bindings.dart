import 'package:football_coaching_coach_app/app/modules/manage_class_module/manage_class_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class manage_classBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => manage_classController());
  }
}