import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Rxn<String> selectedValue;
  final Function(String) onChanged;
  final String hintText;

  const CustomDropdown({super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(() {
        return DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyles.title12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.green500),
              ),
            );
          }).toList(),
          value: selectedValue.value,
          onChanged: (String? value) {
            if (value != null) {
              onChanged(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: 30.h,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: Colors.transparent,
                border: Border.all(
                    color: AppColors.grey800
                )
            ),
            elevation: 0,
          ),
          iconStyleData: IconStyleData(
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconSize: 24,
            iconEnabledColor: Colors.grey,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.white600,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        );
      }),
    );
  }
}