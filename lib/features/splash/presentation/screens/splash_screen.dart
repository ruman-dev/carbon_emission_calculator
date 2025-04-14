import 'package:carbon_emission_calculator/core/global_widget/custom_richtext.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:carbon_emission_calculator/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(child: Image.asset(AssetPath.appLogo, height: 214.h, width: 214.w)),
          Positioned(
            left: screenWidth * 0.35,
            bottom: screenWidth * 0.1,
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
    );
  }
}
