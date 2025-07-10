import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/widget/schedule_table.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../widget/size.dart';
import '../widget/activity_info_widget.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),
            /// Class info
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.grey800),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2024/04/27/10/14/ai-generated-8723499_640.jpg',
                            ),
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                        WidthGap(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A.J.Hoge',
                              style: TextStyles.regular16.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white500),
                            ),
                            HeightGap(height: 4.h),
                            Text(
                              '1256354',
                              style: TextStyles.regular12.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    HeightGap(height: 8.h),
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
                    ActivityInfo(title: '7/8', description: 'Attendance',),
                    ActivityInfo(title: '90%', description: 'Attendance  Rate',),
                    ActivityInfo(title: '95%', description: 'Activity',),
                  ],
                ),
              ),
            ),
            HeightGap(height: 16.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.r),
                    topLeft: Radius.circular(16.r),
                  ),
                  color: AppColors.grey800
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 0),
                child: Text('Student Update', style: TextStyles.title14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white300
                ),),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r)
                    ),
                    color: AppColors.grey800
                ),
                child: ScheduleTable(),
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
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
                'Student Details',
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

