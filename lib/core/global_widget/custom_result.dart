import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResult extends StatelessWidget {
  const CustomResult({super.key, required this.rate, required this.percentage});

  final String rate;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextPoppins(
          text: rate,
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
                  CustomTextPoppins(text: '$percentage%', color: Colors.white),
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
    );
  }
}
