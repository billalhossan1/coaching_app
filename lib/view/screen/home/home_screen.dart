import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/shimmer/course_shimmer.dart';
import 'package:football_coaching_coach_app/shimmer/row_shimmer.dart';
import 'package:football_coaching_coach_app/shimmer/shimmer_profile_header.dart';
import 'package:football_coaching_coach_app/utils/format_time.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/custom_app_bar.dart';
import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';
import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/AppImg/app_img.dart';
import '../../../utils/Texts/text_style.dart';
import '../../widget/custom_svg.dart';
import '../../widget/size.dart';
import 'notificaiton/notification_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => homeController.isProfileLoading.value
                ? buildShimmerProfileHeader(context)
                : GetBuilder<NotificationController>(
                  builder: (notificationController) {
                    return CustomAppBarWithoutBorder(
                        context,
                        homeController.profileModel.value?.profileModel?.image ??
                            '',controller: notificationController
                      );
                  }
                ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.cartBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Obx(
              () => homeController.isUpComingTodaySessionLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
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
                                  homeController
                                          .todaySession
                                          .value
                                          ?.course
                                          ?.name ??
                                      '',
                                  style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.green300,
                                  ),
                                ),
                                Text(
                                  homeController.todaySession.value?.title ??
                                      '',
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
                              homeController.todaySession.value != null
                                  ? Text(
                                      FormatTime.formateDateMonthYear(
                                        homeController
                                            .todaySession
                                            .value!
                                            .date!,
                                      ),
                                      style: TextStyles.title20.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.green300,
                                      ),
                                    )
                                  : Text(
                                      'No upcoming session',
                                      style: TextStyles.title20.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.green300,
                                      ),
                                    ),
                              homeController.todaySession.value != null
                                  ? Text(
                                      '${FormatTime.formateTime(homeController.todaySession.value!.startTime!)} - ${FormatTime.formateTime(homeController.todaySession.value!.endTime!)}',
                                      style: TextStyles.regular12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.golden700,
                                      ),
                                    )
                                  : const Text('Not Available'),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () {
                return homeController.onRefresh();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
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
                            onTap: () {
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
                      child: Obx(
                        () => homeController.isUpComingSessionLoading.value
                            ? buildShimmerRow()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${homeController.upComingSessionList.isNotEmpty ? homeController.upComingSessionList[0].shedules : 0} Schedule",
                                    style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white900,
                                    ),
                                  ),
                                  homeController.upComingSessionList.isNotEmpty
                                      ? Text(
                                          homeController
                                                  .upComingSessionList[0]
                                                  .sId ??
                                              '',
                                          style: TextStyles.regular14.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white700,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                      ),
                    ),

                    /// Schedule
                    Obx(
                      () => homeController.isUpComingSessionLoading.value
                          ? Center(child: buildShimmerCourseItem(context))
                          : homeController.upComingSessionList.isEmpty
                          ? const Center(
                              child: Text(
                                'No Schedule Available For Today',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white900,
                                ),
                              ),
                            )
                          : ListView.separated(
                              itemCount:
                              homeController.upComingSessionList[0].sessions?.length ?? 0,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                print("======================$index");
                                print("=====================${homeController
                                    .upComingSessionList[0]
                                    .sessions?[index].course!.name}");
                                final session = homeController
                                    .upComingSessionList[0]
                                    .sessions?[index];
                               if(session!=null){
                                 return GestureDetector(
                                   onTap: () {
                                     Get.toNamed(
                                       AppRoute.menageClassById,
                                       arguments: {"sessionId": session.sId},
                                     );
                                   },

                                   child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(16.r),
                                       color: AppColors.grey900,
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(20.0),
                                       child: Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             session.course?.name ?? '',
                                             style: TextStyles.regular12
                                                 .copyWith(
                                               fontWeight: FontWeight.w500,
                                               color: AppColors.green500,
                                             ),
                                           ),
                                           HeightGap(height: 16.h),
                                           Row(
                                             mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text(
                                                 session.title ?? '',
                                                 style: TextStyles.regular12
                                                     .copyWith(
                                                   fontWeight:
                                                   FontWeight.w300,
                                                   color: AppColors.white400,
                                                 ),
                                               ),
                                               Text(
                                                 "${FormatTime.formateTime(session.startTime ?? '')} - ${FormatTime.formateTime(session.endTime ?? '')}",
                                                 style: TextStyles.regular12
                                                     .copyWith(
                                                   fontWeight:
                                                   FontWeight.w500,
                                                   color: AppColors.white400,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 );
                               }else{
                                 return null;
                               }
                              },
                              separatorBuilder: (_, __) {
                                return HeightGap(height: 8.h);
                              },
                            ),
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
                    Obx(
                      () => homeController.isCourseLoading.value
                          ? buildShimmerCourseItem(context)
                          : homeController.courseList.isEmpty
                          ? const Center(
                              child: Text(
                                "No Course Available",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white900,
                                ),
                              ),
                            )
                          : ListView.separated(
                              itemCount: homeController.courseList.length,
                              controller: homeController.courseScrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final course = homeController.courseList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoute.homeCourseDetails,
                                      arguments: {
                                        "courseId": course.sId,
                                        "courseName": course.name,
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: const DecorationImage(
                                        image: AssetImage(AppImages.blueBg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                course.name ?? '',
                                                style: TextStyles.regular14
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors.white600,
                                                    ),
                                              ),
                                              Text(
                                                "${FormatTime.formateDateTimeMonth(course.startDate ?? '')} - ${FormatTime.formateDateTimeMonth(course.endDate ?? '')}",
                                                style: TextStyles.regular12
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
