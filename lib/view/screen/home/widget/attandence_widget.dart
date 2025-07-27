import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class AttendanceCell extends StatelessWidget {
  final bool attendance;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const AttendanceCell({
    super.key,
    required this.attendance,
    this.backgroundColor = AppColors.green500,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 28.h,
        width: 28.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Text(
          attendance?'✓':'✗',
          style: textStyle ??
              TextStyles.regular12.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
