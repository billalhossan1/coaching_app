import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/utils/format_time.dart';
import 'package:get/get.dart';

import '../../../../../core/app_route/app_route.dart';
import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/AppImg/app_img.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_svg.dart';
import '../../../../widget/size.dart';
import '../../controller/course_history_controller.dart';

class PreviousCourse extends StatelessWidget {
  const PreviousCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseHistoryController controller = Get.find<CourseHistoryController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isPrevLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.previousCourseList.isEmpty
              ? const Center(
                  child: Text(
                    'No Course Available',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : ListView.separated(
                  itemCount: controller.previousCourseList.length,
                  itemBuilder: (context, index) {
                    final course = controller.previousCourseList[index];
                    return Container(
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.cartBg),
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                  course.name??'',
                                  style: TextStyles.regular14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600,
                                  ),
                                ),
                                Text(
                                  '${FormatTime.formateDateMonthYear(course.startDate!)} - ${FormatTime.formateDateMonthYear(course.endDate!)}',
                                  style: TextStyles.regular14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.homeCourseDetails,arguments: {"courseId":course.sId});
                              },
                              child: CustomSvgImage(
                                imagePath: AppImages.next,
                                height: 42.h,
                                width: 42.w,
                              ),
                            ),
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
      ),
    );
  }
}
