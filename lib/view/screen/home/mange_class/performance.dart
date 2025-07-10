import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/utils/AppImg/app_img.dart';
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
                                  "https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_640.png",
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                          WidthGap(width: 8.w),
                          Text(
                            'Asad Ujjaman',
                            style: TextStyles.regular12.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white500,
                            ),
                          ),
                        ],
                      ),
                      HeightGap(height: 36.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'PAC /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 12.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'SHO /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 12.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'PAS /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 12.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'DRI /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 12.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'COO /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 12.h),
                      CustomTextFromFieldWithHeight(
                        hintText: 'PHY /100',
                        height: 44.h,
                      ),
                      HeightGap(height: 25.h),
                      Divider(color: AppColors.white900, thickness: 0.6),
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
                          Text(
                            '80%',
                            style: TextStyles.regular20.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white300,
                            ),
                          ),
                        ],
                      ),
                      HeightGap(height: 42.h),
                      CustomButton(
                        text: 'Submit Mark',
                        onTap: () {
                          Get.dialog(
                            successfulDialogue(),
                          );
                        },
                      ),
                    ],
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
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
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
                icon: Icon(Icons.close, color: AppColors.white300,),
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
      decoration: BoxDecoration(color: AppColors.appBar),
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
                'Profile Details',
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
