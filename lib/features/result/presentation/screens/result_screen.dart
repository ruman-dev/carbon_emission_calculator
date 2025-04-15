import 'package:carbon_emission_calculator/core/global_widget/custom_richtext_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/global_widget/custom_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.025,
            vertical: screenWidth * 0.02,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    CustomTextPoppins(
                      text: '1300',
                      color: AppColors.dangerColor,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    CustomTextPoppins(
                      text: 'ppm',
                      color: AppColors.dangerColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    CustomRichtextPoppins(
                      primaryText: 'Very Unhealthy: ',
                      secondaryText:
                          'Your office is emitting a lot of Carbon Dioxide',
                      primeTextColor: AppColors.dangerColor,
                      primeFontSize: 16.sp,
                      primeFontWeight: FontWeight.w700,
                      secTextColor: Color(0xFF838383),
                      secFontWeight: FontWeight.w300,
                      secFontSize: 16.sp,
                    ),
                    SizedBox(height: 35),
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xFFD2FFE8),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xFFD2FFE8),
                                backgroundImage: NetworkImage(
                                  AssetPath.plantImgLink,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomTextPoppins(
                              text: 'Plant',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                            CustomTextPoppins(
                              text: '189 indoor plants',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            SizedBox(height: 15),
                            CustomTextPoppins(
                              text:
                                  'Your office emits 2549ppm Carbon dioxide everyday',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF797979),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextPoppins(
                                  text: 'Planted',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                CustomTextPoppins(
                                  text: '23/189',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF797979),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            LinearPercentIndicator(
                              width: screenWidth * 0.75,
                              lineHeight: 14.0,
                              percent: 0.7,
                              barRadius: Radius.circular(12),
                              backgroundColor: Color(0xFFF2F2F2),
                              linearGradient: LinearGradient(
                                colors: [Color(0xFF47BA80), Color(0xFF2DF28F)],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenWidth * 0.05,
                ),
                child: CustomButton(
                  text: 'Done',
                  onPressed: () {
                    Get.offAllNamed(Routes.homeScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
