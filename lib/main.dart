import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/login/login_screen/Forgot%20Password/forgot_password.dart';
import 'package:safar_maei/ui/login/login_screen/login_screen.dart';
import 'package:safar_maei/ui/login/register_as_driver/register_driver.dart';
import 'package:safar_maei/ui/login/register_as_passenger/register_passenger.dart';
import 'package:safar_maei/ui/login/register_as_passenger/verify/verify_screen.dart';
import 'package:safar_maei/ui/welcome_screen/welcome_screen.dart';
import 'package:safar_maei/utils/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppThemes.loginbackgroundTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: WelcomeScreen.routeName,
          routes: {
            WelcomeScreen.routeName: (context) => const WelcomeScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            ForgotPassword.routeName: (context) => const ForgotPassword(),
            RegisterDriver.routeName: (context) => const RegisterDriver(),
            RegisterPassenger.routeName: (context) => const RegisterPassenger(),
            VerifyScreen.routeName: (context) => const VerifyScreen(),




          },
        );
      },
    );
  }
}
