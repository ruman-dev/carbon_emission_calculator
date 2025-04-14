import 'package:carbon_emission_calculator/core/global_widget/custom_button.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_richtext.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_textfield.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/core/utils/helpers/validation.dart';
import 'package:carbon_emission_calculator/core/utils/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets/asset_path.dart';
import '../../controller/sign_up_controller.dart';
import '../../services/auth_services.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController _controller = Get.find<SignUpController>();
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
                  CustomTextPoppins(text: 'Sign Up', fontSize: 30.sp, fontWeight: FontWeight.w500),
                  CustomTextInter(
                    text: 'Let’s save environment together',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenWidth * 0.1),
                  CustomTextInter(text: 'Name', fontSize: 12.sp, fontWeight: FontWeight.w500),
                  CustomTextfield(
                    hintText: 'e.g: Ahmed Ariyan',
                    controller: _controller.nameController,
                    textInputType: TextInputType.name,
                    validationText: 'Name can\'t be empty',
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CustomTextInter(text: 'Phone Number', fontSize: 12.sp, fontWeight: FontWeight.w500),
                  CustomTextfield(
                    hintText: '17XXXXXXXX',
                    controller: _controller.phoneController,
                    textInputType: TextInputType.phone,
                    validator: (value) => Validation.validatePhone(value),
                  ),
                  SizedBox(height: screenWidth * 0.05),
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
                      controller: _controller.passwordController,
                      isObsecure: _controller.isPassHide.value,
                      suffixImage: AssetPath.toggleIcon,
                      onSuffixTap: () {
                        _controller.togglePassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CustomTextInter(text: 'Confirm Password', fontSize: 12.sp, fontWeight: FontWeight.w500),
                  Obx(
                    () => CustomTextfield(
                      hintText: '**********',
                      validator: (value) => Validation.validatePassword(value),
                      controller: _controller.confirmPassController,
                      isObsecure: _controller.isConfirmPassHide.value,
                      suffixImage: AssetPath.toggleIcon,
                      onSuffixTap: () {
                        _controller.toggleConfirmPassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        if (_controller.passwordController.text.trim() ==
                            _controller.confirmPassController.text.trim()) {
                          _controller.isLoading.value = true;

                          final message = await _controller.userRegistrationProcess(
                            email: _controller.emailController.text.trim(),
                            password: _controller.passwordController.text.trim(),
                          );

                          if (message!.contains('Success')) {

                            NotificationService.notificationMessage('Success', 'Signed Up Successfully!');
                            Get.offAllNamed(Routes.signInScreen);

                            _controller.nameController.clear();
                            _controller.phoneController.clear();
                            _controller.emailController.clear();
                            _controller.passwordController.clear();
                            _controller.confirmPassController.clear();
                          } else {
                            NotificationService.notificationMessage('Error', message, Colors.red);
                          }
                        } else {
                          NotificationService.notificationMessage('Error', 'Both Password should be same!', Colors.red);
                        }
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
                  SizedBox(height: screenWidth * 0.04),
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
                      primaryText: 'Already have an account? ',
                      secondaryText: 'Sign In',
                      primeFontSize: 12.sp,
                      onSecPressed: () {
                        Get.offAllNamed(Routes.signInScreen);
                        _controller.nameController.clear();
                        _controller.phoneController.clear();
                        _controller.emailController.clear();
                        _controller.passwordController.clear();
                        _controller.confirmPassController.clear();
                      },
                      primeFontWeight: FontWeight.w400,
                      primeTextColor: AppColors.grey,
                      secTextColor: AppColors.primaryColor,
                      secFontSize: 14.sp,
                      secFontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.06),
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
