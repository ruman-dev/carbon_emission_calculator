import 'package:carbon_emission_calculator/core/global_widget/custom_richtext_poppins.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:carbon_emission_calculator/core/routes/routes.dart';
import 'package:carbon_emission_calculator/features/details/presentation/screens/details_screen.dart';
import 'package:carbon_emission_calculator/features/home/controller/home_controller.dart';
import 'package:carbon_emission_calculator/features/home/presentation/widgets/custom_home_widget.dart';
import 'package:carbon_emission_calculator/features/home/presentation/widgets/custom_office_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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

                          CircleAvatar(
                            backgroundImage: AssetImage(AssetPath.profileImage),
                            radius: 45,
                          ),
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
                    CustomHomeWidget(
                      homeImages: _controller.homeImages,
                      onTap: () {
                        Get.to(
                          () => DetailsScreen(
                            status: 'Good',
                            airRate: '652',
                            percentage: '13',
                            images: _controller.homeImages,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    CustomOfficeWidget(
                      officeImages: _controller.officeImages,
                      onTap: () {
                        Get.to(
                          () => DetailsScreen(
                            status: 'Healthy',
                            airRate: '447',
                            percentage: '37',
                            images: _controller.officeImages,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addScreen);
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
