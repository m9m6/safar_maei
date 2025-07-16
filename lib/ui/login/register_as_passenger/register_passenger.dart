import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/login/register_as_passenger/verify/verify_screen.dart';
import 'package:safar_maei/ui/welcome_screen/bottom_text_button_row.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../primary_colored_button.dart';
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
              Text('Register', style: AppStyles.title),

              // Subtitle(richText)
              RichText(
                text: TextSpan(
                  style: AppStyles.bodySmallRegular,
                  children: [
                    TextSpan(text: 'Register now and order your trips\neasily with the '),
                    TextSpan(
                      text: 'Safar Maei',
                      style: AppStyles.bodySmallRegular.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: ' app'),
                  ],
                ),
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

              // Register Button
              PrimaryColoredButton(
                text: "Register",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print("Email: ${_emailController.text}");
                    print("Password: ${_passwordController.text}");
                  }
                  Navigator.of(context).pushNamed(VerifyScreen.routeName);
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
