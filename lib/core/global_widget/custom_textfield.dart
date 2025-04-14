import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/app_colors/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.onTap,
    this.hintText,
    this.isReadOnly,
    this.trailingIcon,
    this.validator,
    this.suffixImage,
    this.validationText,
    this.textInputType,
    this.isObsecure,
    this.onSuffixTap,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final String? hintText;
  final bool? isReadOnly;
  final Widget? trailingIcon;
  final String? suffixImage;
  final String? validationText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isObsecure;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: isReadOnly ?? false,
      cursorColor: AppColors.primaryColor,
      keyboardType: textInputType ?? TextInputType.text,
      validator:
          validator ??
          (value) {
            if (value!.isEmpty) {
              return validationText ?? 'This field is required';
            }
            return null;
          },
      onTap: onTap,
      obscureText: isObsecure ?? false,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        // contentPadding: EdgeInsets.only(left: 0),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: const Color.fromARGB(255, 144, 14, 5), width: 1.w),
        //   borderRadius: BorderRadius.circular(12.r),
        // ),
        fillColor: Colors.white,
        hintText: hintText ?? 'Enter the text',
        hintStyle: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.lightGrey),
        suffixIcon:
            suffixImage != null
                ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Image.asset(suffixImage!, width: 24.w, height: 24.h, color: Color(0xFF7F7F8A)),
                  ),
                )
                : trailingIcon,
      ),
    );
  }
}
