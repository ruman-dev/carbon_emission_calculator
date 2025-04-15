import 'package:carbon_emission_calculator/features/auth/controller/reset_password_controller.dart';
import 'package:carbon_emission_calculator/features/auth/controller/send_otp_controller.dart';
import 'package:carbon_emission_calculator/features/auth/controller/sign_in_controller.dart';
import 'package:carbon_emission_calculator/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../features/add/controller/add_controller.dart';
import '../../features/auth/controller/sign_up_controller.dart';
import '../../features/auth/controller/verify_otp_controller.dart';
import '../../features/splash/controller/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(SendOtpController());
    Get.put(ResetPasswordController());
    Get.put(VerifyOtpController());
    Get.put(HomeController());
    Get.put(AddController());
  }
}
