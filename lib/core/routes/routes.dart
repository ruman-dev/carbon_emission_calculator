import 'package:carbon_emission_calculator/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:carbon_emission_calculator/features/auth/presentation/screens/send_otp_screen.dart';
import 'package:carbon_emission_calculator/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:carbon_emission_calculator/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static String splashScreen = "/splashScreen";
  static String signInScreen = "/signInScreen";
  static String sendOtpScreen = "/sendOtpScreen";
  static String verifyOtpScreen = "/verifyOtpScreen";
  static String resetPassScreen = "/resetPassScreen";
  static String signupScreen = "/signupScreen";
  static String homeScreen = "/homeScreen";

  static List<GetPage> route = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: sendOtpScreen, page: () => SendOtpScreen()),
    GetPage(name: verifyOtpScreen, page: () => VerifyOtpScreen()),
    GetPage(name: resetPassScreen, page: () => ResetPasswordScreen()),
    GetPage(name: signupScreen, page: () => SignUpScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}
