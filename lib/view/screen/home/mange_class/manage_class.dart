import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/widget/schedule_table.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/activity_info_widget.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/size.dart';
import '../widget/custom_appbar_with_title.dart';

class ManageClass extends StatelessWidget {
  const ManageClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbarWithTitle(text: 'Manage Class',),
            HeightGap(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Image(
                                image: AssetImage(AppImages.logo),
                                height: 48,
                                width: 48,
                              ),
                            ),
                            WidthGap(width: 16.w),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0.0, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Elite Academy',
                                    style: TextStyles.title14.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white600),
                                  ),
                                  Text(
                                    'Under 15 summer 25',
                                    style: TextStyles.title16.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.green500),
                                  ),
                                  Text(
                                    'Class No: 2',
                                    style: TextStyles.regular12.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white800),
                                  ),
                                  Text(
                                    '2 Jun, 2025 4:00 PM – 5:30 PM',
                                    style: TextStyles.regular12.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white800),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    HeightGap(height: 12.h),
                    /// Attendance report
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.green500
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActivityInfo(title: '20', description: 'Total Players',),
                            ActivityInfo(title: '90%', description: 'Attendance  Rate',),
                            ActivityInfo(title: '95%', description: 'Activity',),
                          ],
                        ),
                      ),
                    ),
                    HeightGap(height: 12.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.grey800
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Student Attendance', style: TextStyles.regular14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white300
                                )),
                                GestureDetector(
                                  onTap: (){
                                    Get.toNamed(AppRoute.assignHomeWork);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90.r),
                                      color: AppColors.green500
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      child: Text('Assign HW', style: TextStyles.regular14.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white50
                                      ),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ScheduleTable4(),
                        ],
                      ),
                    ),
                    HeightGap(height: 8.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
