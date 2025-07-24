import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/AppColors/app_colors.dart';
import '../utils/Texts/text_style.dart';

Widget buildShimmerRow() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,  // Color for the shimmer's base
    highlightColor: Colors.white,  // Color for the shimmer highlight
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '2 Schedule ',
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.white900,
          ),
        ),
        Text(
          '25 Jun, 2025',
          style: TextStyles.regular14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.white700,
          ),
        ),
      ],
    ),
  );
}
