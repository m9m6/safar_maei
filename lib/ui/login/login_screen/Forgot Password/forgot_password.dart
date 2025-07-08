import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../custom_text_fields.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = 'ForgotPassword';
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.noColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 42.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 40.w,
              height: 40.h,
              child: Image.asset(AppAssets.iconBackArrow),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            // Title
            Text('Forgot Password?', style: AppStyles.title),

            // Subtitle
            Text(
              'Recover you password if you\nhave forgot the password',
              style: AppStyles.bodySmallRegular,
            ),

            SizedBox(height: 80.h),

            // Email Field
            CustomTextFields(
              title: 'Email',
              hintText: 'Enter Your Email',
            ),

            SizedBox(height: 24.h),

            // Login Button
            SizedBox(
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
                  onPressed: () {
                    //todo: User go to code validation
                  },
                  child: Text(
                    "Next",
                    style: AppStyles.bodyMM.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
