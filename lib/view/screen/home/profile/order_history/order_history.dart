import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/size.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 20.h),
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
            ),
            HeightGap(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.grey800
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('#1458118', style: TextStyles.regular14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white700
                                ),),
                                Text('Pending', style: TextStyles.regular14.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white700
                                ),),
                              ],
                            ),
                            HeightGap(height: 8.h),
                            Text('Price: \$230.00', style: TextStyles.regular14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white700
                            ),),
                            HeightGap(height: 8.h),
                            Text('Total Products: 3', style: TextStyles.regular14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white700
                            ),),
                            HeightGap(height: 8.h),
                            Text('Delivery Date: 20-Dec-2024', style: TextStyles.regular14.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white700
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_,__){
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
      decoration: const BoxDecoration(
        color: AppColors.appBar,
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white50,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Order History',
                style: TextStyles.regular20.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.white50),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
