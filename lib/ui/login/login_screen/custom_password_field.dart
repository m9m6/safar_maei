import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class CustomPasswordField extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.bodyMM,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          validator: widget.validator,
          cursorColor: AppColors.stroke,
          style: AppStyles.bodyMM,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: AppStyles.textFieldHintTextStyle,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            isDense: true,
            filled: true,
            fillColor: AppColors.white,

            // Show/Hide Password Icon
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.black,
                size: 18.w,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),

            // Error Style
            errorStyle: TextStyle(
              color: AppColors.errorColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),

            // Enabled border
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.stroke,
                width: 1.w,
              ),
            ),

            // Focused border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.w,
              ),
            ),

            // Error border
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: 1.w,
              ),
            ),

            // Focused error border
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
