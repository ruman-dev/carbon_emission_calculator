import 'package:carbon_emission_calculator/core/global_widget/custom_button.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_richtext_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_textfield.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/core/utils/helpers/validation.dart';
import 'package:carbon_emission_calculator/core/utils/services/notification_services.dart';
import 'package:carbon_emission_calculator/features/auth/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/global_widget/custom_richtext_inter.dart';
import '../../../../core/resources/assets/asset_path.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController _controller =
      Get.find<ResetPasswordController>();
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
                  CustomTextPoppins(
                    text: 'Reset Password',
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextInter(
                    text: 'Let’s save environment together',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenWidth * 0.27),
                  CustomTextInter(
                    text: 'New Password',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: '**********',
                      validationText: 'Password can\'t be empty',
                      isObsecure: _controller.isNewPassHide.value,
                      validator: (value) => Validation.validatePassword(value),
                      controller: _controller.newPassController,
                      suffixImage: AssetPath.toggleIcon,
                      onSuffixTap: () {
                        _controller.toggleNewPassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.05),
                  CustomTextInter(
                    text: 'Confirm Password',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: '**********',
                      isObsecure: _controller.isConfirmPassHide.value,
                      validator: (value) => Validation.validatePassword(value),
                      controller: _controller.confirmPassController,
                      suffixImage: AssetPath.toggleIcon,
                      onSuffixTap: () {
                        _controller.toggleConfirmPassVisibility();
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  CustomButton(
                    text: 'Reset Password',
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        if (_controller.newPassController.text.trim() ==
                            _controller.confirmPassController.text.trim()) {
                          NotificationService.notificationMessage(
                            'Success',
                            'Reset Password Successful!',
                          );
                          Get.offAllNamed(Routes.signInScreen);
                          _controller.newPassController.clear();
                          _controller.confirmPassController.clear();
                        } else {
                          NotificationService.notificationMessage(
                            'Error',
                            'Both Password should be same!',
                            Colors.red,
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: screenWidth * 0.85),
                  Center(
                    child: CustomRichtextInter(
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
