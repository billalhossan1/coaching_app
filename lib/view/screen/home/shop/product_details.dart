import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/shop/controller/shop_controller.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_svg.dart';
import '../../../widget/decorated_network_image.dart';
import '../../../widget/network_image_widget.dart';
import '../../../widget/size.dart';
import '../widget/see_more_text_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final shopController = Get.find<ShopController>();
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(shopController),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 431.h,
                          width: screenWidth / 1.1,
                          decoration: BoxDecoration(
                              color: AppColors.grey500,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(42.r))),
                          child: Center(
                            child: NetworkImageWidget(
                              imageUrl:
                                  "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_640.png",
                              height: 200.h,
                              width: 200.w,
                            ),
                          ),
                        ),
                        Positioned(
                            right: -19,
                            top: 50,
                            child: CustomSvgImage(
                              imagePath: AppImages.unFav,
                              height: 40.h,
                              width: 40.w,
                            )),
                        Positioned(
                          right: -19,
                          top: 200,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.primaryColor),
                            height: 202.h,
                            width: 52.h,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: ListView.separated(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return DecoratedNetworkImage(
                                      imageUrl:
                                          "https://cdn.pixabay.com/photo/2017/06/08/15/27/banner-2383907_640.png",
                                      height: 40.h,
                                      width: 40.w,
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return HeightGap(height: 8.h);
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    HeightGap(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deer Football',
                            style: TextStyles.title12.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300),
                          ),
                          HeightGap(height: 8.h),
                          Text(
                            '\$ 581',
                            style: TextStyles.regular20.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300),
                          ),
                          HeightGap(height: 16.h),
                          Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: Text(
                                  'Size',
                                  style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white700),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.6,
                                height: 32.h,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          color: AppColors.grey700),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '5',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, __) {
                                    return WidthGap(width: 8.w);
                                  },
                                ),
                              ),
                            ],
                          ),
                          HeightGap(height: 16.h),
                          SeeMoreTextWidget(
                            text:
                                '''Official Size: Designed for regulation play, ideal for ages and above, ensuring an authentic football experience Durable Construction: Withstands rigorous training and performance and value....See more''',
                            maxLines: 3,
                          ),
                          SizedBox(),
                        ],
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

  /// Bottom Nav Bar
  Container _bottomNavBar(ShopController shopController) {
    return Container(
      height: 78.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.grey800,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 44.h,
                  width: 168.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.r),
                      color: AppColors.grey500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            shopController.decrement();
                          },
                          child: Icon(
                            Icons.remove,
                            size: 28,
                            color: AppColors.white300,
                          ),
                        ),
                        Obx(() {
                          final shopController = Get.find<ShopController>();

                          return Text(
                            '${shopController.count.value}',
                            style: TextStyles.regular16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300),
                          );
                        }),
                        GestureDetector(
                            onTap: () {
                              shopController.incrementValue();
                            },
                            child: Icon(
                              Icons.add,
                              size: 28,
                              color: AppColors.white300,
                            )),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.cartScreen);
                  },
                  child: Container(
                    height: 44.h,
                    width: 143.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.r),
                        color: AppColors.green500),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyles.regular16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          HeightGap(height: 16.h),
        ],
      ),
    );
  }

  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.r)),
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
                  'product Details',
                  style: TextStyles.regular20.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.white50),
                ),
                CustomSvgImage(imagePath: AppImages.cart)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
