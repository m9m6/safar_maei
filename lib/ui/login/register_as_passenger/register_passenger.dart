import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/login/register_as_passenger/verify/verify_screen.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../login_screen/custom_password_field.dart';
import '../login_screen/custom_text_fields.dart';
import '../login_screen/google_button.dart';
import '../login_screen/login_screen.dart';

class RegisterPassenger extends StatefulWidget {
  static String routeName = 'RegisterPassenger';
  const RegisterPassenger({super.key});

  @override
  State<RegisterPassenger> createState() => _RegisterPassengerState();
}

class _RegisterPassengerState extends State<RegisterPassenger> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 40.h),

              // Title
              Text('Register', style: AppStyles.title),

              // Subtitle
              Text(
                'Register now and order your trips\neasily with the Safar Maei app',
                style: AppStyles.bodySmallRegular,
              ),

              SizedBox(height: 80.h),

              // Email Field
              CustomTextFields(
                title: 'Your Name',
                hintText: 'Enter Your Name',
              ),

              SizedBox(height: 16.h),

              CustomTextFields(
                title: 'Email',
                hintText: 'Enter Your Email',
              ),

              SizedBox(height: 16.h),

              // Password Field
              CustomPasswordField(
                title: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
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
                      if (_formKey.currentState!.validate()) {
                        print("Email: ${_emailController.text}");
                        print("Password: ${_passwordController.text}");
                      }
                      Navigator.of(context).pushNamed(VerifyScreen.routeName);
                    },
                    child: Text(
                      "Register",
                      style: AppStyles.bodyMM.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 48.h),

              // Google Login
              GoogleButton(
                text: 'Continue with Google',
                iconPath: AppAssets.iconGoogleLogin,
                onTap: () {},
              ),

              SizedBox(height: 32.h),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppStyles.myFont.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.noColor,
                      overlayColor: AppColors.noColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      'Login',
                      style: AppStyles.myFont.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
