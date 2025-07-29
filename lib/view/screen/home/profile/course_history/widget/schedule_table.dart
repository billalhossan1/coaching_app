import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/model/manage_class_model.dart' hide SessionDetails;
import 'package:football_coaching_coach_app/model/session_details_model.dart';
import 'package:football_coaching_coach_app/model/student_details_model.dart';
import 'package:football_coaching_coach_app/utils/format_time.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/course_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_by_id_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/manage_class_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/student_details_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/attandence_widget.dart';
import 'package:football_coaching_coach_app/view/widget/conditional_image_widget.dart';
import 'package:football_coaching_coach_app/view/widget/network_image_widget.dart';
import 'package:get/get.dart';

import '../../../../../../utils/AppColors/app_colors.dart';
import '../../../../../../utils/Texts/text_style.dart';
import '../../../../../widget/size.dart';


class ScheduleTable extends StatelessWidget {
  final StudentDetails studentDetails;

  const ScheduleTable({super.key, required this.studentDetails});

  // Dynamic data

  @override
  Widget build(BuildContext context) {
    print("============================${studentDetails.performance!.length}");
    return ListView.separated(
      itemCount: (studentDetails.performance?.length??0) + 1,  // +1 for the header row
      separatorBuilder: (context, index) {
        return index==0? const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: AppColors.white900),
        ): HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                _buildHeaderCell('Session'),
                _buildHeaderCell('Date        '),
                _buildHeaderCell('Performance'),
                _buildHeaderCell('Attendance'),
              ],
            ),
          );
        }

        // Data Row
        var item = studentDetails.performance![index - 1];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildTableCell('${item.Class??0}'),
              _buildTableCell(FormatTime.formateDateMonthYear(item.date??'')),
              _buildPerformanceCell(item.performance??''),
              _buildAttendanceCell(item.attandance! ? '✓' : '✗'),
            ],
          ),
        );
      },
    );
  }

  // Build header cell with blue color
  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.regular12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.green300
            )
        ),
      ),
    );
  }

  // Build the table cells with centered text
  Widget _buildTableCell(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Text(
            text,
            style: TextStyles.regular12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.white800
            )
        ),
      ),
    );
  }

  // Build performance container with a custom style
  Widget _buildPerformanceCell(String performance) {
    return Expanded(
      child: Container(
        height:24.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            border: Border.all(
                color: AppColors.green500
            )
        ),
        child: Text(
          performance,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // Build attendance container with a custom style
  Widget _buildAttendanceCell(String attendance) {
    return Expanded(
      child: Container(
        height: 28.h,
        width: 28.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.green500,
        ),
        child: Center(
          child: Text(
            attendance,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class ScheduleTable2 extends StatelessWidget {
  final SessionDetails sessionDetails;

  const ScheduleTable2({super.key, required this.sessionDetails});

  @override
  Widget build(BuildContext context) {
    // Check if studentList is null or empty
    if (sessionDetails.studentList == null || sessionDetails.studentList!.isEmpty) {
      return const Center(
        child: Text(
          'No students available',
          style: TextStyle(color: AppColors.white900),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sessionDetails.studentList!.length + 1, // +1 for the header row
      separatorBuilder: (context, index) {
        return index == 0
            ? const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: AppColors.white900),
        )
            : HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        // Skip the header row (index 0)
        if (index == 0) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                _buildHeaderCell('Student Name'),
                _buildHeaderCell('Performance'),
                _buildHeaderCell('Attendance'),
              ],
            ),
          );
        }

        // Data Row
        final student = sessionDetails.studentList![index - 1]; // Subtract 1 to get the student index
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildTableCell(student.name ?? '', '${student.image}', studentId: student.sId!, sessionId: sessionDetails.sessionInfo!.sId!),
              _buildPerformanceCell(student.performance ?? ''),
            WidthGap(width: 40.w),
           AttendanceCell(attendance: student.atandance??false),
              WidthGap(width: 40.w),

            ],
          ),
        );
      },
    );
  }

  // Build header cell with blue color
  Widget _buildHeaderCell(String text) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.regular12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.green300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the table cells with centered text
  Widget _buildTableCell(String text, String image,{required String studentId,required String sessionId}) {
    return Flexible(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.studentDetails, arguments: {'userId': studentId,"sessionId":sessionId});
        },
        child: Container(
          padding: EdgeInsets.all(12.w),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: ConditionalImageWidget(
                  imageUrl: image,
                  height: 20.h,
                  width: 20.w, baseUrl: ApiConstant.imageUrl,
                ),
              ),
              WidthGap(width: 8.w),
              Expanded(
                child: Text(
                  ShortText.getShortText(text),
                  style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Build performance container with a custom style
  Widget _buildPerformanceCell(String performance) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Container(
          height: 24.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.r),
            border: Border.all(color: AppColors.green500),
          ),
          child: Text(
            performance,
            style: TextStyles.regular12.copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}



class ScheduleTable3 extends StatelessWidget {
  final List<StudentList>? studentLists;
  final String? sessionId;
  const ScheduleTable3({super.key, this.studentLists, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (studentLists?.length ?? 0) + 1, // +1 for the header row
      separatorBuilder: (context, index) {
        return index == 0
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Divider(color: AppColors.white900),
        )
            : HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                _buildHeaderCell('Player name'),
                _buildHeaderCell('Performance'),
                _buildHeaderCell('Attendance'),
              ],
            ),
          );
        }

        // Data Row
        var student = studentLists![index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              _buildTableCell(student.name!, '${ApiConstant.imageUrl}${student.image}',sessionId: sessionId!,userId: student.sId!),
              _buildPerformanceCell(student.performance ?? '',userId:student.sId!,sessionId:sessionId!,userImage: student.image!,username: student.name??''),
              GetBuilder<ManageClassController>(
                  builder: (controller) {
                    return Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          student.atandance = student.atandance == true ? false : true;
                          controller.update();
                          controller.updateAttandence(student.atandance!, student.sId!);
                        },
                        child: Center(
                          child: Container(
                            height: 28.h,
                            width: 28.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.green500,
                            ),
                            child: Text(
                              student.atandance! ? '✓' : '✗',
                              style: TextStyles.regular12.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
        );
      },
    );
  }

  // Build header cell
  Widget _buildHeaderCell(String text) {
    return Flexible(
      flex: text == 'Player name' ? 3 : 2,
      child: Container(
        padding: EdgeInsets.all(12.w),
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.green300,
          ),
        ),
      ),
    );
  }

  // Build table cell with student name and image
  Widget _buildTableCell(String text, String image,{required String sessionId,required String userId}) {
    return Flexible(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.studentDetails,arguments: {"sessionId":sessionId,"userId":userId});
        },
        child: Container(
          padding: EdgeInsets.all(12.w),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: NetworkImageWidget(
                  imageUrl: image,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              WidthGap(width: 8.w),
              Expanded(
                child: Text(
                  ShortText.getShortText(text),
                  style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build performance cell
  Widget _buildPerformanceCell(String performance,{required String sessionId,required String userId,required String userImage,required String username}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.performance,arguments: {"userId":userId,"sessionId":sessionId,"userName":username,"userImage":userImage,"manage":"hasdkfjh"});
          },
          child: Container(
            height: 24.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.r),
              border: Border.all(color: AppColors.green500),
            ),
            child: Text(
              performance,
              style: TextStyles.regular12.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  // Build attendance cell - removed since it's now inline
  Widget _buildAttendanceCell(String attendance) {
    return Flexible(
      flex: 2,
      child: Center(
        child: Container(
          height: 28.h,
          width: 28.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.green500,
          ),
          child: Text(
            attendance,
            style: TextStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}



class ScheduleTable4 extends StatelessWidget {
  final List<StudentLists>? studentLists;
  final String? sessionId;
  const ScheduleTable4({super.key, this.studentLists, this.sessionId});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (studentLists?.length ?? 0) + 1, // +1 for the header row
      separatorBuilder: (context, index) {
        return index == 0
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Divider(color: AppColors.white900),
        )
            : HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                _buildHeaderCell('Player name'),
                _buildHeaderCell('Performance'),
                _buildHeaderCell('Attendance'),
              ],
            ),
          );
        }

        // Data Row
        var student = studentLists![index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              _buildTableCell(student.name!, '${ApiConstant.imageUrl}${student.image}',sessionId: sessionId!,userId: student.userId!),
              _buildPerformanceCell(student.totalPerformance ?? '',userId:student.userId!,sessionId:sessionId!,userImage: student.image!,username: student.name??''),
              GetBuilder<ManageClassByIdController>(
                  builder: (controller) {
                    return Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          student.attandance = student.attandance == true ? false : true;
                          controller.update();
                          controller.updateAttandence(student.attandance!, student.userId!);
                        },
                        child: Center(
                          child: Container(
                            height: 28.h,
                            width: 28.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.green500,
                            ),
                            child: Text(
                              student.attandance! ? '✓' : '✗',
                              style: TextStyles.regular12.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
        );
      },
    );
  }

  // Build header cell
  Widget _buildHeaderCell(String text) {
    return Flexible(
      flex: text == 'Player name' ? 3 : 2,
      child: Container(
        padding: EdgeInsets.all(12.w),
        alignment: Alignment.center,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.green300,
          ),
        ),
      ),
    );
  }

  // Build table cell with student name and image
  Widget _buildTableCell(String text, String image,{required String sessionId,required String userId}) {
    return Flexible(
      flex: 3,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.studentDetails,arguments: {"sessionId":sessionId,"userId":userId});
        },
        child: Container(
          padding: EdgeInsets.all(12.w),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: NetworkImageWidget(
                  imageUrl: image,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              WidthGap(width: 8.w),
              Expanded(
                child: Text(
                  ShortText.getShortText(text),
                  style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build performance cell
  Widget _buildPerformanceCell(String performance,{required String sessionId,required String userId,required String userImage,required String username}) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.performance,arguments: {"userId":userId,"sessionId":sessionId,"userName":username,"userImage":userImage});
          },
          child: Container(
            height: 24.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90.r),
              border: Border.all(color: AppColors.green500),
            ),
            child: Text(
              performance,
              style: TextStyles.regular12.copyWith(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  // Build attendance cell - removed since it's now inline
  Widget _buildAttendanceCell(String attendance) {
    return Flexible(
      flex: 2,
      child: Center(
        child: Container(
          height: 28.h,
          width: 28.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.green500,
          ),
          child: Text(
            attendance,
            style: TextStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

