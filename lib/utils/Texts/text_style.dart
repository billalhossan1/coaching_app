import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/app_colors.dart';

class TextStyles {
  static TextStyle title32 = GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.w600, color: AppColors.white50);
  static final title48 = title32.copyWith(fontSize: 48);
  static final title30 = title32.copyWith(fontSize: 30);
  static final title26 = title32.copyWith(fontSize: 26);
  static final title24 = title32.copyWith(fontSize: 24);
  static final title22 = title32.copyWith(fontSize: 22);
  static final title20 = title32.copyWith(fontSize: 20);
  static final title18 = title32.copyWith(fontSize: 18);
  static final title16 = title32.copyWith(fontSize: 16);
  static final title14 = title32.copyWith(fontSize: 14);
  static final title12 = title32.copyWith(fontSize: 12);
  static final title11 = title32.copyWith(fontSize: 11);

  static TextStyle regular16 = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white50, fontWeight: FontWeight.normal);
  static TextStyle regular16Thin100 = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white50, fontWeight: FontWeight.w100);
  static TextStyle regular16Thin200 = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white50, fontWeight: FontWeight.w200);
  static TextStyle regular16Thin300 = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white50, fontWeight: FontWeight.w300);
  static TextStyle regular16Thin400 = GoogleFonts.poppins(
      fontSize: 16, color: AppColors.white50, fontWeight: FontWeight.w400);

  static final regular24 = regular16.copyWith(fontSize: 24);
  static final regular22 = regular16.copyWith(fontSize: 22);
  static final regular20 = regular16.copyWith(fontSize: 20);
  static final regular18 = regular16.copyWith(fontSize: 18);
  static final regular17 = regular16.copyWith(fontSize: 17);
  static final regular15 = regular16.copyWith(fontSize: 16);
  static final regular14 = regular16.copyWith(fontSize: 14);
  static final regular12 = regular16.copyWith(fontSize: 12);
  static final regular11 = regular16.copyWith(fontSize: 11);
  static final regular10 = regular16.copyWith(fontSize: 10);
  static final regular8 = regular16.copyWith(fontSize: 8);
  static final regular9 = regular16.copyWith(fontSize: 9.5);
}