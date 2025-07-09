import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/custom_text_form_field_with_height.dart';
import '../../../widget/size.dart';

class EquipmentScreen extends StatelessWidget {
  const EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7, // square containers
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.productDetails);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: CustomSvgImage(
                                      imagePath: AppImages.unFav,
                                      height: 32.h,
                                      width: 32.w,
                                    ),
                                  ),
                                  Center(
                                      child: Image.network(
                                          'https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_640.png',
                                          height: 120.h)),
                                  HeightGap(height: 20.h),
                                  Text(
                                    'Deer Football',
                                    style: TextStyles.regular16.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white300),
                                  ),
                                  Text(
                                    '\$55,00',
                                    style: TextStyles.regular20.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white300),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,
                      size: 24, color: AppColors.white50),
                ),
                Text(
                  'Equipment',
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
            ),
            HeightGap(height: 8.h),
            SizedBox(
              height: 32.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.r),
                        color: AppColors.grey700),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Center(
                        child: Text(
                          'Footballs',
                          style: TextStyles.regular14.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.white700),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return WidthGap(width: 8.w);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
