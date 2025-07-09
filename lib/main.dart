import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_coaching_coach_app/app.dart';
import 'package:football_coaching_coach_app/core/dependency/dependency.dart';
import 'package:football_coaching_coach_app/utils/AppColors/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  DependencyInjection di = DependencyInjection();
  di.dependencies();
  runApp(const FootballCoachApp());
}