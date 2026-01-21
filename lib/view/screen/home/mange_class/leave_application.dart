import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/assign_home_work_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/leave_application_controller.dart';
import 'package:football_coaching_coach_app/view/widget/custom_button.dart';
import 'package:football_coaching_coach_app/view/widget/custom_text_form_field.dart';
import 'package:football_coaching_coach_app/view/widget/custom_text_form_field_with_height.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';

class LeaveApplication extends StatelessWidget {
  const LeaveApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaveApplicationController controller =
        Get.find<LeaveApplicationController>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : CustomButton(
                  text: 'Apply',
                  onTap: () {
                    controller.applyLeave();
                  },
                ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Date',
                          style: TextStyles.regular16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white300,
                          ),
                        ),
                        HeightGap(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: GetBuilder<LeaveApplicationController>(
                                builder: (controller) => GestureDetector(
                                  onTap: () => controller.pickDate(
                                    context,
                                    isStartDate: true,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 14.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.grey800,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.grey700,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.white50,
                                          size: 20.sp,
                                        ),
                                        WidthGap(width: 8.w),
                                        Text(
                                          controller.startDate == null
                                              ? 'Start Date'
                                              : DateFormat(
                                                  'dd MMM yyyy',
                                                ).format(controller.startDate!),
                                          style: TextStyles.regular14.copyWith(
                                            color: AppColors.white50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            WidthGap(width: 12.w),
                            Expanded(
                              child: GetBuilder<LeaveApplicationController>(
                                builder: (controller) => GestureDetector(
                                  onTap: () => controller.pickDate(
                                    context,
                                    isStartDate: false,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 14.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.grey800,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.grey700,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.white50,
                                          size: 20.sp,
                                        ),
                                        WidthGap(width: 8.w),
                                        Text(
                                          controller.endDate == null
                                              ? 'End Date'
                                              : DateFormat(
                                                  'dd MMM yyyy',
                                                ).format(controller.endDate!),
                                          style: TextStyles.regular14.copyWith(
                                            color: AppColors.white50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        HeightGap(height: 16.h),
                        Text(
                          'Reason',
                          style: TextStyles.regular16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white300,
                          ),
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldMaxLine(
                          controller: controller.descriptionController,
                          hintText: 'Enter reason here...',
                          maxLine: 5,
                        ),
                        HeightGap(height: 16.h),
                        Text(
                          'Upload Document (Optional)',
                          style: TextStyles.regular16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.white300,
                          ),
                        ),
                        HeightGap(height: 12.h),
                        GestureDetector(
                          onTap: () => controller.pickDocument(),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                              color: AppColors.grey800,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: AppColors.grey700,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Obx(
                              () => Column(
                                children: [
                                  Icon(
                                    Icons.cloud_upload_outlined,
                                    color: AppColors.white50,
                                    size: 32.sp,
                                  ),
                                  HeightGap(height: 8.h),
                                  Text(
                                    controller.pickedDocument.value == null
                                        ? 'Tap to upload document'
                                        : controller.pickedDocument.value!.name,
                                    style: TextStyles.regular14.copyWith(
                                      color: AppColors.white50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Successful Dialogue
  Dialog successfulDialogue() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grey800,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close, color: AppColors.white300),
              ),
            ),
            CustomSvgImage(
              imagePath: AppImages.doneIcon,
              height: 100.h,
              width: 100.w,
            ),
            HeightGap(height: 20.h),
            Text(
              'Leave Application Successful',
              style: TextStyles.title14.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white300,
              ),
            ),
            HeightGap(height: 12.h),
            Text(
              'Thank you for submitting your leave application. We will review it soon.',
              style: TextStyles.regular12.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
        color: AppColors.appBar,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Leave Application',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
