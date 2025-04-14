import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.borderRadius,
    this.textColor,
    this.fontWeight,
    this.height,
    this.fontSize,
    this.borderSide,
  });

  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      // height: height ?? ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: height?.h ?? 10.h),
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide(color: Colors.transparent, width: 0),
            borderRadius: borderRadius ?? BorderRadius.circular(50.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 16.sp,
            fontWeight: fontWeight ?? FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
