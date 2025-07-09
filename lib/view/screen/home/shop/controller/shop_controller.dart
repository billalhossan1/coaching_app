import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController{
  RxInt count= 0.obs;
  void incrementValue(){
    count.value++;
  }
  void decrement(){
    if(count>0){
      count.value--;
    }else{
      count.value=0;
    }
  }

  TextEditingController dateTimeController = TextEditingController();


  var selectedDate = Rxn<DateTime>();

  void pickDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
      dateTimeController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

}