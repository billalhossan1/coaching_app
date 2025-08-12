import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/widget/custom_svg.dart';
import 'package:football_coaching_coach_app/view/widget/responsive_design.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';

import '../../utils/AppColors/app_colors.dart';
import '../../utils/AppImg/app_img.dart';
import '../../utils/Texts/text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isColorWhite;
  const CustomButton({super.key, required this.text, required this.onTap, this.isColorWhite = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Responsive.height(context, 44),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: isColorWhite == true ? AppColors.grey50 : AppColors.green500),
        child: Center(
          child: Text(
            text,
            style: TextStyles.regular16.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.white50),
          ),
        ),
      ),
    );
  }
}

/// other button
class HelpLineButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isColorWhite;
  const HelpLineButton({super.key, required this.text, required this.onTap, this.isColorWhite = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Responsive.height(context, 44),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: isColorWhite == true ? AppColors.white300 : AppColors.green500),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, color: AppColors.green500),
              WidthGap(width: 4.w),
              Text(
                text,
                style: TextStyles.regular16.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.grey500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom Social button
class CustomSocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isColorWhite;
  const CustomSocialButton({super.key, required this.text, required this.onTap, this.isColorWhite = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Responsive.height(context, 44),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: isColorWhite == true ? AppColors.white300 : AppColors.green500),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgImage(imagePath: AppImages.googleIcon, height: 20.h, width: 20.w),
              WidthGap(width: 8.w),
              Text(
                text,
                style: TextStyles.regular16.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.grey500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
