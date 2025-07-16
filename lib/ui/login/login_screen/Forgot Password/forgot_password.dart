import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../home/test_test.dart';
import '../../../primary_colored_button.dart';
import '../custom_text_fields.dart';
import '../custom_password_field.dart'; // ← تأكدي من المسار

enum ResetStage {
  email,
  verification,
  newPassword,
}

class ForgotPassword extends StatefulWidget {
  static String routeName = 'ForgotPassword';
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ResetStage currentStage = ResetStage.email;

  // controller for the rest password stage
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title = '';
    String hint = '';
    String label = '';
    String buttonText = '';

    switch (currentStage) {
      case ResetStage.email:
        label = 'Email';
        hint = 'Enter Your Email';
        title = 'Forgot Password?';
        buttonText = 'Next';
        break;
      case ResetStage.verification:
        label = 'Verification Code';
        hint = 'EX: 123456';
        title = 'Forgot Password?';
        buttonText = 'Submit';
        break;
      case ResetStage.newPassword:
        label = 'New Password';
        hint = 'Enter New Password';
        title = 'Forgot Password?';
        buttonText = 'Confirm';
        break;
    }

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
            Text(title, style: AppStyles.title),

            // Subtitle
            Text(
              _getSubtitle(),
              style: AppStyles.bodySmallRegular,
            ),

            SizedBox(height: 80.h),

            // last stage field( using password widget)
            currentStage == ResetStage.newPassword
                ? CustomPasswordField(
              title: label,
              hintText: hint,
              controller: passwordController,
            )
                : CustomTextFields(
              title: label,
              hintText: hint,
            ),

            SizedBox(height: 24.h),

            // Button
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
                    setState(() {
                      if (currentStage == ResetStage.email) {
                        currentStage = ResetStage.verification;
                      } else if (currentStage == ResetStage.verification) {
                        currentStage = ResetStage.newPassword;
                      } else if (currentStage == ResetStage.newPassword) {
                        //todo: navigation after setting up new pass
                        Navigator.of(context).pushNamed(TestTest.routeName);
                      }
                    });
                  },
                  child: Text(
                    buttonText,
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

  String _getSubtitle() {
    switch (currentStage) {
      case ResetStage.email:
        return 'Recover your password if you\nhave forgot the password';
      case ResetStage.verification:
        return 'We have sent a message to your\nemail account with a verification\ncode!';
      case ResetStage.newPassword:
        return 'Set your new password to login\ninto your account';
    }
  }
}
