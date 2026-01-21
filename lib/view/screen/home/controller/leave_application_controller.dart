import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/repo/manage_class_repo.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class LeaveApplicationController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime? startDate;
  DateTime? endDate;
  Rx<PlatformFile?> pickedDocument = Rx<PlatformFile?>(null);

  Future<void> pickDate(
    BuildContext context, {
    required bool isStartDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      if (isStartDate) {
        startDate = picked;
      } else {
        endDate = picked;
      }
      update();
    }
  }

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx'],
    );

    if (result != null && result.files.isNotEmpty) {
      pickedDocument.value = result.files.first;
    }
  }

  Future<void> applyLeave() async {
    if (startDate == null || endDate == null) {
      showCustomSnackBar("Please select both start and end dates");
      return;
    }
    if (descriptionController.text.isEmpty) {
      showCustomSnackBar("Please provide a reason");
      return;
    }

    isLoading.value = true;
    Response response = await ManageClassRepo().leaveApplication(
      startDate: DateFormat('yyyy-MM-dd').format(startDate!),
      endDate: DateFormat('yyyy-MM-dd').format(endDate!),
      reason: descriptionController.text.trim(),
      document:
          pickedDocument.value != null && pickedDocument.value!.path != null
          ? File(pickedDocument.value!.path!)
          : File(''),
    );
    isLoading.value = false;
    if (response.statusCode == 200) {
      // Get.find<ManageClassController>().getOverview();
      Get.back();
      showCustomSnackBar(
        "Leave application submitted successfully",
        isError: false,
      );
    } else {
      showCustomSnackBar(response.statusText ?? "Something went wrong");
    }
  }
}
