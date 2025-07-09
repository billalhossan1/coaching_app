import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/shop/controller/shop_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_form_field_with_height.dart';
import '../../../widget/network_image_widget.dart';
import '../../../widget/size.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),
            // Address and time input
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.grey800),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 20, color: Colors.redAccent),
                                    WidthGap(width: 8.w),
                                    Text(
                                      'Address',
                                      style: TextStyles.regular16.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.white300),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.edit, size: 20, color: AppColors.blue),
                                    WidthGap(width: 8.w),
                                    Text(
                                      'Edit',
                                      style: TextStyles.regular16.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blue),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            HeightGap(height: 12.h),
                            Text(
                              '4517 Washington Ave. Manchester, Kentucky 39495',
                              style: TextStyles.regular14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white600),
                            ),
                            HeightGap(height: 10.h),
                            Text(
                              'Delivery Date',
                              style: TextStyles.regular16.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white300),
                            ),
                            HeightGap(height: 10.h),
                            CustomTextFromFieldWithHeight(
                              onTap: (){
                                controller.pickDate();
                              },
                              readonly: true,
                              controller: controller.dateTimeController,
                              hintText: 'dd/mm/yyyy',
                              suffixIcon: Icons.calendar_month,
                            )
                          ],
                        ),
                      ),
                    ),
                    HeightGap(height: 12.h),
                    // Item
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Item', style: TextStyles.title16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300
                              ),),
                              HeightGap(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 63.h,
                                    width: 63.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.r),
                                        color: AppColors.grey500
                                    ),
                                    child: Center(
                                      child: NetworkImageWidget(imageUrl: "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_640.png",
                                        height: 50.h,
                                        width: 50.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 63.h,
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
                                        Text('1 pcs',
                                          style: TextStyles.regular14.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.white300
                                          ),),

                                      ],
                                    ),
                                  ),
                                  Text('\$230.00',
                                    style: TextStyles.regular14.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey200
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    HeightGap(height: 12.h),
                    // Payment Summary
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payment Summary', style: TextStyles.title16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white300
                            ),),
                            HeightGap(height: 12.h),
                            Row(
                              children: [
                                Text('Coupon Code', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                                WidthGap(width: 100.w),
                                Expanded(
                                  child: CustomTextFromFieldWithHeight(hintText: 'Enter Code', height: 30.h,),
                                )
                              ],
                            ),
                            HeightGap(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sub Total', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                                Text('230.00', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                              ],
                            ),
                            HeightGap(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Fee', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                                Text('30.00', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                              ],
                            ),
                            HeightGap(height: 4.h),
                            Divider(
                              color: AppColors.white900,
                              thickness: 0.4,
                            ),
                            HeightGap(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Payment', style: TextStyles.title14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                                Text('260.00', style: TextStyles.regular12.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white600
                                ),),
                              ],
                            ),
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
                'Checkout',
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
              child: CustomButton(text: 'Payment', onTap: () {})),
          HeightGap(height: 16.h),
        ],
      ),
    );
  }
}
