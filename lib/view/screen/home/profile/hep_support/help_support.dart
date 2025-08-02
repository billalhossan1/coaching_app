import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_text_form_field_with_height.dart';
import '../../../../widget/size.dart';
import '../../widget/divider_or_widget.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
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
                          Text('Need Help? We’re Here for You!', style: TextStyles.regular16.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white500)),
                          HeightGap(height: 8.h),
                          Text('Welcome to our Help & Support center. Whether you have a question, ran into a problem, or just need some guidance', style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white900)),
                          HeightGap(height: 60.h),
                          CustomTextFromFieldWithHeight(hintText: 'Email',height: 44.h, keyboardType: TextInputType.emailAddress,),
                          HeightGap(height: 36.h),
                          CustomTextFromFieldWithHeight(hintText: 'Write your opinion',height: 44.h,),
                          HeightGap(height: 24.h),
                          CustomButton(text: 'Send Message', onTap: (){}),
                          HeightGap(height: 48.h),
                          DivideOrWidget(screenWidth: screenWidth),
                          HeightGap(height: 24.h),
                          HelpLineButton(text: 'Help Line', onTap: (){}, isColorWhite: true,)
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
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white50,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Help & Support',
                style: TextStyles.regular20.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.white50),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

