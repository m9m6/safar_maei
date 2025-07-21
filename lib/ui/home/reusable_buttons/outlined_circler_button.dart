import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class OutlinedCircularButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final Widget child;
  final bool isCentered;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double? childSize;

  const OutlinedCircularButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.child,
    this.isCentered = true,
    this.backgroundColor = AppColors.background,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = 1.0,
    this.childSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = (width < height ? width : height) / 2;

    return InkWell(
      borderRadius: BorderRadius.circular(radius.r),
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
            width: borderWidth.w,
            color: borderColor,
          ),
        ),
        child: _buildChildContent(radius),
      ),
    );
  }

  Widget _buildChildContent(double radius) {
    if (isCentered) {
      return Center(
        child: SizedBox(
          width: childSize?.w,
          height: childSize?.h,
          child: child,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius.r),
        child: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.contain,
            child: child,
          ),
        ),
      );
    }
  }
}