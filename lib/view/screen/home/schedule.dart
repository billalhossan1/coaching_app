import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';

import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/Texts/text_style.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
                          child: Text('2 Schedule', style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white900
                          ),),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index){
                            return Container(
                              height: 88.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.grey900
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Under 20 summer 25', style: TextStyles.regular12.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.green500
                                    ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Under 20 summer 25', style: TextStyles.regular12.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white700
                                        ),),
                                        Text('4:30 PM - 6:00 PM', style: TextStyles.regular12.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white600
                                        ),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_,__){
                            return HeightGap(height: 8.h);
                          },
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return HeightGap(height: 8.h);
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
      height: 64.h,
      decoration: BoxDecoration(
        color: AppColors.appBar,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
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
                child: Icon(Icons.arrow_back, color: AppColors.white50),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Schedule',
                style: TextStyles.regular20.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white50,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
