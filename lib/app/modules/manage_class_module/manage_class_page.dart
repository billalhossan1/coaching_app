import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:football_coaching_coach_app/app/modules/manage_class_module/manage_class_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class manage_classPage extends GetView<manage_classController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('manage_class Page')),
      body: Container(
        child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
