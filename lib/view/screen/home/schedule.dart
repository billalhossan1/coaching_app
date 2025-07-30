import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/scedule_controller.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';

import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/Texts/text_style.dart';
import '../../../utils/format_time.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleController controller = Get.find<ScheduleController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.scheduleList.isEmpty
                  ? Center(child: Text("No Schedule Available",style: TextStyle(color: Colors.white70),))
                  : Expanded(
                      child: SingleChildScrollView(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.scheduleList.length,
                          itemBuilder: (context, index) {
                            final schedule = controller.scheduleList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        "${schedule.shedules} Schedule",
                                        style: TextStyles.regular12.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white900,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16.0,
                                        top: 8,
                                        bottom: 8,
                                      ),
                                      child: Text(
                                        "${schedule.sId}",
                                        style: TextStyles.regular12.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: schedule.sessions?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final session = schedule.sessions![index];
                                    return GestureDetector(
                                      onTap: (){
                                        Get.toNamed(AppRoute.menageClassById,arguments: {"sessionId":session.sId,"courseName":session.course?.name});
                                      },
                                      child: Container(
                                        height: 88.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16.r,
                                          ),
                                          color: AppColors.grey900,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  session.course?.name ?? '',
                                                  style: TextStyles.regular12
                                                      .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.green500,
                                                  ),
                                                ),

                                              ],
                                            ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    session.title ?? '',
                                                    style: TextStyles.regular12
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white700,
                                                        ),
                                                  ),
                                                  Text(
                                                    "${FormatTime.formateTime(session.startTime ?? '')} - ${FormatTime.formateTime(session.endTime ?? '')}",
                                                    style: TextStyles.regular12
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColors.white400,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return HeightGap(height: 8.h);
                                  },
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (_, __) {
                            return HeightGap(height: 8.h);
                          },
                        ),
                      ),
                    ),
            ),
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
                child: Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Schedule',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
