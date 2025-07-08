import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class CustomTextFields extends StatelessWidget {
  final String title;
  final String hintText;

  const CustomTextFields({
    super.key,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.bodyMM,
        ),
        TextField(
          cursorColor: AppColors.stroke,
          style: AppStyles.bodyMM,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyles.textFieldHintTextStyle,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.stroke,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
