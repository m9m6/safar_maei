import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  final double height;
  final Widget child;
  final Color? backgroundColor;
  final double borderRadius;
  final bool showDragHandle;
  final Color dragHandleColor;

  const CustomBottomSheet({
    super.key,
    required this.height,
    required this.child,
    this.backgroundColor,
    this.borderRadius = 30,
    this.showDragHandle = true,
    this.dragHandleColor = AppColors.blackGray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 15),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.background, //main color of it
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 16,
            spreadRadius: -3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showDragHandle)
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: dragHandleColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          if (showDragHandle) SizedBox(height: 12.h),
          Expanded(child: SingleChildScrollView(child: child)),
        ],
      ),
    );
  }
}