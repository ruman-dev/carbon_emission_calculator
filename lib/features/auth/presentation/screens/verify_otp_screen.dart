import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/features/auth/controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/global_widget/custom_button.dart';
import '../../../../core/global_widget/custom_richtext.dart';
import '../../../../core/global_widget/custom_text_inter.dart';
import '../../../../core/global_widget/custom_text_poppins.dart';
import '../../../../core/resources/app_colors/app_colors.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});

  final _globalKey = GlobalKey<FormState>();
  final VerifyOtpController _controller = Get.find<VerifyOtpController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: Colors.black),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200),
    );
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
                  CustomTextPoppins(text: 'Verify OTP', fontSize: 30.sp, fontWeight: FontWeight.w500),
                  CustomTextInter(
                    text: 'Recover your account in easy steps',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: screenWidth * 0.27),
                  CustomRichtext(
                    primaryText: 'An email has been sent to ',
                    secondaryText: 'user@example.com',
                    primeFontSize: 14.sp,
                    primeFontWeight: FontWeight.w400,
                    primeTextColor: AppColors.grey,
                    secFontSize: 14.sp,
                    secFontWeight: FontWeight.w700,
                    secTextColor: Colors.black,
                  ),
                  CustomTextInter(
                    text: 'Please enter the sent OTP.',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  SizedBox(height: screenWidth * 0.08),
                  Center(
                    child: Pinput(
                      controller: _controller.otpPinController,
                      length: 4,
                      autofocus: true,
                      enableSuggestions: true,
                      separatorBuilder: (index) => SizedBox(width: screenWidth * 0.05),
                      keyboardType: TextInputType.number,
                      defaultPinTheme: defaultPinTheme.copyWith(
                        textStyle: GoogleFonts.inter(
                          fontSize: 24.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.w),
                          border: Border.all(color: const Color(0xFFE3E3E9), width: 1),
                        ),
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        textStyle: GoogleFonts.inter(
                          fontSize: 24.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.w),
                          border: Border.all(color: AppColors.primaryColor, width: 1),
                        ),
                      ),
                      showCursor: true,
                      onCompleted: (pin) {
                        debugPrint('Entered OTP: $pin');
                      },
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.085),
                  CustomButton(
                    text: 'Verify OTP',
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Get.offAllNamed(Routes.resetPassScreen);
                        _controller.otpPinController.clear();
                      }
                    },
                  ),
                  SizedBox(height: screenWidth * 0.08),
                  Center(
                    child: CustomRichtext(
                      primaryText: 'Didn’t Receive a code? ',
                      secondaryText: 'Resend',
                      primeFontSize: 12.sp,
                      primeFontWeight: FontWeight.w400,
                      primeTextColor: AppColors.grey,
                      secFontSize: 14.sp,
                      secFontWeight: FontWeight.w700,
                      secTextColor: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.8),
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
