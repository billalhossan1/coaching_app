import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/conditional_image_widget.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/custom_text_form_field_with_height.dart';
import '../../../widget/size.dart';
import '../../auth/controller/auth_controller.dart';
import '../bottom_nav_bar/controller/controller.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomNavController = Get.find<BottomNavController>();
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: Column(
        children: [
          _customAppBar(),
          HeightGap(height: 20.h),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16, bottom: index==9? 10:0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoute.trainYourSelf);
                    },
                    child: Container(
                      height: 108.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r), // Scaled radius
                        color: AppColors.green700, // Assuming AppColors is defined
                        border: Border.all(color: AppColors.green500),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text section with flexible width
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  'Equipment',
                                  style: TextStyles.title16.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white300,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  // Changed to ellipsis for better UX
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: ConditionalImageWidget(
                                imageUrl: "https://cdn.pixabay.com/photo/2020/08/08/16/58/sports-5473480_640.png",
                                width: screenWidth * 0.45,
                                height: 108.h,
                                baseUrl: "Api",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_,__){
                return HeightGap(height: 12.h);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r)),
          color: AppColors.appBar),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back, size: 24, color: AppColors.white50),
                Text(
                  'Shop',
                  style: TextStyles.regular20.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.white50),
                ),
                CustomSvgImage(imagePath: AppImages.cart)
              ],
            ),
            HeightGap(height: 17.h),
            CustomTextFromFieldWithHeight(
              hintText: 'Search here',
              height: 40,
              hasFiilColor: true,
            )
          ],
        ),
      ),
    );
  }
}
