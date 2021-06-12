import 'package:flutter/widgets.dart';
import 'package:qatar2022/screens/complete_profile/complete_profile_screen.dart';
import 'package:qatar2022/screens/fans/fans_screen.dart';
import 'package:qatar2022/screens/forgot_password/forgot_password_screen.dart';
import 'package:qatar2022/screens/home/home_screen.dart';
import 'package:qatar2022/screens/login_success/login_success_screen.dart';
import 'package:qatar2022/screens/otp/otp_screen.dart';
import 'package:qatar2022/screens/profile/profile_screen.dart';
import 'package:qatar2022/screens/programme/programme_screen.dart';
import 'package:qatar2022/screens/sccore/sccore_screen.dart';
import 'package:qatar2022/screens/sign_in/sign_in_screen.dart';
import 'package:qatar2022/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProgrammeScreen.routeName: (context) => ProgrammeScreen(),
  SccoreScreen.routeName: (context) => SccoreScreen(),
  FansScreen.routeName: (context) => FansScreen(),
};
