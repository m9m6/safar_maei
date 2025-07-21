import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';

class TypeOfRideButton extends StatelessWidget {
  final double containerSize;
  final VoidCallback onTap;
  final String imagePath;
  final String text;

  const TypeOfRideButton({
    super.key,
    required this.containerSize,
    required this.onTap,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerSize.w,
        height: containerSize.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height:32.h,
              width: 32.w,
            ),
            Text(
              text,
              style: AppStyles.rideButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}