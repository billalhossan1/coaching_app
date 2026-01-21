import 'package:flutter/material.dart';

import '../../utils/AppColors/app_colors.dart';
import '../../utils/Texts/text_style.dart';

class CustomTextFromField extends StatelessWidget {
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
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;

  const CustomTextFromField({
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
    this.keyBoardType
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readonly == true ? onTap : null,
      child: AbsorbPointer(
        absorbing: readonly ?? false,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyBoardType,
          style: TextStyles.regular16,
          obscureText: obSecureText ?? false,
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine ?? 1,
          readOnly: readonly ?? false,
          validator: validator,
          decoration: buildInputDecoration(context),
          cursorColor: AppColors.white800,
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: hasObsecureText == true
          ? obsecureTextSuffixIcon
          : suffixIcon != null
          ? Icon(suffixIcon, color:
      AppColors.white700)
          : null,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: const Color(0xFFC4A862))
          : null,
      hintText: hintText,
      hintStyle: TextStyles.regular14.copyWith(
        color: AppColors.white800,
        fontWeight: FontWeight.w400,
      ),
      filled: hasFiilColor ?? false,
      fillColor: hasFiilColor != false ? AppColors.black400 : null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.blue300),
        borderRadius: BorderRadius.circular(90.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.blue300),
        borderRadius: BorderRadius.circular(90.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.blue300),
        borderRadius: BorderRadius.circular(90.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(90.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(90.0),
      ),
      errorStyle: TextStyles.regular12.copyWith(
        color: Colors.redAccent,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
    );
  }
}


class CustomTextFromFieldMaxLine extends StatelessWidget {
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
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;

  const CustomTextFromFieldMaxLine({
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
    this.keyBoardType
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readonly == true ? onTap : null,
      child: AbsorbPointer(
        absorbing: readonly ?? false,
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyBoardType,
          style: TextStyles.regular16,
          obscureText: obSecureText ?? false,
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine ?? 1,
          readOnly: readonly ?? false,
          validator: validator,
          decoration: buildInputDecoration(context),
          cursorColor: AppColors.white800,
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: hasObsecureText == true
          ? obsecureTextSuffixIcon
          : suffixIcon != null
          ? Icon(suffixIcon, color:
      AppColors.white700)
          : null,
      prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: const Color(0xFFC4A862))
          : null,
      hintText: hintText,
      hintStyle: TextStyles.regular14.copyWith(
        color: AppColors.white800,
        fontWeight: FontWeight.w400,
      ),
      filled: hasFiilColor ?? false,
      fillColor: hasFiilColor != false ? AppColors.black400 : null,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white700),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white700),
        borderRadius: BorderRadius.circular(20.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white700),
        borderRadius: BorderRadius.circular(20.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(20.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(20.0),
      ),
      errorStyle: TextStyles.regular12.copyWith(
        color: Colors.redAccent,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
    );
  }
}
