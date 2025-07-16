import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';


class BottomTextButtonRow extends StatelessWidget {
  final String textBefore;
  final String buttonText;
  final VoidCallback onPressed;

  const BottomTextButtonRow({
    super.key,
    required this.textBefore,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textBefore,
          style: AppStyles.welcomeButtonText2,
        ),
        SizedBox(width: 8.w),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.noColor,
            overlayColor: AppColors.noColor,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
          ),
          child: Text(
            buttonText,
            style: AppStyles.myFont.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
