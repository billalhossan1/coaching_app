import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/custom_app_bar.dart';
import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';
import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/AppImg/app_img.dart';
import '../../../utils/Texts/text_style.dart';
import '../../widget/custom_svg.dart';
import '../../widget/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarWithoutBorder(context),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.cartBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Under 15 summer 25',
                          style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.green300,
                          ),
                        ),
                        Text(
                          'Passing Level 1',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '25 Jun, 2025',
                        style: TextStyles.title20.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.green300,
                        ),
                      ),
                      Text(
                        '3:00 PM – 4:30 PM',
                        style: TextStyles.regular12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.golden700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Session Schedule',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white300,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoute.schedule);
                          },
                          child: Text(
                            'View All',
                            style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 0,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2 Schedule ',
                          style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white900,
                          ),
                        ),
                        Text(
                          '25 Jun, 2025',
                          style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /// Schedule
                  ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.grey900
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Under 15 summer 25',
                                style: TextStyles.regular12.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.green500,
                                ),
                              ),
                              HeightGap(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Passing Level 1',
                                    style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.white400,
                                    ),
                                  ),
                                  Text(
                                    '3:00 PM – 4:30 PM',
                                    style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_,__){
                      return HeightGap(height: 8.h);
                    },
                  ),
                  HeightGap(height: 12.h),
                  Text(
                    'Courses',
                    style: TextStyles.regular16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white300,
                    ),
                  ),
                  HeightGap(height: 12.h),
                  /// Courses
                  ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoute.homeCourseDetails);
                        },
                        child: Container(
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
                                CustomSvgImage(
                                  imagePath: AppImages.next,
                                  height: 42.h,
                                  width: 42.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return HeightGap(height: 10.h);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
