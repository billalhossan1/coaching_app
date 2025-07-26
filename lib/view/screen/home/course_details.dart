import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/utils/format_time.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/course_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/widget/schedule_table.dart';
import 'package:football_coaching_coach_app/view/screen/home/video_player/video_player_screen.dart';
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
    final CourseDetailsController controller =
        Get.find<CourseDetailsController>();
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
                            const ClipRRect(
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
                                    color: AppColors.white600,
                                  ),
                                ),
                                Text(
                                  'Under 15 summer 25',
                                  style: TextStyles.title16.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.green500,
                                  ),
                                ),
                              ],
                            ),
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
                      child:  Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Obx(()=>controller.isOverviewLoading.value?Center(child: CircularProgressIndicator(),):Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActivityInfo(
                              title: "${controller.courseOverview.value?.overview?.totalStudents??''}",
                              description: 'Attendance',
                            ),
                            ActivityInfo(
                              title: '${controller.courseOverview.value?.overview?.attandanceRate??''}',
                              description: 'Attendance  Rate',
                            ),
                            ActivityInfo(title: '${controller.courseOverview.value?.overview?.totalActivity??''}', description: 'Activity'),
                          ],
                        ),)
                      ),
                    ),

                    /// Class date
                    Obx(() {
                      if (controller.isSessionIsLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.sessionList.isEmpty) {
                        return const Center(
                          child: Text(
                            'No session Available',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 84.h,
                          child: ListView.separated(
                            controller: controller.sessionScrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.isSessionPaginationLoading.value
                                ? controller.sessionList.length + 1
                                : controller.sessionList.length,
                            itemBuilder: (context, index) {
                              // Check if it's the last index, and display a loading indicator if pagination is active
                              if (index == controller.sessionList.length) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              final session = controller.sessionList[index];

                              return GestureDetector(
                                onTap: () {
                                  controller.getSessionDetails(session.sId!);
                                },
                                child: Container(
                                  width: 69.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.cartBg2),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        session.title ?? '',
                                        style: TextStyles.title12.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white300,
                                        ),
                                      ),
                                      Text(
                                        FormatTime.formateDateMonth(
                                          session.date ?? '',
                                        ),
                                        style: TextStyles.regular12.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.green300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, __) {
                              return WidthGap(width: 4.w);
                            },
                          ),
                        );
                      }
                    }),

                    HeightGap(height: 12.h),

                    /// Session info
                    Obx(
                      () => controller.sessionDetails.value != null
                          ? Container(
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
                                    Text(
                                      'Session Info',
                                      style: TextStyles.title14.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white300,
                                      ),
                                    ),
                                    HeightGap(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller
                                                  .sessionDetails
                                                  .value
                                                  ?.sessionInfo
                                                  ?.course
                                                  ?.name ??
                                              '',
                                          style: TextStyles.regular14.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white600,
                                          ),
                                        ),
                                        Text(
                                          controller
                                                  .sessionDetails
                                                  .value
                                                  ?.sessionInfo
                                                  ?.status ??
                                              '',
                                          style: TextStyles.regular14.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.golden2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    HeightGap(height: 8.h),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          child: Image(
                                            image: NetworkImage(
                                              '${ApiConstant.imageUrl}${controller.sessionDetails.value?.sessionInfo?.couch?.image ?? ''}',
                                            ),
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        WidthGap(width: 8.w),
                                        Text(
                                          controller
                                                  .sessionDetails
                                                  .value
                                                  ?.sessionInfo
                                                  ?.couch
                                                  ?.name ??
                                              '',
                                          style: TextStyles.regular14.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    HeightGap(height: 8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FormatTime.formateDateMonthYear(
                                            controller
                                                    .sessionDetails
                                                    .value
                                                    ?.sessionInfo
                                                    ?.date ??
                                                '',
                                          ),
                                          style: TextStyles.regular20.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.green300,
                                          ),
                                        ),
                                        Text(
                                          "${FormatTime.formateTime(controller.sessionDetails.value?.sessionInfo?.startTime ?? '')} - ${FormatTime.formateTime(controller.sessionDetails.value?.sessionInfo?.endTime ?? '')}",
                                          style: TextStyles.regular20.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.green300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      controller
                                              .sessionDetails
                                              .value
                                              ?.homework
                                              ?.description ??
                                          '',
                                      style: TextStyles.regular12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),

                    HeightGap(height: 12.h),
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                          color: AppColors.grey800,
                        ),
                        child: controller.sessionDetails.value != null
                            ? ScheduleTable2(
                                sessionDetails:
                                    controller.sessionDetails.value!,
                              )
                            : Center(
                                child: Text(
                                  'No Data Available',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    HeightGap(height: 12.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey900,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Obx(
                          () => controller.isVideosLoading.value
                              ? Center(child: CircularProgressIndicator())
                              : controller.videoList.isEmpty
                              ? Center(
                                  child: Text(
                                    "No vedio available",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tutorial Videos',
                                      style: TextStyles.regular14.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white700,
                                      ),
                                    ),
                                    HeightGap(height: 12.h),
                                    Text(
                                      '${controller.videoList.length} Contents',
                                      style: TextStyles.regular12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white800,
                                      ),
                                    ),
                                    HeightGap(height: 12.h),
                                    ListView.separated(
                                      itemCount:
                                          controller
                                              .isSessionPaginationLoading
                                              .value
                                          ? controller.videoList.length +
                                                1 // Add 1 for loading indicator
                                          : controller.videoList.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (_, index) {
                                        if (controller
                                                .isSessionPaginationLoading
                                                .value &&
                                            index ==
                                                controller.videoList.length) {
                                          // Show the circular progress indicator when loading
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }

                                        final video =
                                            controller.videoList[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    InteractiveVideoPlayer(
                                                      videoUrl:
                                                          video.video ?? "",
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: AppColors.black700,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16,
                                                            ),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            video.thumbnail ??
                                                                '',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      height: 71.h,
                                                    ),
                                                  ),
                                                  WidthGap(width: 10.w),
                                                  Flexible(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          video.title ?? '',
                                                          style: TextStyles
                                                              .regular14
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppColors
                                                                    .white500,
                                                              ),
                                                        ),
                                                        HeightGap(height: 30.h),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons.play_arrow,
                                                              color: AppColors
                                                                  .white900,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                    top: 2.0,
                                                                  ),
                                                              child: Text(
                                                                ' 2:50', // Example time, replace with actual duration if needed
                                                                style: TextStyles
                                                                    .regular14
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: AppColors
                                                                          .white500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (_, index) {
                                        return HeightGap(height: 10.h);
                                      },
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
          bottomLeft: Radius.circular(16.r),
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
                child: const Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Courses Details',
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
