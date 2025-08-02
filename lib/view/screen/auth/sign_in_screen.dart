import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/view/screen/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import '../../../utils/AppColors/app_colors.dart';
import '../../../utils/AppImg/app_img.dart';
import '../../../utils/StaticString/static_string.dart';
import '../../../utils/Texts/text_style.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_circular_indicator.dart';
import '../../widget/custom_text_form_field.dart';
import '../../widget/size.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  RxBool value = false.obs;

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: controller.signInFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 150),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: const AssetImage(AppImages.logo), height: 82.h, width: 82.w,),
                        // sing in page logo
                        const HeightGap(height: 24),
                        // sign in title
                        Text(AppString.signInScreenTitle, style: TextStyles.regular20.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white300,
                        ),),
                        const HeightGap(height: 8),
                        // Sign in description
                        Text(AppString.signInScreenDescription, style: TextStyles.regular14.copyWith(
                          fontWeight: FontWeight.w400,color: AppColors.white600,
                        ),),
                        const HeightGap(height: 29),
                        // Email Field
                        CustomTextFromField(
                          controller: controller.signInEmailTextEditingController,
                          hintText: 'Email',
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Email can't be empty";
                            }
                            return null;
                          },
                        ),
                        const HeightGap(height: 33),
                        // Password Field
                        _passwordField(),
                        const HeightGap(height: 20),
                        // Remember Me and Forgot Password
                        _rememberMeAndForgotPassword(authController),
                        const HeightGap(height: 24),
                        // Sing in Button
                        Obx(() {
                          return controller.isLoading.value
                              ? const CustomCircularIndicator()
                              : CustomButton(
                            onTap: () {
                             controller.onTapLogin();
                              // if (_signUpFormKey.currentState!.validate()) {
                              //   Get.toNamed(AppRoute.bottomNavBar);
                              // }
                            },
                            text: 'Sign in',
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Password Field
  GetBuilder<AuthController> _passwordField() {
    final controller = Get.find<AuthController>();
    return GetBuilder<AuthController>(
      builder: (authController) => CustomTextFromField(
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
                ? const Icon(Icons.visibility_off_outlined, color: AppColors.blue300,)
                : const Icon(Icons.visibility_outlined,color: AppColors.blue300)),
      ),
    );
  }

  // Remember Me and Forgot Password
  Row _rememberMeAndForgotPassword(AuthController authController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: authController.toggleCheckbox,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              children: [
                Obx(()=>AnimatedContainer(
                    duration: const Duration(microseconds: 200),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.blue300, width: 0.5)),
                    child: authController.isChecked.value
                        ? const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 18,
                    ) : null),),
                const WidthGap(width: 8),
                Text(
                  'Remember me',
                  style: TextStyles.regular12.copyWith(
                      color: AppColors.black200, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //
        //   },
        //   child: Text(
        //     'Forgot password?',
        //     style: TextStyles.regular12.copyWith(
        //         color: AppColors.green500,
        //         fontWeight: FontWeight.w500,
        //         decoration: TextDecoration.underline,
        //         decorationColor:AppColors.green500,),
        //   ),
        // ),
      ],
    );
  }
}
