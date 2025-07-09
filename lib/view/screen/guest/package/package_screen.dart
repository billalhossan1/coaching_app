import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/size.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(text: 'Select Plan', onTap: (){
          Get.toNamed(AppRoute.guestSignInScreen);
        }),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.packageBg,
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text('Choose Your\nFavourite Package', style: TextStyles.title24.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white300
                  ),textAlign: TextAlign.center,),
                  HeightGap(height: 10.h),
                  Text('CSelect one of your favourite package and get the facilities.', style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey100
                  ),textAlign: TextAlign.center,),
                  HeightGap(height: 24.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.green300.withAlpha(60),
                          border: Border.all(
                            color: AppColors.green300
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Free/mo', style: TextStyles.regular20.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white50
                              ),),
                              Text('Public Package', style: TextStyles.regular16.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.green200
                              ),),
                              HeightGap(height: 8.h),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index){
                                  return Row(
                                    children: [
                                      CustomSvgImage(imagePath: AppImages.clickIcon, height: 16.h, width: 16.w,),
                                      WidthGap(width: 20.w),
                                      Text('7 day permission to use', style: TextStyles.regular10.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white400
                                      ),),
                                    ],
                                  );
                                },
                                separatorBuilder: (_,__){
                                  return HeightGap(height: 8.h);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return HeightGap(height: 8.h);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
