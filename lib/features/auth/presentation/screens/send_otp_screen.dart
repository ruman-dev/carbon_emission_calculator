import 'package:carbon_emission_calculator/core/global_widget/custom_button.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_richtext.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_textfield.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/features/auth/controller/send_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helpers/validation.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});

  final SendOtpController _controller = Get.find<SendOtpController>();
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
                  CustomTextPoppins(text: 'Send OTP', fontSize: 30.sp, fontWeight: FontWeight.w500),
                  CustomTextInter(
                    text: 'Recover your account in easy steps',
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
                    validationText: 'Email can\'t be empty',
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  CustomButton(
                    text: 'Send OTP',
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Get.toNamed(Routes.verifyOtpScreen);
                        _controller.emailController.clear();
                      }
                    },
                  ),
                  SizedBox(height: screenWidth * 1.08),
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
