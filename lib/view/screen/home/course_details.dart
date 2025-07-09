import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/widget/schedule_table.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/activity_info_widget.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../widget/size.dart';

class HomeCourseDetails extends StatelessWidget {
  const HomeCourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 68.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
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
                            ActivityInfo(title: '7/8', description: 'Attendance',),
                            ActivityInfo(title: '90%', description: 'Attendance  Rate',),
                            ActivityInfo(title: '95%', description: 'Activity',),
                          ],
                        ),
                      ),
                    ),
                    /// Class date
                    SizedBox(
                      height: 84.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 69.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.cartBg2),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Class 1',
                                  style: TextStyles.title12.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white300),
                                ),
                                Text(
                                  '5 jun',
                                  style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.green300),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (_, __) {
                          return WidthGap(width: 4.w);
                        },
                      ),
                    ),
                    HeightGap(height: 12.h),

                    /// Session info
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
                            Text(
                              'Session Info',
                              style: TextStyles.title14.copyWith(
                                  fontWeight: FontWeight.w500, color: AppColors.white300),
                            ),
                            HeightGap(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Passing Level 1',
                                  style: TextStyles.regular14.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white600),
                                ),
                                Text(
                                  'Upcoming',
                                  style: TextStyles.regular14.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.golden2),
                                ),
                              ],
                            ),
                            HeightGap(height: 8.h),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    image: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2024/04/27/10/14/ai-generated-8723499_640.jpg',
                                    ),
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                WidthGap(width: 8.w),
                                Text(
                                  'A.J.Hoge',
                                  style: TextStyles.regular14.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white700),
                                ),
                              ],
                            ),
                            HeightGap(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '2 Jun, 2025',
                                  style: TextStyles.regular20.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.green300),
                                ),
                                Text(
                                  '3:00 PM – 4:30 PM',
                                  style: TextStyles.regular20.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.green300),
                                ),
                              ],
                            ),
                            Text(
                              'In this Treaming Session eget Donec porta hendrerit ac vehicula, ex sodales. leo. libero, sit Donec amet, sapien id',
                              style: TextStyles.regular12.copyWith(
                                  fontWeight: FontWeight.w400, color: AppColors.white700),
                            ),
                          ],
                        ),
                      ),
                    ),

                    HeightGap(height: 12.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r)
                          ),
                          color: AppColors.grey800
                      ),
                      child: ScheduleTable2(),
                    ),
                    HeightGap(height: 12.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.grey900),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tutorial Videos',
                              style: TextStyles.regular14.copyWith(
                                  fontWeight: FontWeight.w600, color: AppColors.white700),
                            ),
                            HeightGap(height: 12.h),
                            Text(
                              '8 Contents',
                              style: TextStyles.regular12.copyWith(
                                  fontWeight: FontWeight.w400, color: AppColors.white800),
                            ),
                            HeightGap(height: 12.h),
                            ListView.separated(
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_,__){
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: AppColors.black700
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                image: DecorationImage(
                                                    image: NetworkImage('https://cdn.pixabay.com/photo/2016/04/15/20/28/football-1331838_640.jpg'),
                                                    fit: BoxFit.cover
                                                )
                                            ),
                                            height: 71.h,
                                          ),
                                        ),
                                        WidthGap(width: 10.w),
                                        Flexible(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Trap A Soccer Ball Like A PRO',
                                                  style: TextStyles.regular14.copyWith(
                                                      fontWeight: FontWeight.w400, color: AppColors.white500),
                                                ),
                                                HeightGap(height: 30.h),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.play_arrow, color: AppColors.white900,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 2.0),
                                                      child: Text(
                                                        ' 2:50',
                                                        style: TextStyles.regular14.copyWith(
                                                            fontWeight: FontWeight.w400, color: AppColors.white500),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_,__){
                                return HeightGap(height: 10.h);
                              },
                            )
                          ],
                        ),
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

  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r)),
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
                'Courses Details',
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
