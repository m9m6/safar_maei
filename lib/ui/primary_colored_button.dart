import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class PrimaryColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryColoredButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        width: 335.w,
        height: 48.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
          style: AppStyles.bodyMM.copyWith(
          fontSize: 18.sp,
          color: AppColors.white,
          ),
        ),
      ),
    ),);
  }
}
