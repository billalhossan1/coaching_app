import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_form_field_with_height.dart';
import '../../../widget/size.dart';
import '../widget/see_more_text_widget.dart';
class HomeWork extends StatelessWidget {
  const HomeWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeightGap(height: 8.h),
                      Text('2 Jun, 2025', style: TextStyles.regular12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.green50
                      ),),
                      HeightGap(height: 12.h),
                      Text('Passing Level 1', style: TextStyles.regular14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.white500
                      ),),
                      HeightGap(height: 8.h),
                      SeeMoreTextWidget(text: """Sed tincidunt quis tortor. non quam Quisque placerat commodo laoreet Nunc ipsum hendrerit Ut ex amet, dui turpis malesuada laoreet tincidunt amet"""),
                      HeightGap(height: 8.h),
                      Text('You have to complete this task before 3 Jun, 2025 5:00 pm', style: TextStyles.regular12.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFF4040)
                      ),),
                      HeightGap(height: 8.h),
                      Divider(
                        color: AppColors.white900,
                        thickness: 0.3,
                      ),
                      HeightGap(height: 30.h),
                      Container(
                        height: 142.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(
                            color: AppColors.green50,
                            width: 1
                          )
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.videocam, color: AppColors.white800, size: 32,),
                              HeightGap(height: 8.h),
                              Text('Upload Home Work Video', style: TextStyles.regular14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white700
                              ),)
                            ],
                          ),
                        ),
                      ),
                      HeightGap(height: 30.h),
                      CustomTextFromFieldWithHeight(hintText: 'Statement (Optional)',),
                      HeightGap(height: 150.h),
                      CustomButton(text: 'Submit Home Work', onTap: (){})
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
  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          color: AppColors.appBar,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r))),
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
                'Home Work',
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
