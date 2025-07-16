import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/welcome_screen/welcome_custom_button.dart';
import 'package:safar_maei/utils/app_assets.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';

import '../login/login_screen/login_screen.dart';
import '../login/register_as_driver/register_driver.dart';
import '../login/register_as_passenger/register_passenger.dart';
import 'bottom_text_button_row.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = 'WelcomeScreen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Container(
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome text
              Text(
                'Welcome to',
                style: AppStyles.myFont.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              // App name
              Text('safar maei', style: AppStyles.title),

              // description
              Text(
                  'join us as a user or a driver and enjoy seamless trips, smart tracking, and full control at your fingertips',
                  style: AppStyles.bodySmallRegular),

              SizedBox(height: 90.h), // Spacer

              // Start Text
              Text(
                'Let’s Get Started...',
                style: AppStyles.myFont.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: 16.h),

              // Register as driver button
              WelcomeCustomButton(
                  text: 'Register as a driver',
                  iconPath: AppAssets.iconRegisterDriver,
                  onTap: () {
                    Navigator.of(context).pushNamed(RegisterDriver.routeName);
                  }),

              SizedBox(height: 12.h),

              // Register as passenger button
              WelcomeCustomButton(
                  text: 'Register as a passenger',
                  iconPath: AppAssets.iconRegisterPassenger,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RegisterPassenger.routeName);
                  }),

              SizedBox(height: 40.h),

              // Login row
              BottomTextButtonRow(
                textBefore: 'Already have an account?',
                buttonText: 'Login',
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
