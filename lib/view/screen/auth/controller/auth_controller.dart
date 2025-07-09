import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  TextEditingController signInEmailTextEditingController = TextEditingController();
  TextEditingController signInPasswordTextEditingController = TextEditingController();
  var isLoading = false.obs;

  RxBool isGuestAuthenticate = false.obs;
  void setGuestAuthenticate(){
    isGuestAuthenticate.value= true;
  }

  // Checkbox
  var isChecked = false.obs;
  void toggleCheckbox(){
    isChecked.value = !isChecked.value;
  }

  ///***** Password Visibility for SignIn Page ******
  bool obscureText= true;
  bool get passwordVisible=>obscureText;
  set doPasswordVisible(bool value){
    obscureText =value;
    update();
  }

  ///***** Password Visibility for guest SignIn Page ******
  bool guestPassObscureText= true;
  bool get guestPasswordVisible=>obscureText;
  set doGuestPasswordVisible(bool value){
    guestPassObscureText =value;
    update();
  }
}