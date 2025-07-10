import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/view/widget/network_image_widget.dart';
import 'package:get/get.dart';

import '../../../../../../utils/AppColors/app_colors.dart';
import '../../../../../../utils/Texts/text_style.dart';
import '../../../../../widget/size.dart';


class ScheduleTable extends StatelessWidget {
  const ScheduleTable({super.key});

  // Dynamic data

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'class': '1',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '2',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '3',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '4',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '5',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '6',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '7',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': '8',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
    ];
    return ListView.separated(
      itemCount: data.length + 1,  // +1 for the header row
      separatorBuilder: (context, index) {
        return index==0? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: AppColors.white900),
        ): HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
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
        var item = data[index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildTableCell(item['class']!),
              _buildTableCell(item['date']!),
              _buildPerformanceCell(item['performance']!),
              _buildAttendanceCell(item['attendance']!),
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
        padding: EdgeInsets.all(12),
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
        padding: EdgeInsets.all(12),
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
          style: TextStyle(color: Colors.white),
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.green500,
        ),
        child: Center(
          child: Text(
            attendance,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class ScheduleTable2 extends StatelessWidget {
  const ScheduleTable2 ({super.key});

  // Dynamic data

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Kovács Tímea',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length + 1,  // +1 for the header row
      separatorBuilder: (context, index) {
        return index==0? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: AppColors.white900),
        ): HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
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
        var item = data[index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildTableCell(item['class']!),
              _buildPerformanceCell(item['performance']!),
              _buildPerformanceCell(item['performance']!),
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
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.green300
                )
            ),
          ],
        ),
      ),
    );
  }

  // Build the table cells with centered text
  Widget _buildTableCell(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class ScheduleTable3 extends StatelessWidget {
  const ScheduleTable3 ({super.key});

  // Dynamic data

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Kovács Tímea',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: data.length + 1,  // +1 for the header row
      separatorBuilder: (context, index) {
        return index==0? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: AppColors.white900),
        ): HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                _buildHeaderCell('Student Name'),
                _buildHeaderCell('Performance         '),
                _buildHeaderCell('      Attendance'),
              ],
            ),
          );
        }

        // Data Row
        var item = data[index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              _buildTableCell(item['class']!),
              _buildPerformanceCell(item['performance']!),
              _buildAttendanceCell(item['attendance']!),
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
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.green300
                )
            ),
          ],
        ),
      ),
    );
  }

  // Build the table cells with centered text
  Widget _buildTableCell(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: NetworkImageWidget(imageUrl: 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                height: 20,
                width: 20,
              ),
            ),
            WidthGap(width: 8.w),
            Text(
                text,
                style: TextStyles.regular12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white800
                ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Build performance container with a custom style
  Widget _buildPerformanceCell(String performance) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height:24.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                  color: AppColors.green500
              )
          ),
          child:Text(
            performance,
            style: TextStyle(color: Colors.white),
          ),
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.green500,
        ),
        child: Center(
          child:  Text(
            attendance,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}



class ScheduleTable4 extends StatelessWidget {
  const ScheduleTable4({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Kovács Tímea',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
      {
        'class': 'Asad Ujjaman',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length + 1, // +1 for the header row
      separatorBuilder: (context, index) {
        return index == 0
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Divider(color: AppColors.white900),
        ): HeightGap(height: 0.h);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Header Row
          return Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
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
        var item = data[index - 1];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              _buildTableCell(item['class']!),
              _buildPerformanceCell(item['performance']!),
              _buildAttendanceCell(item['attendance']!),
            ],
          ),
        );
      },
    );
  }

  // Build header cell
  Widget _buildHeaderCell(String text) {
    return Expanded(
      flex: text == 'Student Name' ? 3 : 2,
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
  Widget _buildTableCell(String text) {
    return Expanded(
      flex: 3, // Give more space to student name
      child: Container(
        padding: EdgeInsets.all(12.w),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: NetworkImageWidget(
                imageUrl:
                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
                height: 20.h,
                width: 20.w,
              ),
            ),
            WidthGap(width: 8.w),
            Expanded(
              // Wrap Text in Expanded to prevent overflow
              child: Text(
                text,
                style: TextStyles.regular12.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build performance cell
  Widget _buildPerformanceCell(String performance) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GestureDetector(
          onTap: (){
            Get.toNamed(AppRoute.performance);
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

  // Build attendance cell
  Widget _buildAttendanceCell(String attendance) {
    return Expanded(
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
