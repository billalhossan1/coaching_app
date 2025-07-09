import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/shop/controller/shop_controller.dart';
import 'package:get/get.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/network_image_widget.dart';
import '../../../widget/size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: ListView.separated(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 82.h,
                          width: 82.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.grey500
                          ),
                          child: Center(
                            child: NetworkImageWidget(imageUrl: "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_640.png",
                              height: 66.h,
                              width: 66.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 82.h,
                          width: 110.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alfa Football Bag',
                                style: TextStyles.regular14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white300
                                ),),
                              Text('\$230.00',
                                style: TextStyles.regular14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white300
                                ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  IncrementDecrementButton(
                                    onTap: () {
                                      controller.decrement();
                                    },
                                    icon: Icons.remove,
                                  ),
                                  Obx(() {
                                    return Text(
                                      controller.count.value.toString(),
                                      style: TextStyles.regular12.copyWith(
                                          fontWeight: FontWeight.w300
                                      ),
                                    );
                                  }
                                  ),
                                  IncrementDecrementButton(
                                    onTap: () {
                                      controller.incrementValue();
                                    },
                                    icon: Icons.add,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.grey800
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete_outline, color: AppColors.white300,),
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return HeightGap(height: 8.h);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Custom AppBar
  Container _customAppBar() {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
          color: AppColors.appBar,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r))),
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
                'Cart',
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

  /// Bottom Nav Bar
  Container _bottomNavBar() {
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
              child: CustomButton(text: 'Checkout', onTap: () {
                Get.toNamed(AppRoute.checkoutScreen);
              })),
          HeightGap(height: 16.h),
        ],
      ),
    );
  }
}

class IncrementDecrementButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const IncrementDecrementButton({
    super.key,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey800
        ),
        child: Center(
          child: Icon(icon, color: AppColors.white300, size: 18,),
        ),
      ),
    );
  }
}
