import 'package:flutter/material.dart';

import '../../utils/AppColors/app_colors.dart';
import '../../utils/Texts/text_style.dart';


class CustomTextFromFieldWithHeight extends StatelessWidget {
  final String? hintText;
  final int? maxLine;
  final bool? readonly;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? hasObsecureText;
  final Widget? obsecureTextSuffixIcon;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? reduceHeight;
  final bool? isClickAble;
  final bool? obSecureText;
  final double? height;
  final bool? hasFiilColor;
  final bool isEmail;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFromFieldWithHeight({
    super.key,
    required this.hintText,
    this.maxLine,
    this.readonly,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onTap,
    this.onChanged,
    this.reduceHeight,
    this.isClickAble,
    this.hasObsecureText,
    this.obSecureText,
    this.obsecureTextSuffixIcon,
    this.height,
    this.validator,
    this.hasFiilColor,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readonly == true ? onTap : null,
      child: AbsorbPointer(
        absorbing: readonly ?? false,
        child: Container(
          height: height ?? 48,
          child: TextFormField(
            keyboardType: keyboardType,
            maxLength: null,
            style: TextStyles.regular16.copyWith(
              color: AppColors.white300,
            ),
            obscureText: obSecureText ?? false,
            onChanged: onChanged,
            controller: controller,
            maxLines: maxLine ?? 1,
            readOnly: readonly ?? false,
            validator: validator,
            textAlignVertical: TextAlignVertical.center, // Center text vertically
            decoration: buildInputDecoration(context),
            cursorColor: AppColors.white800,
            cursorHeight: 16,
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: hasObsecureText == true
          ? obsecureTextSuffixIcon
          : suffixIcon != null
          ? Icon(suffixIcon, color: AppColors.white700)
          : null,
      prefixIcon: prefixIcon != null
          ? Icon(
        prefixIcon,
        color: AppColors.blue500,
        size: 18,
      )
          : null,
      hintText: hintText,
      hintStyle: TextStyles.regular14.copyWith(
        color: AppColors.white800,
        fontWeight: FontWeight.w400,
      ),
      filled: hasFiilColor ?? false,
      fillColor: hasFiilColor != false ? AppColors.white900 : null,
      border: hasFiilColor != true
          ? OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.white700,
        ),
        borderRadius: BorderRadius.circular(90.0),
      )
          : OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.circular(90.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.white700,
        ),
        borderRadius: BorderRadius.circular(90.0),
      ),
      enabledBorder: hasFiilColor != true
          ? OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.white700,
        ),
        borderRadius: BorderRadius.circular(90.0),
      )
          : null,
      contentPadding: EdgeInsets.symmetric(
        vertical: 8, // Reduced vertical padding
        horizontal: 16,
      ),
    );
  }
}