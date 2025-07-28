import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/conditional_image_widget.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/responsive_design.dart';
import '../../../widget/size.dart';

Container CustomAppBar(BuildContext context) {
  return Container(
    height: Responsive.height(context, 65),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16)),
        color: AppColors.appBar),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(AppImages.logo)
              ),

              WidthGap(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyles.regular14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.green100),
                  ),
                  Text(
                    'Elite Academy',
                    style: TextStyles.regular16.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.white50),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                },
                child: const CustomSvgImage(
                  imagePath: AppImages.search,
                  height: 24,
                  width: 24,
                ),
              ),
              const WidthGap(width: 16),
              GestureDetector(
                onTap: () {},
                child: const CustomSvgImage(
                  imagePath: AppImages.cart,
                  height: 24,
                  width: 24,
                ),
              ),
              const WidthGap(width: 16),
              GestureDetector(
                onTap: () {},
                child: const CustomSvgImage(
                  imagePath: AppImages.notification,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Container  CustomAppBarWithoutBorder(BuildContext context,String imageUrl) {
  return Container(
    height: Responsive.height(context, 65),
      color: AppColors.appBar,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: ConditionalImageWidget(
                  imageUrl: imageUrl,
                  height: 50.h,
                  width: 50.w,
                  baseUrl: ApiConstant.imageUrl,
                ),
              ),

              WidthGap(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello Coach!',
                    style: TextStyles.regular14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.green100),
                  ),
                  Text(
                    'Jamie Day',
                    style: TextStyles.regular16.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.white50),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const WidthGap(width: 16),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.notificationScreen);
                },
                child: const CustomSvgImage(
                  imagePath: "assets/svg/notification.svg",
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

