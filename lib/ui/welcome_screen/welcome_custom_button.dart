import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class WelcomeCustomButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  const WelcomeCustomButton({super.key, required this.text, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 59.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          // shadowColor: AppColors.blackGray,
          // elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: AppColors.stroke, width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath),
            SizedBox(width: 8.w),
            Text(
              text,
              style: AppStyles.myFont.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
