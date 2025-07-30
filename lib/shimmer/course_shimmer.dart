import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/AppImg/app_img.dart';



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
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.w,
                  height: 14.h,
                  color: Colors.white,
                ),
                Container(
                  width: 180.w,
                  height: 14.h,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              height: 42.h,
              width: 42.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
