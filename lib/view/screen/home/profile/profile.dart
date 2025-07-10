import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart' show Phoenix;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/network_image_widget.dart';
import '../../../widget/size.dart';
import '../widget/custom_appbar_with_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbarWithTitle(text: 'My Account '),
            // Profile details and Course history
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCart1(
                    screenWidth: screenWidth,
                    img: "https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_640.png",
                    text: 'Profile Details',
                    onTap: () {
                      Get.toNamed(AppRoute.profileDetails);
                    },
                  ),
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.courseHistory,
                    text: 'Course History',
                    onTap: () {
                      Get.toNamed(AppRoute.courseHistory);
                    },
                  ),
                ],
              ),
            ),
            // Setting and Help support
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.setting,
                    text: 'Settings',
                    onTap: () {
                      Get.toNamed(AppRoute.settings);
                    },
                  ),
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.helpSupport,
                    text: 'Help & Support',
                    onTap: () {
                      Get.toNamed(AppRoute.helpSupport);
                    },
                  ),
                ],
              ),
            ),
            // About and App Support
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.about,
                    text: 'About',
                    onTap: () {
                      Get.toNamed(AppRoute.about);
                    },
                  ),
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.helpSupport,
                    text: 'App Support',
                    onTap: () {
                      Get.toNamed(AppRoute.appSupport);
                    },
                  ),
                ],
              ),
            ),
            // Terms condition and log out
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.terms,
                    text: 'Terms & Conditions',
                    onTap: () {
                      Get.toNamed(AppRoute.termsCondition);
                    },
                  ),
                  ProfileCart(
                    screenWidth: screenWidth,
                    img: AppImages.logOut,
                    text: 'Log Out',
                    onTap: () {
                      Phoenix.rebirth(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCart extends StatelessWidget {
  final String img;
  final String text;
  final VoidCallback onTap;

  const ProfileCart(
      {super.key,
      required this.screenWidth,
      required this.img,
      required this.text,
      required this.onTap});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: screenWidth / 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grey900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSvgImage(imagePath: img),
              HeightGap(height: 20.h),
              Text(
                text,
                style: TextStyles.regular16.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.white500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCart1 extends StatelessWidget {
  final String img;
  final String text;
  final VoidCallback onTap;

  const ProfileCart1(
      {super.key,
      required this.screenWidth,
      required this.img,
      required this.text,
      required this.onTap});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 125.h,
        width: screenWidth / 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grey900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: NetworkImageWidget(
                  imageUrl: img,
                  height: 32.h,
                  width: 32.w,
                ),
              ),
              HeightGap(height: 20.h),
              Text(
                text,
                style: TextStyles.regular16.copyWith(
                    fontWeight: FontWeight.w400, color: AppColors.white500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
