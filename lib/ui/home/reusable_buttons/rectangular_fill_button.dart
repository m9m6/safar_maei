import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class RectangularFillButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const RectangularFillButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: SizedBox(
        width: width ?? 335.w,
        height: height ?? 48.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primaryColor,
            foregroundColor: backgroundColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
              side: BorderSide(
                color: borderColor ?? AppColors.primaryColor,
                width: 1.w,
              ),
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.tajawal(
                fontSize: fontSize ?? 18.sp,
                color: textColor ?? AppColors.white,
                fontWeight: fontWeight ?? FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}