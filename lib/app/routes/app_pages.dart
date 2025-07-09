import '../../app/modules/manage_class_module/manage_class_bindings.dart';
import '../../app/modules/manage_class_module/manage_class_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.MANAGE_CLASS,
      page: () => manage_classPage(),
      binding: manage_classBinding(),
    ),
  ];
}