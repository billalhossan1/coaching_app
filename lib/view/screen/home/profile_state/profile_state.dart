import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile_state/widget/academic_activity_widget.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/network_image_widget.dart';
import '../../../widget/size.dart';

class ProfileState extends StatelessWidget {
  const ProfileState({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          _customAppBar(),
          _profileDetails(),
          HeightGap(height: 12.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HwInfo(screenWidth: screenWidth, percentage: '90', activity: 'Attendance'),
                      HwInfo(screenWidth: screenWidth, percentage: '90', activity: 'HW'),
                      HwInfo(screenWidth: screenWidth, percentage: '95', activity: 'Activity'),
                    ],
                  ),
                  HeightGap(height: 16.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.grey800,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Performance Details', style: TextStyles.regular14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white50,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      PerformanceData(name:'PAC', data: '20', color: AppColors.red2,),
                                      WidthGap(width: 18.w),
                                      PerformanceData(name:'COO', data: '70', color: Colors.green,),
                                    ],
                                  ),
                                  HeightGap(height: 24.h),
                                  Row(
                                    children: [
                                      PerformanceData(name:'DRI', data: '25', color: AppColors.blue,),
                                      WidthGap(width: 18.w),
                                      PerformanceData(name:'  PAS', data: '25', color: Colors.deepPurpleAccent,),
                                    ],
                                  ),
                                  HeightGap(height: 24.h),
                                  Row(
                                    children: [
                                      PerformanceData(name:'SHO', data: '35', color: AppColors.golden2,),
                                      WidthGap(width: 18.w),
                                      PerformanceData(name:'PAY', data: '35', color: Colors.deepOrangeAccent,),
                                    ],
                                  ),
                                ],
                              ),
                              WidthGap(width: 20.w),
                              Expanded(
                                child: Image(
                                  image: AssetImage(AppImages.hexa),
                                  height: 150.h,
                                  width: 150.w,
                                )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  HeightGap(height: 16.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(16.r),
                          topLeft: Radius.circular(16.r),
                        ),
                        color: AppColors.grey800
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Academic Activity', style: TextStyles.title14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.white300
                          ),),
                          HeightGap(height: 8.h),
                          Text('Under 15 summer 25', style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.green500
                          ),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r)
                      ),
                      color: AppColors.grey800
                    ),
                    child: ResponsiveTable(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _profileDetails() {
    return Container(
      width: double.infinity,
      color: AppColors.grey800,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: NetworkImageWidget(
                imageUrl:
                    "https://cdn.pixabay.com/photo/2020/03/11/10/08/camera-4921646_640.jpg",
                height: 48.h,
                width: 48.w,
              ),
            ),
            WidthGap(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asad Ujjaman',
                  style: TextStyles.regular16.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.white500),
                ),
                Text(
                  '1256354',
                  style: TextStyles.regular12.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.white500),
                ),
                HeightGap(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoWidget(
                      img: AppImages.usaFlag,
                      title: 'USA',
                    ),
                    WidthGap(width: 15.w),
                    InfoWidget(
                      img: AppImages.multiplePerson,
                      title: '12',
                    ),
                    WidthGap(width: 15.w),
                    InfoWidget(
                      img: AppImages.runningPerson,
                      title: 'Striker',
                    ),
                    WidthGap(width: 15.w),
                    InfoWidget(
                      img: AppImages.singlePerson,
                      title: '12',
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(color: AppColors.appBar),
      child: Center(
        child: Text(
          'Profile Stats',
          style: TextStyles.regular20
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.white50),
        ),
      ),
    );
  }
}

class PerformanceData extends StatelessWidget {
  final String name;
  final String data;
  final Color color;
  const PerformanceData({
    super.key,
    required this.name,
    required this.data,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(name, style: TextStyles.regular14.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white700
        ),),
        WidthGap(width: 10.w),
        Text('$data%', style: TextStyles.regular14.copyWith(
          fontWeight: FontWeight.w400,
          color: color
        ),),
      ],
    );
  }
}

class HwInfo extends StatelessWidget {
  final String percentage;
  final String activity;
  const HwInfo({
    super.key,
    required this.screenWidth,
    required this.percentage,
    required this.activity
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66.h,
      width: screenWidth/3.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.green900
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$percentage%', style: TextStyles.regular16.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.white300
            ),),
            Text(activity, style: TextStyles.regular12.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.white700
            ),),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String img;
  final String title;
  const InfoWidget({
    super.key,
    required this.img,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgImage(imagePath: img, height: 24, width: 24,),
        WidthGap(width: 8.w),
        Text(title, style: TextStyles.regular12.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white300
        ),)
      ],
    );
  }
}
