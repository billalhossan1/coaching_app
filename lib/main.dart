import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:football_coaching_coach_app/app.dart';
import 'package:football_coaching_coach_app/core/dependency/dependency.dart';
import 'package:football_coaching_coach_app/utils/AppColors/app_colors.dart';
import 'package:football_coaching_coach_app/view/widget/notification_widget.dart';

import 'firebase_options.dart';

void main() async {
  // Ensure Flutter bindings are initialized first
  WidgetsFlutterBinding.ensureInitialized();

  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Firebase Cloud Messaging (FCM)
  await NotificationService().setupFCM();

  // Initialize Dependency Injection
  DependencyInjection di = DependencyInjection();
  di.dependencies();

  // Run the app wrapped in Phoenix for hot-reload
  runApp(Phoenix(child: const FootballCoachApp()));
}
