import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../../utils/format_time.dart';
import '../../../widget/size.dart';
import '../controller/home_controller.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Obx((){
                  final controller = Get.find<HomeController>();
                  return ListView.separated(
                    controller: controller.notificationScrollController,
                    itemCount: controller.notificationList.length + (controller.isPaginationLoading.value ? 1 : 0),
                    itemBuilder: (context, index){
                      final notificationData = controller.notificationList[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.grey800
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text( ShortText.getShortText(notificationData.title??'',maxLength: 34), style: TextStyles.regular14.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white300,
                                  ),),
                                  Text(notificationData.timeAgo??'', style: TextStyles.regular10.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white800,
                                  ),),
                                ],
                              ),
                              HeightGap(height: 12.h),
                              Text(notificationData.body??'', style: TextStyles.regular12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.white800,
                              ),),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_,__){
                      return HeightGap(height: 8.h);
                    },
                  );
                }
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
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
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
                'Notification',
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
}