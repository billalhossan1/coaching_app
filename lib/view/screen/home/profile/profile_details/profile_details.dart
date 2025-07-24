import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/utils/short_text.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/edit_profile_bottom_shit.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/model/profile_model.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/AppImg/app_img.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_svg.dart';
import '../../../../widget/size.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Rxn<ProfileModel> profileModel = Rxn<ProfileModel>();

    profileModel = Get.find<HomeController>().profileModel;
    HomeController homeController = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>Column(
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profileData(profileModel.value, homeController),
                    HeightGap(height: 8.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal Informations',
                              style: TextStyles.regular16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300,
                              ),
                            ),
                            HeightGap(height: 12.h),
                            Text(
                              'Basic Information',
                              style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white900,
                              ),
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Full Name',
                              contexts:
                              profileModel.value?.profileModel?.name ??
                                  'Unknown',
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Employee Id',
                              contexts:
                              "${ShortText.getShortText(profileModel.value?.profileModel?.sId ?? '', maxLength: 15)}",
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Email',
                              contexts:
                              profileModel.value?.profileModel?.email ??
                                  '',
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Contact No.',
                              contexts:
                              '${profileModel.value?.profileModel?.contact ?? ''}',
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Nationality',
                              contexts:
                              profileModel
                                  .value
                                  ?.profileModel
                                  ?.nationality ??
                                  '',
                            ),
                            HeightGap(height: 8.h),
                            InfoCart(
                              title: 'Address',
                              contexts:
                              profileModel.value?.profileModel?.address ??
                                  '',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),)
      ),
    );
  }

  /// Profile data
  Container _profileData(
    ProfileModel? profileModel,
    HomeController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16.r),
          bottomLeft: Radius.circular(16.r),
        ),
        color: AppColors.grey800,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _imageUrl(profileModel!, controller),
                WidthGap(width: 12.h),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileModel.profileModel?.name ?? 'Unknown',
                        style: TextStyles.regular16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white50,
                        ),
                      ),
                      HeightGap(height: 8.h),
                      Text(
                        'Sr. Coach',
                        style: TextStyles.regular12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.green300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CoachActivity(totalValue: '20', title: 'Total Sessions'),
                CoachActivity(totalValue: '3', title: 'Present Course'),
                CoachActivity(totalValue: '150', title: 'Total Players'),
                CoachActivity(totalValue: '95%', title: 'Activity'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Image url
  Stack _imageUrl(ProfileModel profileModel, HomeController controller) {
    return Stack(
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFF212220),
          ),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage("${ApiConstant.imageUrl}${profileModel.profileModel?.image ?? ''}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: GestureDetector(
            onTap: () {
              controller.setTextEditingController();
              Get.bottomSheet(
                editProfileBottomsheet(profileModel, controller,Get.context!),
                enableDrag: true,
              ).then((_) {
                controller.selectedImage = null;
              });
            },
            child: CustomSvgImage(
              imagePath: AppImages.editIcon,
              height: 20,
              width: 20,
            ),
          ),
        ),
      ],
    );
  }

  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: const BoxDecoration(color: AppColors.appBar),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Profile Details',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CoachActivity extends StatelessWidget {
  final String totalValue;
  final String title;
  const CoachActivity({
    super.key,
    required this.totalValue,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          totalValue,
          style: TextStyles.regular16.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.white300,
          ),
        ),
        HeightGap(height: 8.h),
        Text(
          title,
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.white900,
          ),
        ),
      ],
    );
  }
}

class InfoCart extends StatelessWidget {
  final String title;
  final String contexts;
  const InfoCart({super.key, required this.title, required this.contexts});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.grey700,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white600,
                  ),
                ),
                Text(
                  contexts,
                  style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AmountCart extends StatelessWidget {
  final String title;
  final String amount;
  const AmountCart({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.regular14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.white300,
          ),
        ),
        Text(
          '\$$amount',
          style: TextStyles.regular14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.white300,
          ),
        ),
      ],
    );
  }
}
