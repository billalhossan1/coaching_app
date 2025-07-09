import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_form_field_with_height.dart';
import '../../../widget/size.dart';
import '../../auth/controller/auth_controller.dart';
import '../../home/widget/divider_or_widget.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:_bottomSignInButton(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.signUpBg),fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeightGap(height: 44.h),
                  Center(
                    child: Text('Create an Account', style: TextStyles.regular20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white300
                    ),),
                  ),
                  HeightGap(height: 8.h),
                  Center(
                    child: Text('Please Enter Your Details', style: TextStyles.regular14.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey100
                    ),),
                  ),
                  HeightGap(height: 24.h),
                  CustomSocialButton(text: 'Log in with Google', onTap: (){}, isColorWhite: true,),
                  HeightGap(height: 24.h),
                  DivideOrWidget(),
                  HeightGap(height: 24.h),
                  CustomTextFromFieldWithHeight(hintText: 'Enter your name', height: 44.h,),
                  HeightGap(height: 24.h),
                  CustomTextFromFieldWithHeight(hintText: 'Email', height: 44.h, keyboardType: TextInputType.emailAddress,),
                  HeightGap(height: 24.h),
                  _passwordField(),
                  HeightGap(height: 24.h),
                  _confirmPasswordField(),
                  HeightGap(height: 24.h),
                  CustomButton(text: 'Sign Up', onTap: (){
                    Get.toNamed(AppRoute.packageScreen);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  SizedBox _bottomSignInButton() {
    return SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
            text: 'Already have an account?? ',
            style: TextStyles.regular12.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.black200,
            ),
            children: [
              TextSpan(
                text: ' Sign in',
                style: TextStyles.regular12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(AppRoute.guestSignInScreen);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
  GetBuilder<AuthController> _passwordField() {
    final controller = Get.find<AuthController>();
    return GetBuilder<AuthController>(
      builder: (authController) => CustomTextFromFieldWithHeight(
        height: 44.h,
        controller: controller.signInPasswordTextEditingController,
        hintText: 'Password',
        hasObsecureText: true,
        obSecureText: authController.passwordVisible,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Password can't be empty";
          }
          return null;
        },
        obsecureTextSuffixIcon: IconButton(
            onPressed: () {
              authController.doPasswordVisible =
              !authController.passwordVisible;
              // authController.update();
            },
            icon: authController.passwordVisible
                ? const Icon(Icons.visibility_off_outlined, color: AppColors.white900,)
                : const Icon(Icons.visibility_outlined,color: AppColors.white900)),
      ),
    );
  }

  GetBuilder<AuthController> _confirmPasswordField() {
    final controller = Get.find<AuthController>();
    return GetBuilder<AuthController>(
      builder: (authController) => CustomTextFromFieldWithHeight(
        height: 44.h,
        controller: controller.signInPasswordTextEditingController,
        hintText: 'Confirm Password',
        hasObsecureText: true,
        obSecureText: authController.guestPasswordVisible,
        validator: (value){
          if(value == null || value.isEmpty){
            return "Password can't be empty";
          }
          return null;
        },
        obsecureTextSuffixIcon: IconButton(
            onPressed: () {
              authController.doGuestPasswordVisible =
              !authController.guestPasswordVisible;
              // authController.update();
            },
            icon: authController.guestPasswordVisible
                ? const Icon(Icons.visibility_off_outlined, color: AppColors.white900,)
                : const Icon(Icons.visibility_outlined,color: AppColors.white900)),
      ),
    );
  }

}
