import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_route/app_route.dart';
import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/size.dart';

class AcademicFee extends StatelessWidget {
  const AcademicFee({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.appBar,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        'May you want to clear to Academic Fees',
                        style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white600),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        text: 'Continue',
                        onTap: () {
                          Get.toNamed(AppRoute.feeDetails);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
            HeightGap(height: 12.h),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('#1458118', style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white700
                            ),),
                            Text('Payment Date: 1-May-2025', style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white700
                            ),),
                            Text('Price: \$230.00', style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white700
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_,__){
                  return HeightGap(height: 8.h);
                },
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
                'Academic Fee',
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
