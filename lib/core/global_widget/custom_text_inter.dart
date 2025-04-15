import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextInter extends StatelessWidget {
  const CustomTextInter({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines ?? 2,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? const Color(0xFF000000),
      ),
    );
  }
}
