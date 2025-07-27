import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
class CustomAppbarWithTitle extends StatelessWidget {
  final String text;
  const CustomAppbarWithTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          color: AppColors.appBar,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
          )),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios)),
          Spacer(),
          Center(
            child: Text(
              text,
              style: TextStyles.regular20.copyWith(fontWeight: FontWeight.w500, color: AppColors.white50),
            ),
          ),
          Spacer(),
          SizedBox(width: 16.w,)
        ],
      )
    );
  }
} 
