import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademicFeesController extends GetxController{
  /// Gender drop down
  var selectedGenderValue = Rxn<String>();
  final List<String> genderItems = [
    "Male",
    "Female",
    "Other",
  ];
  void setGenderValue(String value) {
    selectedGenderValue.value = value;
  }

  final dateTimeController= TextEditingController();
  var selectedDate = Rxn<DateTime>();

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      dateTimeController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}