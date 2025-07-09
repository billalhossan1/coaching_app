import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable state to track if text is expanded
  var isExpanded = false.obs;

  // Toggle the expansion state
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
}
