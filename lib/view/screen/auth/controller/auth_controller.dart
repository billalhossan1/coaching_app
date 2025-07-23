import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/Helper/shared_prefe/shared_prefe.dart';
import 'package:football_coaching_coach_app/core/app_route/app_route.dart';
import 'package:football_coaching_coach_app/utils/AppConst/app_const.dart';
import 'package:football_coaching_coach_app/utils/ToastMsg/toast_message.dart';
import 'package:football_coaching_coach_app/view/screen/auth/repo/auth_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthController extends GetxController {
  TextEditingController signInEmailTextEditingController =
      TextEditingController();
  TextEditingController signInPasswordTextEditingController =
      TextEditingController();
  // var isLoading = false.obs;
  RxBool isLoading = false.obs;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  RxBool isGuestAuthenticate = false.obs;
  void setGuestAuthenticate() {
    isGuestAuthenticate.value = true;
  }

  // Checkbox
  var isChecked = false.obs;
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  ///***** Password Visibility for SignIn Page ******
  bool obscureText = true;
  bool get passwordVisible => obscureText;
  set doPasswordVisible(bool value) {
    obscureText = value;
    update();
  }

  ///***** Password Visibility for guest SignIn Page ******
  bool guestPassObscureText = true;
  bool get guestPasswordVisible => obscureText;
  set doGuestPasswordVisible(bool value) {
    guestPassObscureText = value;
    update();
  }

  AuthRepo authRepo = AuthRepo();

  Future<void> onTapLogin() async {
    try {
      if (signInFormKey.currentState!.validate()) {
        isLoading.value = true;
        Response response = await authRepo.login(
            email: signInEmailTextEditingController.text.trim(),
            password: signInPasswordTextEditingController.text
        );

        isLoading.value = false;
        if (response.statusCode == 200) {
          showCustomSnackBar('Login Successfully',isError: false);
          String? token = response.body['data']['accessToken'];
          SharePrefsHelper.setString(AppConstants.bearerToken, token);
          Get.offAllNamed(AppRoute.bottomNavBar);
        } else {
          showCustomSnackBar(response.statusText ?? "Something went wrong");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
