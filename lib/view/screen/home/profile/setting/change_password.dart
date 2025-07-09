import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_text_form_field_with_height.dart';
import '../../../../widget/size.dart';
class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightGap(height: 8.h),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your new password must be different from previous passwords', style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white500),
                            maxLines: null,
                            textAlign: TextAlign.center,
                          ),
                          HeightGap(height: 30.h),
                          CustomTextFromFieldWithHeight(hintText: 'Old Password',height: 44.h,),
                          HeightGap(height: 30.h),
                          CustomTextFromFieldWithHeight(hintText: 'New Password',height: 44.h,),
                          HeightGap(height: 30.h),
                          CustomTextFromFieldWithHeight(hintText: 'Confirm password',height: 44.h,),
                          HeightGap(height: 30.h),
                          CustomButton(text: 'Update Password', onTap: (){})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
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
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
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
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.white50,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Change Password',
                style: TextStyles.regular20.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.white50),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
