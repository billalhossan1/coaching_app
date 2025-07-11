import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/widget/see_more_text_widget.dart';
import 'package:get/get.dart';

import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/Texts/text_style.dart';
import '../../widget/size.dart';
class TrainingVideoScreen extends StatelessWidget {
  const TrainingVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(),
            Container(
              height: 228.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: NetworkImage('https://cdn.pixabay.com/photo/2022/03/08/15/44/boy-7056003_640.jpg',
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Center(
                child: Icon(Icons.play_circle, color: AppColors.green300, size: 48,),
              ),
            ),
            HeightGap(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trap A Soccer Ball Like A PRO', style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.white500
                  ),),
                  HeightGap(height: 8.h),
                  SeeMoreTextWidget(text: '''Sed tincidunt quis tortor. non quam Quisque placerat commodo laoreet Nunc ipsum hendrerit Ut ex amet, dui turpis malesuada laoreet tincidunt amet''',
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            HeightGap(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: AppColors.white900,
                thickness: 0.8,
              ),
            ),
            HeightGap(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text('Shoulder drop shot', style: TextStyles.regular14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white700
                  ),),
                  HeightGap(height: 8.h),
                  Text('8 Contents', style: TextStyles.regular12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white900
                  ),),
                ],
              ),
            ),
            HeightGap(height: 12.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (_,__){
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.black700
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage('https://cdn.pixabay.com/photo/2016/04/15/20/28/football-1331838_640.jpg'),
                                        fit: BoxFit.cover
                                    )
                                ),
                                height: 71.h,

                              ),
                            ),
                            WidthGap(width: 10.w),
                            Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Trap A Soccer Ball Like A PRO',
                                      style: TextStyles.regular14.copyWith(
                                          fontWeight: FontWeight.w400, color: AppColors.white500),
                                    ),
                                    HeightGap(height: 30.h),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.play_arrow, color: AppColors.white900,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Text(
                                            ' 2:50',
                                            style: TextStyles.regular14.copyWith(
                                                fontWeight: FontWeight.w400, color: AppColors.white500),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_,__){
                    return HeightGap(height: 10.h);
                  },
                ),
              ),
            )
          ],
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
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r)
          )
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: (){
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
                'Tutorial for you',
                style: TextStyles.regular20.copyWith(fontWeight: FontWeight.w500, color: AppColors.white50),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}



