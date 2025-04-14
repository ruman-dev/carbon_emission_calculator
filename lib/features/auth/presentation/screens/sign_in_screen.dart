import 'package:carbon_emission_calculator/core/global_widget/custom_button.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_richtext.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_textfield.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/core/utils/helpers/validation.dart';
import 'package:carbon_emission_calculator/features/auth/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets/asset_path.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SignInController _controller = Get.find<SignInController>();
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(33),
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPoppins(text: 'Sign In', fontSize: 30.sp, fontWeight: FontWeight.w500),
                  CustomTextInter(
                    text: 'Let’s save environment together',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenWidth * 0.27),
                  CustomTextInter(text: 'Email', fontSize: 12.sp, fontWeight: FontWeight.w500),
                  CustomTextfield(
                    hintText: 'user@example.com',
                    controller: _controller.emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => Validation.validateEmail(value),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CustomTextInter(text: 'Password', fontSize: 12.sp, fontWeight: FontWeight.w500),
                  Obx(
                    () => CustomTextfield(
                      hintText: '**********',
                      validator: (value) => Validation.validatePassword(value),
                      isObsecure: _controller.isObscure.value,
                      suffixImage: AssetPath.toggleIcon,
                      onSuffixTap: () {
                        _controller.togglePasswordVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: _controller.switchRememberMe.value,
                              activeColor: AppColors.primaryColor,
                              autofocus: true,
                              onChanged: (value) {
                                _controller.switchRememberMe.value = value!;
                              },
                            ),
                          ),
                          CustomTextInter(text: 'Remember Me', fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.sendOtpScreen);
                          _controller.emailController.clear();
                          _controller.passwordController.clear();
                        },
                        child: CustomTextInter(
                          text: 'Forgotten Password',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Get.offAllNamed(Routes.homeScreen);
                      }
                    },
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  Center(
                    child: CustomTextInter(
                      text: 'Or Sign In with',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.075),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AssetPath.googleIcon, width: 26.w),
                        Image.asset(AssetPath.facebookIcon, width: 26.w),
                        Image.asset(AssetPath.microsoftIcon, width: 26.w),
                        Image.asset(AssetPath.appleIcon, width: 26.w),
                      ],
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.09),
                  Center(
                    child: CustomRichtext(
                      primaryText: 'Don’t have an account? ',
                      secondaryText: 'Sign Up',
                      onSecPressed: () {
                        Get.toNamed(Routes.signupScreen);
                        _controller.emailController.clear();
                        _controller.passwordController.clear();
                      },
                      primeFontSize: 12.sp,
                      primeFontWeight: FontWeight.w400,
                      primeTextColor: AppColors.grey,
                      secTextColor: AppColors.primaryColor,
                      secFontSize: 14.sp,
                      secFontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.3),
                  Center(
                    child: CustomRichtext(
                      primaryText: 'Powered By ',
                      secondaryText: 'M360 ICT',
                      primeFontSize: 12.sp,
                      primeFontWeight: FontWeight.w400,
                      primeTextColor: AppColors.grey,
                      secFontSize: 14.sp,
                      secFontWeight: FontWeight.w700,
                      secTextColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
