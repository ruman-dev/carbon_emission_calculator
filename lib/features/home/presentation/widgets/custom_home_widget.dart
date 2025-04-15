import 'package:carbon_emission_calculator/core/global_widget/custom_result.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_status_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global_widget/custom_text_poppins.dart';
import '../../../../core/resources/app_colors/app_colors.dart';
import '../../../../core/resources/assets/asset_path.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({
    super.key,
    required this.homeImages,
    required this.onTap,
  });

  final List<String> homeImages;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPoppins(
                  text: 'Office',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                CustomStatusText(status: 'Good'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CustomResult(rate: '652', percentage: '13')),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage: NetworkImage(homeImages[0]),
                          // ),
                        ),
                      ),

                      for (int i = 1; i < homeImages.length; i++)
                        avatarImages(homeImages[i], i * 20),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextPoppins(
                  text: 'View Details',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width: 5),
                Image.asset(AssetPath.arrowRightIcon, width: 7.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget avatarImages(String imagePath, double imagePosition) {
  return Positioned(
    right: imagePosition,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: CircleAvatar(radius: 17, backgroundImage: NetworkImage(imagePath)),
    ),
  );
}
