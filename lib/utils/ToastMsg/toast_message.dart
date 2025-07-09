
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if (message.trim().isEmpty) return;

  final backgroundColor = isError ? Colors.red.shade600 : Colors.green.shade600;
  final icon = isError ? Icons.error_outline : Icons.check_circle_outline;

  final snackBar = GetSnackBar(
    duration: const Duration(seconds: 3),
    backgroundColor: backgroundColor,
    borderRadius: 12.r,
    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    snackStyle: SnackStyle.FLOATING,
    animationDuration: const Duration(milliseconds: 400),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    messageText: Row(
      children: [
        Icon(icon, color: Colors.white, size: 20.sp),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

  Get.closeCurrentSnackbar();
  Get.showSnackbar(snackBar);
}
