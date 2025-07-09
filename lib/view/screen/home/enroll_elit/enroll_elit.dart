import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppConst/app_const.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/size.dart';
import '../../auth/controller/auth_controller.dart';
import '../bottom_nav_bar/controller/controller.dart';

class EnrollElit extends StatelessWidget {
  const EnrollElit({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Get.find<BottomNavController>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.enrollElitBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withAlpha(90),
            child: Column(
              children: [
                _customAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(AppImages.logo),
                            height: 86.h,
                            width: 86.w,
                          ),
                          HeightGap(height: 20.h),
                          Text(
                            'Enrol and join with us!',
                            style: TextStyles.regular20.copyWith(
                                fontWeight: FontWeight.w400, color: AppColors.white500),
                          ),
                          Text(
                            AppConstants.enrollText,
                            style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400, color: AppColors.white700),
                          ),
                          HeightGap(height: 32.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index){
                                return Row(
                                  children: [
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white700
                                      ),
                                    ),
                                    WidthGap(width: 10.w),
                                    Text('Professional coaching by certified trainers', style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white700
                                    ),)
                                  ],
                                );
                              },
                              separatorBuilder: (_,__){
                                return HeightGap(height: 8.h);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(text: 'Enrol Now',
                    onTap: (){
                      Get.toNamed(AppRoute.trainYourSelf);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          color: AppColors.appBar,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
          )),
      child: Center(
        child: Text(
          'Enrol Elite Academy',
          style: TextStyles.regular20
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.white50),
        ),
      ),
    );
  }

}
