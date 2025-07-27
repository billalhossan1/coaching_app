import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/assign_home_work_controller.dart';
import 'package:football_coaching_coach_app/view/widget/custom_button.dart';
import 'package:football_coaching_coach_app/view/widget/custom_text_form_field.dart';
import 'package:football_coaching_coach_app/view/widget/custom_text_form_field_with_height.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';

class HomeWork extends StatelessWidget {
  const HomeWork({super.key});

  @override
  Widget build(BuildContext context) {
    final AssignHomeWorkController controller =
        Get.find<AssignHomeWorkController>();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 24),
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : CustomButton(
                  text: 'Confirm Home Work',
                  onTap: () {
                    controller.assignHomeWork();
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assign your home work',
                              style: TextStyles.regular14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white300,
                              ),
                            ),
                            Text(
                              '2 Jun, 2025',
                              style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.green50,
                              ),
                            ),
                          ],
                        ),
                        HeightGap(height: 20.h),
                        Text(
                          '''In this Treaming Session eget Donec porta hendrerit ac vehicula, ex sodales. leo. libero, sit Donec amet, sapien id ''',
                          style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white700,
                          ),
                        ),
                        HeightGap(height: 20.h),
                        CustomTextFromFieldWithHeight(
                          controller: controller.tittleController,
                          hintText: 'Title',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldMaxLine(
                          controller: controller.descriptionController,
                          hintText: 'Details',
                          maxLine: 10,
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
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
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
                icon: Icon(Icons.close, color: AppColors.white300),
              ),
            ),
            CustomSvgImage(
              imagePath: AppImages.doneIcon,
              height: 100.h,
              width: 100.w,
            ),
            HeightGap(height: 20.h),
            Text(
              'Your HW is successful',
              style: TextStyles.title14.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white300,
              ),
            ),
            HeightGap(height: 12.h),
            Text(
              'Thank you for Summation your home work on passing level 1',
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
                child: Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Home Work',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
