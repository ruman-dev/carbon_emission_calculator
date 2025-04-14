import 'package:carbon_emission_calculator/core/global_widget/custom_richtext_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global_widget/custom_richtext_inter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenWidth * 0.5,
              decoration: ShapeDecoration(
                color: const Color(0x1947BA80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextPoppins(
                                text: 'Good Morning',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.darkGrey,
                              ),
                              CustomTextPoppins(
                                text: 'Ahmed Ariyan',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1E1E1E),
                              ),
                            ],
                          ),
                        ),

                        CircleAvatar(backgroundImage: AssetImage(AssetPath.profileImage), radius: 45),
                      ],
                    ),
                    CustomRichtextPoppins(
                      primaryText: 'You are in a ',
                      secondaryText: 'healthy',
                      tertiaryText: ' environment',
                      primeFontSize: 14.sp,
                      tertFontSize: 14.sp,
                      secFontSize: 14.sp,
                      primeFontWeight: FontWeight.w300,
                      tertFontWeight: FontWeight.w300,
                      secFontWeight: FontWeight.w700,
                      primeTextColor: AppColors.darkGrey,
                      tertTextColor: AppColors.darkGrey,
                      secTextColor: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextPoppins(
                      text: 'My Places',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.1),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextPoppins(
                              text: 'Home',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                gradient: LinearGradient(
                                  colors: [Color(0xFF42D58B), Color(0x7F65D39C), Color(0x7F47BA80), Color(0xFF2DF18E)],
                                ),
                              ),
                              child: CustomTextInter(text: 'Good', color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomTextPoppins(
                              text: '652',
                              color: AppColors.primaryColor,
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(width: 5),
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.r),
                                      CustomTextPoppins(text: '13%', color: Colors.white),
                                    ],
                                  ),
                                ),
                                CustomTextPoppins(
                                  text: 'ppm',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
