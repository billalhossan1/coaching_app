import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/app_route/app_route.dart';
import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/AppImg/app_img.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_svg.dart';
import '../../../../widget/size.dart';

class PresentCourse extends StatelessWidget {
  const PresentCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 90.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                      image: AssetImage(AppImages.blueBg), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Under 20 summer 25',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white600,
                          ),
                        ),
                        Text(
                          '25 Jun, 2025 - 25 Jun, 2025   ',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white600,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoute.courseDetails);
                      },
                      child: CustomSvgImage(
                        imagePath: AppImages.next,
                        height: 42.h,
                        width: 42.w,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return HeightGap(height: 10.h);
          },
        ),
      ),
    );
  }
}
