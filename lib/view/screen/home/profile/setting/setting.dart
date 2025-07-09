import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_route/app_route.dart';
import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/size.dart';
class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 4.h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.changePassword);
                },
                child: Row(
                  children: [
                    Icon(Icons.lock_open,color: AppColors.white500,),
                    WidthGap(width: 8.w),
                    Text('Change Password', style: TextStyles.regular16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white500
                    ),)
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
                'Settings',
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
