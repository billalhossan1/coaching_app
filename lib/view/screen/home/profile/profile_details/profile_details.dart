import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profileData(),
                    HeightGap(height: 8.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.grey800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Personal Informations', style: TextStyles.regular16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300
                            ),),
                            HeightGap(height: 12.h),
                            Text('Basic Information', style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white900
                            ),),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Full Name', contexts: 'Asad ujjaman',),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Employee Id', contexts: '1256354',),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Email', contexts: 'Asadux@gmail.com',),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Contact No.', contexts: '+88019*******3',),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Nationality', contexts: 'American',),
                            HeightGap(height: 8.h),
                            InfoCart(title:'Address', contexts: '4517 Washington Av...',),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Profile data
  Container _profileData() {
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
                _imageUrl(),
                WidthGap(width: 12.h),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asad Ujjaman',
                        style: TextStyles.regular16.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.white50),
                      ),
                      HeightGap(height: 8.h),
                      Text(
                        'Sr. Coach',
                        style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.green300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CoachActivity(totalValue: '20', title: 'Total Sessions',),
                CoachActivity(totalValue: '3', title: 'Present Course',),
                CoachActivity(totalValue: '150', title: 'Total Players',),
                CoachActivity(totalValue: '95%', title: 'Activity',),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Image url
  Stack _imageUrl() {
    return Stack(
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFF212220),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: CustomSvgImage(
            imagePath: AppImages.editIcon,
            height: 20,
            width: 20,
          ),
        )
      ],
    );
  }
  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          color: AppColors.appBar,),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.white50,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Profile Details',
                style: TextStyles.regular20.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.white50),
              ),
            ),
            Spacer(),
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
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(totalValue, style: TextStyles.regular16.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.white300
        ),),
        HeightGap(height: 8.h),
        Text(title, style: TextStyles.regular12.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.white900
        ),),
      ],
    );
  }
}

class InfoCart extends StatelessWidget {
  final String title;
  final String contexts;
  const InfoCart({
    super.key,
    required this.title,
    required this.contexts
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.grey700
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyles.regular14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white600
                ),),
                Text(contexts, style: TextStyles.regular14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.white600
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AmountCart extends StatelessWidget {
  final String title;
  final String amount;
  const AmountCart({
    super.key,
    required this.title,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.regular14.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white300
        ),),
        Text('\$$amount', style: TextStyles.regular14.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white300
        ),),
      ],
    );
  }
}
