import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/academic_fee/controller/controller.dart';
import 'package:get/get.dart';

import '../../../../../utils/AppColors/app_colors.dart';
import '../../../../../utils/Texts/text_style.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/custom_drop_down.dart';
import '../../../../widget/custom_text_form_field_with_height.dart';
import '../../../../widget/size.dart';

class FeeDetails extends StatelessWidget {
  const FeeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final academicFeesController = Get.find<AcademicFeesController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _customAppBar(),
            HeightGap(height: 12.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.grey800,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Student Information',
                      style: TextStyles.regular16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white300),
                    ),
                    HeightGap(height: 12.h),
                    StudentInfoCart(
                      screenWidth: screenWidth,
                      title: 'Student Name',
                      info: 'Asad Ujjaman',
                    ),
                    HeightGap(height: 12.h),
                    StudentInfoCart(
                      screenWidth: screenWidth,
                      title: 'Student Id',
                      info: '1256354',
                    ),
                    HeightGap(height: 12.h),
                    StudentInfoCart(
                      screenWidth: screenWidth,
                      title: 'Email',
                      info: 'Asadux@gmail.com',
                    ),
                    HeightGap(height: 12.h),
                    StudentInfoCart(
                      screenWidth: screenWidth,
                      title: 'Address',
                      info: '4517 Washington Ave. Manchester, Kentucky 39495',
                    ),
                    HeightGap(height: 8.h),
                    const Divider(
                      color: AppColors.white800,
                      thickness: 0.3,
                    ),
                    HeightGap(height: 12.h),
                    Text(
                      'Select Course',
                      style: TextStyles.regular16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white300),
                    ),
                    HeightGap(height: 8.h),
                    CustomDropdown(
                      items: academicFeesController.genderItems,
                      selectedValue: academicFeesController.selectedGenderValue,
                      hintText: "Gender",
                      onChanged: (value) {
                        academicFeesController.selectedGenderValue(value);
                      },
                    ),
                    HeightGap(height: 8.h),
                    Text(
                      'Payment Date',
                      style: TextStyles.regular16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white300),
                    ),
                    HeightGap(height: 8.h),
                    CustomTextFromFieldWithHeight(
                      hintText: 'dd/mm/yyyy',
                      readonly: true,
                      controller: academicFeesController.dateTimeController,
                      onTap: (){
                        academicFeesController.pickDate();
                      },
                    ),
                    HeightGap(height: 8.h),
                    Text(
                      'Payment Summary',
                      style: TextStyles.regular16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white300),
                    ),
                    HeightGap(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Academy fee', style: TextStyles.regular12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white700
                        ),),
                        Text('\$500.00', style: TextStyles.regular12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.white700
                        ),),
                      ],
                    ),
                    const Divider(
                      color: AppColors.white700,
                        thickness: 0.3,
                    ),
                    HeightGap(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white700
                        ),),
                        Text('\$500.00', style: TextStyles.regular12.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white700
                        ),),
                      ],
                    ),
                    HeightGap(height: 24.h),
                    CustomButton(text: 'Submit Home Work', onTap: (){})
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
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r)),
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
                'Academic Fee',
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

class StudentInfoCart extends StatelessWidget {
  final String title;
  final String info;

  const StudentInfoCart(
      {super.key,
      required this.screenWidth,
      required this.title,
      required this.info});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * 0.45,
            child: Text(
              title,
              style: TextStyles.regular14.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.white600),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.45,
            child: Text(
              ': $info',
              style: TextStyles.regular14.copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.white600),
            ),
          ),
        ],
      ),
    );
  }
}
