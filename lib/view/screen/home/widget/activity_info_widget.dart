import 'package:flutter/material.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class ActivityInfo extends StatelessWidget {
  final String title;
  final String description;
  const ActivityInfo({
    super.key,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.regular16.copyWith(
            fontWeight: FontWeight.w500,
        ),),
        Text(description, style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.white600
        ),),
      ],
    );
  }
}
