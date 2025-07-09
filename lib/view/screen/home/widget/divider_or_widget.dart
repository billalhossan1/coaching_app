import 'package:flutter/material.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class DivideOrWidget extends StatelessWidget {
  final double? screenWidth;

  const DivideOrWidget({
    super.key,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: screenWidth*0.40,
          child: Divider(
            color: AppColors.white800,
          ),
        ),
        Text('Or', style: TextStyles.regular14.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white600,
        ),),
        SizedBox(
          width: screenWidth*0.40,
          child: Divider(
            color: AppColors.white800,
          ),
        ),
      ],
    );
  }
}
