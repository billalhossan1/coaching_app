import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/student_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/widget/schedule_table.dart';
import 'package:football_coaching_coach_app/view/widget/conditional_image_widget.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../widget/size.dart';
import '../widget/activity_info_widget.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDetailsController controller =
        Get.find<StudentDetailsController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>controller.isLoading.value?const Center(child: CircularProgressIndicator(),):Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),

            /// Class info
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.grey800,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: ConditionalImageWidget(
                            imageUrl:
                            controller
                                .studentDetails
                                .value
                                ?.student
                                ?.image ??
                                '',
                            width: 30.w,
                            height: 30.h,
                            baseUrl: ApiConstant.imageUrl,
                          ),
                        ),
                        WidthGap(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                  .studentDetails
                                  .value
                                  ?.student
                                  ?.name ??'',
                              style: TextStyles.regular16.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white500,
                              ),
                            ),
                            HeightGap(height: 4.h),
                            Text(
                              controller
                                  .studentDetails
                                  .value
                                  ?.student
                                  ?.sId ??'',
                              style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white500,
                              ),
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
                color: AppColors.green500,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActivityInfo(title: controller.studentDetails.value?.overView?.attandance??'', description: 'Attendance'),
                    ActivityInfo(title:  controller.studentDetails.value?.overView?.avarageAttandance??'', description: 'Attendance  Rate'),
                    ActivityInfo(title:  controller.studentDetails.value?.overView?.avarageActivity??'', description: 'Activity'),
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
                color: AppColors.grey800,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20,
                  top: 20,
                  bottom: 0,
                ),
                child: Text(
                  'Student Update',
                  style: TextStyles.title14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white300,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  color: AppColors.grey800,
                ),
                child: ScheduleTable(studentDetails: controller.studentDetails.value!),
              ),
            ),
          ],
        ),)
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
                child: const Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Student Details',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
