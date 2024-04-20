import 'package:flutter/material.dart';
import 'package:qr_care/features/forgetPassword/presentation/screens/change_password.dart';
import 'package:qr_care/features/forgetPassword/presentation/screens/forget_password.dart';
import 'package:qr_care/features/forgetPassword/presentation/screens/verification_screen.dart';
import 'package:qr_care/features/home/features/chaildern/presentation/screens/add_child_screen.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/ChildInfo.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/Edit.dart';
import 'package:qr_care/features/home/features/pofile/presentation/screens/MyAccount.dart';
import 'package:qr_care/features/home/features/pofile/profile_screen.dart';
import 'package:qr_care/features/home/layout_screen.dart';
import 'package:qr_care/features/login/presentation/screens/login_screen.dart';
import 'package:qr_care/features/notification/notifications_screen.dart';
import 'package:qr_care/features/onboarding/onbordingScreen.dart';

import 'package:qr_care/features/register/presentation/screens/Screen1.dart';
import 'package:qr_care/features/register/presentation/screens/Screen2.dart';
import 'package:qr_care/features/register/presentation/screens/Screen3.dart';
import 'package:qr_care/features/register/presentation/screens/Screen4.dart';
import 'package:qr_care/features/register/presentation/screens/Screen5.dart';
import 'package:qr_care/features/register/presentation/screens/Screen6.dart';
import 'package:qr_care/features/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';

  static const String registerRoute1 = '/register1';
  static const String registerRoute2 = '/register2';
  static const String registerRoute3 = '/register3';
  static const String registerRoute4 = '/register4';
  static const String registerRoute5 = '/register5';
  static const String registerRoute6 = '/register6';
  static const String profileRoute = '/profile';
  static const String editProfileRoute = '/editProfile';
  static const String changePasswordRoute = '/changePassword';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String resetPasswordRoute = '/resetPassword';
  static const String myAccountRoute = '/myAccount';
  static const String appSettingRoute = '/appSetting';
  static const String notificationRoute = '/notification';

  static const String helpRoute = '/help';
  static const String aboutRoute = '/about';
  static const String childernInfoRoute = '/childernInfo';
  static const String addChildRoute = '/addChild';
  static const String homeScreenRoute = '/home';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplahScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: (context) => const OnBoradingScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case Routes.changePasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (context) => VerificationScreen());

      case Routes.registerRoute1:
        return MaterialPageRoute(builder: (context) => Screen1());
      case Routes.registerRoute2:
        return MaterialPageRoute(builder: (context) => Screen2());
      case Routes.registerRoute3:
        return MaterialPageRoute(builder: (context) => Screen3());

      case Routes.registerRoute4:
        return MaterialPageRoute(builder: (context) => Screen4());
      case Routes.registerRoute5:
        return MaterialPageRoute(builder: (context) => Screen5());
      case Routes.registerRoute6:
        return MaterialPageRoute(builder: (context) => Screen6());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => LayoutScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.myAccountRoute:
        return MaterialPageRoute(builder: (context) => const MyAccount());
      case Routes.editProfileRoute:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      case Routes.childernInfoRoute:
        return MaterialPageRoute(builder: (context) => const ChildrenInfo());
      case Routes.addChildRoute:
        return MaterialPageRoute(builder: (context) => AddChildScreen());
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (context) => NotificationsPage());
      default:
        return undefindRoutes();
    }
  }

  static Route? undefindRoutes() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              backgroundColor: Colors.white,
              body: Text('Routes is not available'),
            ));
  }
}
