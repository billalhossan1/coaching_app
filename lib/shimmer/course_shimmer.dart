import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/AppColors/app_colors.dart';
import '../utils/AppImg/app_img.dart';
import '../utils/Texts/text_style.dart';
import '../view/widget/custom_svg.dart';


Widget buildShimmerCourseItem(BuildContext context) {
  return Container(
    height: 90.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      image: const DecorationImage(
        image: AssetImage(AppImages.blueBg),
        fit: BoxFit.cover,
      ),
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,  // Color for the shimmer's base
      highlightColor: Colors.white,  // Color for the shimmer highlight
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Under 20 summer 25',
                  style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white600,
                  ),
                ),
                Text(
                  '25 Jun, 2025 - 25 Jun, 2025   ',
                  style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
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
}