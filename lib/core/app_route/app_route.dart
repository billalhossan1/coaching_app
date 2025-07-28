import 'package:football_coaching_coach_app/view/screen/home/mange_class/manage_class_by_id.dart';
import 'package:football_coaching_coach_app/view/screen/home/notificaiton/notification.dart';
import 'package:football_coaching_coach_app/view/screen/home/video_player/video_player_screen.dart';
import 'package:get/get.dart';

import '../../view/screen/auth/sign_in_screen.dart';
import '../../view/screen/home/bottom_nav_bar/bottom_nav_screen.dart';
import '../../view/screen/home/course_details.dart';
import '../../view/screen/home/mange_class/home_work.dart';
import '../../view/screen/home/mange_class/performance.dart';
import '../../view/screen/home/mange_class/student_details.dart';
import '../../view/screen/home/profile/about/about.dart';
import '../../view/screen/home/profile/academic_fee/academic_fee.dart';
import '../../view/screen/home/profile/academic_fee/fee_details.dart';
import '../../view/screen/home/profile/app_support/app_support.dart';
import '../../view/screen/home/profile/course_history/course_details.dart';
import '../../view/screen/home/profile/course_history/course_history.dart';
import '../../view/screen/home/profile/hep_support/help_support.dart';
import '../../view/screen/home/profile/order_history/order_history.dart';
import '../../view/screen/home/profile/profile_details/profile_details.dart';
import '../../view/screen/home/profile/setting/change_password.dart';
import '../../view/screen/home/profile/setting/setting.dart';
import '../../view/screen/home/profile/terms_condition/terms_condition.dart';
import '../../view/screen/home/profile/wish_list/wish_list.dart';
import '../../view/screen/home/schedule.dart';
import '../../view/screen/home/training_video_screen.dart';
import '../../view/screen/onboarding/view/splash_screen1.dart';
import '../../view/screen/onboarding/view/onboarding.dart';

class AppRoute {
  ///==================== Initial Routes ====================

  static const String splashScreen = "/splash_screen";
  static const String splashScreen2 = "/splash_screen2";
  static const String signInScreen = "/sign_in_screen";
  static const String bottomNavBar = "/bottom_nav_bar";
  static const String trainYourSelf = "/trainYourSelf";
  static const String equipmentScreen = "/equipmentScreen";
  static const String productDetails = "/productDetails";
  static const String cartScreen = "/cartScreen";
  static const String checkoutScreen = "/checkoutScreen";
  static const String homeWork = "/homeWork";
  static const String profileDetails = "/profileDetails";
  static const String wishList = "/wishList";
  static const String academicFee = "/academicFee";
  static const String feeDetails = "/feeDetails";
  static const String orderHistory = "/orderHistory";
  static const String courseHistory = "/courseHistory";
  static const String courseDetails = "/courseDetails";
  static const String settings = "/settings";
  static const String changePassword = "/changePassword";
  static const String helpSupport = "/helpSupport";
  static const String about = "/about";
  static const String appSupport = "/appSupport";
  static const String termsCondition = "/termsCondition";
  static const String signUp = "/signUp";
  static const String guestSignInScreen = "/guestSignInScreen";
  static const String packageScreen = "/packageScreen";
  static const String homeCourseDetails = "/homeCourseDetails";
  static const String performance = "/performance";
  static const String assignHomeWork = "/assignHomeWork";
  static const String schedule = "/schedule";
  static const String studentDetails = "/studentDetails";
  static const String trainingVideoScreen = "/trainingVideoScreen";
  static const String videoPlayerScreen = "/videoPlayer";
  static const String menageClassById = "/videoPlayer";
  static const String notificationScreen = "/notification";

  static List<GetPage> routes = [
    ///==================== Initial Routes ====================

    GetPage(name: splashScreen, page: () => const SplashScreen1()),
    GetPage(name: splashScreen2, page: () =>  OnboardingScreen()),
    GetPage(name: bottomNavBar, page: () =>  BottomNavBar()),

    ///==================== Auth Routes ====================
    GetPage(name: signInScreen, page: () => SignInScreen()),

    ///======================= Home Route =====================
    GetPage(name: homeCourseDetails, page: () =>  HomeCourseDetails()),
    GetPage(name: performance, page: () =>  Performance()),
    GetPage(name: assignHomeWork, page: () =>  HomeWork()),
    GetPage(name: schedule, page: () =>  Schedule()),
    GetPage(name: studentDetails, page: () =>  StudentDetails()),
    GetPage(name: trainingVideoScreen, page: () =>  TrainingVideoScreen()),

    ///======================= Profile Details =====================
    GetPage(name: profileDetails, page: () =>  ProfileDetails()),
    GetPage(name: wishList, page: () =>  WishList()),
    GetPage(name: academicFee, page: () =>  AcademicFee()),
    GetPage(name: feeDetails, page: () =>  FeeDetails()),
    GetPage(name: orderHistory, page: () =>  OrderHistory()),
    GetPage(name: courseHistory, page: () =>  CourseHistory()),
    GetPage(name: courseDetails, page: () =>  CourseDetails()),
    GetPage(name: settings, page: () =>  Setting()),
    GetPage(name: changePassword, page: () =>  ChangePassword()),
    GetPage(name: helpSupport, page: () =>  HelpSupport()),
    GetPage(name: about, page: () =>  About()),
    GetPage(name: menageClassById, page: () =>  ManageClassById()),
    GetPage(name: appSupport, page: () =>  AppSupport()),
    GetPage(name: termsCondition, page: () =>  TermsCondition()),
    GetPage(name: notificationScreen, page: () =>  Notification()),


  ];
}
