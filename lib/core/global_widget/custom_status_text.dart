import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStatusText extends StatelessWidget {
  const CustomStatusText({super.key, this.status});

  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            Color(0xFF42D58B),
            Color(0x7F65D39C),
            Color(0x7F47BA80),
            Color(0xFF2DF18E),
          ],
        ),
      ),
      child: CustomTextInter(text: status ?? '', color: Colors.white),
    );
  }
}
