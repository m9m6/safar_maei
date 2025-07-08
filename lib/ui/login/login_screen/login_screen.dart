import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_assets.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';
import '../../welcome_screen/welcome_screen.dart';
import 'Forgot Password/forgot_password.dart';
import 'custom_password_field.dart';
import 'custom_text_fields.dart';
import 'google_button.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Text('Login', style: AppStyles.title),

              // Subtitle
              Text(
                'Login now and be part of a\nsmart delivery experience',
                style: AppStyles.bodySmallRegular,
              ),

              SizedBox(height: 80.h),

              // Email Field
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

              SizedBox(height: 5.h),

              // Forget Password link (بدون أي تعديل عليه)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ForgotPassword.routeName);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                    },
                    child: Text(
                      "Login",
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
                    'Don’t have an account?',
                    style: AppStyles.myFont.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(WelcomeScreen.routeName);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.noColor,
                      overlayColor: AppColors.noColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      'Register',
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
