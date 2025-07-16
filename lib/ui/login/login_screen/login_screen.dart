import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safar_maei/utils/app_assets.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';
import '../../home/test_test.dart';
import '../../primary_colored_button.dart';
import '../../welcome_screen/bottom_text_button_row.dart';
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
        scrolledUnderElevation: 0,
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
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Login Button
              PrimaryColoredButton(
                text: "Login",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print("Email: ${_emailController.text}");
                    print("Password: ${_passwordController.text}");
                  }
                  //todo: navigation to home screen
                  Navigator.of(context).pushNamed(TestTest.routeName);
                },
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
              BottomTextButtonRow(
                textBefore: 'Don’t have an account?',
                buttonText: 'Register',
                onPressed: () {
                  Navigator.of(context).pushNamed(WelcomeScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
