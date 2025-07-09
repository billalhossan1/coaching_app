import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/size.dart';

class ResponsiveTable extends StatelessWidget {
  const ResponsiveTable({super.key});

  // Dynamic data

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        'class': '1',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '2',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '3',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '4',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '5',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '6',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '7',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
      },
      {
        'class': '8',
        'date': '2 Jun, 2025',
        'performance': '80%',
        'attendance': '✓',
        'hw': '✓',
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
                _buildHeaderCell('Session'),
                _buildHeaderCell('Date        '),
                _buildHeaderCell('Performance'),
                _buildHeaderCell('Attendance'),
                _buildHeaderCell('HW'),
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
              _buildHwCeCell(item['hw']!),
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
// Build attendance container with a custom style
Widget _buildHwCeCell(String attendance) {
  return Expanded(
    child: Container(
      height: 28.h,
      width: 28.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF2e7d32),
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
