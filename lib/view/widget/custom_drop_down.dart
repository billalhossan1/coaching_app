import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/AppColors/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Rxn<String> selectedValue;
  final Function(String) onChanged;
  final String hintText;

  CustomDropdown({
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(() {
        final value = selectedValue.value;
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
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
          value: items.contains(value) ? value : null, // ✅ Safe value binding
          onChanged: (String? value) {
            if (value != null) {
              onChanged(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            height: 44.h,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.primaryColor,
              border: Border.all(
                  color: Color(0xFFA6ACA4)
              ),
            ),
            elevation: 0,
          ),
          iconStyleData: IconStyleData(
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 24,
            iconEnabledColor: Colors.grey,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.primaryColor,
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
