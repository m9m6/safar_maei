import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';

class LocationField extends StatelessWidget {
  final String hintText;
  final String? prefixIconPath;
  final Widget? prefixWidget;
  final TextEditingController? controller;
  final double? height;
  final double iconSize;

  const LocationField({
    super.key,
    required this.hintText,
    this.prefixIconPath,
    this.prefixWidget,
    this.controller,
    this.height,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: AppStyles.bodyMM.copyWith(color: const Color(0xff6c6e7c)),
          prefixIcon: _buildPrefixIcon(),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          isDense: true,
        ),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (prefixWidget != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: prefixWidget,
      );
    } else if (prefixIconPath != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Image.asset(
          prefixIconPath!,
          width: iconSize.r,
          height: iconSize.r,
          color: Colors.black,
        ),
      );
    }
    return null;
  }
}