import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/utils/AppImg/app_img.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/update_marks_controller.dart';
import 'package:football_coaching_coach_app/view/widget/custom_button.dart';
import 'package:football_coaching_coach_app/view/widget/custom_svg.dart';
import 'package:football_coaching_coach_app/view/widget/custom_text_form_field_with_height.dart';
import 'package:football_coaching_coach_app/view/widget/network_image_widget.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class Performance extends StatelessWidget {
  const Performance({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateMarksController controller = Get.find<UpdateMarksController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 8.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Give your performance mark',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white300,
                          ),
                        ),
                        HeightGap(height: 14.h),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: NetworkImageWidget(
                                imageUrl:
                                    '${ApiConstant.imageUrl}${controller.userImage}',
                                height: 30.h,
                                width: 30.w,
                              ),
                            ),
                            WidthGap(width: 8.w),
                            Text(
                              controller.userName,
                              style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white500,
                              ),
                            ),
                          ],
                        ),
                        HeightGap(height: 36.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter PAC Mark';
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.pacController,
                          hintText: controller.pacController.text.isNotEmpty
                              ? controller.pacController.text
                              : 'PAC /100',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter SHO Mark';
                            }else{
                              return null;
                            }
                          },
                          controller: controller.shoController,
                          keyboardType: TextInputType.number,
                          hintText: controller.shoController.text.isNotEmpty
                              ? controller.shoController.text
                              : 'SHO /100',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter PAS Mark';
                            }else{
                              return null;
                            }
                          },
                          controller: controller.pasController,
                          keyboardType: TextInputType.number,

                          hintText: controller.pasController.text.isNotEmpty
                              ? controller.pasController.text
                              : 'PAS /100',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter DRI Mark';
                            }else{
                              return null;
                            }
                          },
                          controller: controller.driController,
                          keyboardType: TextInputType.number,

                          hintText: controller.driController.text.isNotEmpty
                              ? controller.driController.text
                              : 'DRI /100',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter COO Mark';
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,

                          controller: controller.cooController,
                          hintText: controller.cooController.text.isNotEmpty
                              ? controller.cooController.text
                              : 'COO /10',
                          height: 44.h,
                        ),
                        HeightGap(height: 12.h),
                        CustomTextFromFieldWithHeight(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter PHY Mark';
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.phyController,
                          hintText: controller.phyController.text.isNotEmpty
                              ? controller.phyController.text
                              : 'PHY /100',
                          height: 44.h,
                        ),
                        HeightGap(height: 25.h),
                        const Divider(color: AppColors.white900, thickness: 0.6),
                        HeightGap(height: 25.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Average Performance',
                              style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white300,
                              ),
                            ),
                            GetBuilder<UpdateMarksController>(
                              builder: (context) {
                                return Text(
                                  '${controller.avarageMark}',
                                  style: TextStyles.regular20.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white300,
                                  ),
                                );
                              }
                            ),
                          ],
                        ),
                        HeightGap(height: 42.h),
                        Obx(
                          () => controller.updateIsLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: 'Submit Mark',
                                  onTap: () {
                                    controller.updatePerformance();
                                  },
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
      decoration: const BoxDecoration(color: AppColors.appBar),
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
                'Profile Details',
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
