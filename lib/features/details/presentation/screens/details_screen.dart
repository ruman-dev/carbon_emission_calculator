import 'package:carbon_emission_calculator/core/global_widget/custom_result.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_status_text.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/app_colors/app_colors.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:carbon_emission_calculator/features/details/presentation/widgets/custom_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    this.status,
    this.airRate,
    this.percentage,
    required this.images,
  });

  final String? status;
  final String? airRate;
  final String? percentage;
  final List<String> images;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      Image.asset(
                        AssetPath.homeIcon,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 10),
                      CustomTextPoppins(
                        text: 'Home',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  CustomStatusText(status: status),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomResult(
                          rate: airRate ?? '0',
                          percentage: percentage ?? '0',
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.05),

                    /// History Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextInter(
                          text: 'History',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFADADAD),
                        ),

                        Row(
                          children: [
                            CustomTextInter(
                              text: 'See All',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFADADAD),
                            ),
                            SizedBox(width: 3),
                            Image.asset(
                              AssetPath.arrowRightIcon,
                              width: 8,
                              color: Color(0xFFADADAD),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    CustomChart(),
                    SizedBox(height: screenWidth * 0.1),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextInter(
                                text: 'Person',
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4D4D4D),
                              ),
                              SizedBox(height: screenWidth * 0.03),
                              SizedBox(
                                width: screenWidth * 0.5,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: CircleAvatar(
                                        radius: 17,
                                        backgroundColor: Color(0xFFD9D9D9),
                                        backgroundImage: NetworkImage(
                                          images[0],
                                        ),
                                      ),
                                    ),

                                    for (int i = 1; i < images.length; i++)
                                      avatarImages(images[i], i * 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                colors: [Color(0xFF6ABC93), Color(0xFFA1FFD0)],
                              ),
                            ),
                            child: Column(
                              children: [
                                CustomTextInter(
                                  text: 'Rooms',
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                CustomTextInter(
                                  text: '5',
                                  color: Colors.white,
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: CustomTextInter(
                                    text: '2 of them requires action',
                                    color: AppColors.primaryColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.09),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextInter(
                                text: 'Plants',
                                color: AppColors.primaryColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: screenWidth * 0.03),
                              Image.network(
                                AssetPath.plantImgLink,
                                width: screenWidth * 0.2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                colors: [Color(0xFF6ABC93), Color(0xFFA1FFD0)],
                              ),
                            ),
                            child: CustomTextInter(
                              text: '43',
                              fontSize: 80.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget avatarImages(String imagePath, double imagePosition) {
  return Positioned(
    left: imagePosition,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: CircleAvatar(radius: 17, backgroundImage: NetworkImage(imagePath)),
    ),
  );
}
