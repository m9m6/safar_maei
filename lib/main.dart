import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/home_as_passenger/home_screens/home_ride_screens/home_screen_ride.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/main_profile_screen.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/chat/chat_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/contact_us/contact_us_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/edit_personal_details_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/language_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/notifications/notification_tab.dart';
import 'package:safar_maei/ui/home/test_test.dart';
import 'package:safar_maei/ui/login/login_screen/Forgot%20Password/forgot_password.dart';
import 'package:safar_maei/ui/login/login_screen/login_screen.dart';
import 'package:safar_maei/ui/login/register_as_driver/register_as_driver_two.dart';
import 'package:safar_maei/ui/login/register_as_driver/register_as_driver_vehicle_info.dart';
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
          // initialRoute: HomeScreenRide.routeName,
          initialRoute: WelcomeScreen.routeName,
          routes: {
            WelcomeScreen.routeName: (context) => const WelcomeScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            ForgotPassword.routeName: (context) => const ForgotPassword(),
            RegisterDriver.routeName: (context) => const RegisterDriver(),
            RegisterPassenger.routeName: (context) => const RegisterPassenger(),
            VerifyScreen.routeName: (context) => const VerifyScreen(),
            TestTest.routeName: (context) => const TestTest(),
            RegisterAsDriverTwo.routeName: (context) =>  RegisterAsDriverTwo(),
            HomeScreenRide.routeName: (context) =>  HomeScreenRide(),
            MainProfileScreen.routeName: (context) =>  MainProfileScreen(),
            EditPersonalDetails.routeName: (context) =>  EditPersonalDetails(),
            LanguageTab.routeName: (context) =>  LanguageTab(),
            ChatTab.routeName: (context) =>  ChatTab(),
            NotificationTab.routeName: (context) =>  NotificationTab(),
            ContactUsTab.routeName: (context) =>  ContactUsTab(),
            RegisterAsDriverVehicleInfo.routeName: (context) =>  RegisterAsDriverVehicleInfo(),



          },
        );
      },
    );
  }
}
