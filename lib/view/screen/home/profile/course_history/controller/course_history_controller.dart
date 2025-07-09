import 'package:get/get.dart';

class CourseHistoryController extends GetxController{
  /// ***** TabBar *****
  int selectedIndex = 0;

  String get currentStatus {

    switch (selectedIndex) {
      case 0:
        return "index 0";
      case 1:
        return "index 1";
      default:
        return "index 2";
    }

  }

  // updated TabBar index
  void updatedSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}