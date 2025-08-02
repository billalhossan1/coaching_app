import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/controller/course_history_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/course_history/previous_course.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/size.dart';
import '../../widget/tab_widget.dart';
import 'present_course.dart';

class CourseHistory extends StatelessWidget {
  const CourseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: [
              _customAppBar(),

              HeightGap(height: 21.h),
              // Tab section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: buildTabBar(),
              ),
              HeightGap(height: 12.h),
              // View tab page
              buildTabBarView(context),
            ],
          ),
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
                'Course History',
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
  // Everything of TabBar
  Widget buildTabBar() {
    return GetBuilder<CoursesHistoryController>(
      builder: (controller) => Align(
        alignment: Alignment.centerLeft,
        child: _buildTabBar(controller),
      ),
    );
  }

  // TabBar and Tabs
  Container _buildTabBar(CoursesHistoryController courseHistoryController) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appBg, borderRadius: BorderRadius.circular(30)),
      child: TabBar(
        // isScrollable: true,
        onTap: (index) {
          courseHistoryController.updatedSelectedIndex(index);
        },
        indicator: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.white50
              )
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        labelColor: AppColors.white300,
        unselectedLabelColor: AppColors.blue300,
        labelStyle: TextStyles.regular16.copyWith(
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: TextStyles.regular16.copyWith(
            fontWeight: FontWeight.w400
        ),
        tabs: const [
          TabWidget(tabStatus: 'Present Courses'),
          TabWidget(tabStatus: 'Previous Courses'),
        ],
      ),
    );
  }

  // TabBar view
  Expanded buildTabBarView(context) {
    return  const Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          PresentCourse(),
          PreviousCourse(),
        ],
      ),
    );
  }
}

