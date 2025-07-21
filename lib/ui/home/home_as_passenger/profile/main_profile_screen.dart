import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/chat/chat_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/contact_us/contact_us_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/edit_personal_details_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/language_tab.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/notifications/notification_tab.dart';
import 'package:safar_maei/ui/home/reusable_buttons/custom_bottom_sheet.dart';
import 'package:safar_maei/ui/home/reusable_buttons/outlined_circler_button.dart';
import 'package:safar_maei/ui/home/reusable_buttons/rectangular_fill_button.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class MainProfileScreen extends StatefulWidget {
  static String routeName = 'MainProfileScreen';

  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  bool _showOverlay = false; // Controls overlay visibility

  // Show log out bottom sheet
  void _showLogoutDialog() {
    setState(() {
      _showOverlay = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _buildLogoutBottomSheet();
      },
    ).then((_) {
      setState(() {
        _showOverlay = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // AppBar Section
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 87.h,

        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.sp,
              weight: 10,
            ),
          ),
        ),

        // AppBar Title
        title: Text(
          'Profile',
          style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),

      // Body Section with Stack
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Name',
                          style: AppStyles.title.copyWith(
                            fontSize: 24.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '+20 11111111111',
                          style: AppStyles.welcomeButtonText2.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.gray06.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    // Profile Image
                    OutlinedCircularButton(
                      width: 86.w,
                      height: 86.h,
                      onTap: () {},
                      isCentered: false,
                      borderColor: AppColors.noColor,
                      child: Image.asset(
                        AppAssets.profileImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 48.h),

                // Profile Options
                ProfileTabs(
                  text: 'Edit personal details',
                  showSpacer: false,
                  textStyle: AppStyles.welcomeButtonText2.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.gray06.withOpacity(0.5),
                  ),
                  iconColor: AppColors.gray06.withOpacity(0.5),
                  onTap: () {
                    Navigator.of(context).pushNamed(EditPersonalDetails.routeName);
                  },
                ),

                ProfileTabs(
                  text: 'Change Password',
                  showSpacer: true,
                  onTap: () {
                    // TODO: Navigate to change password screen
                  },
                ),

                ProfileTabs(
                  text: 'Language',
                  showSpacer: true,
                  onTap: () {
                    Navigator.of(context).pushNamed(LanguageTab.routeName);
                  },
                ),

                ProfileTabs(
                  text: 'Chat',
                  showSpacer: true,
                  showNotification: true,
                  notificationCount: 2,
                  onTap: () {
                    Navigator.of(context).pushNamed(ChatTab.routeName);
                  },
                ),

                ProfileTabs(
                  text: 'Notification',
                  showSpacer: true,
                  onTap: () {
                    Navigator.of(context).pushNamed(NotificationTab.routeName);
                  },
                ),

                ProfileTabs(
                  text: 'Privacy Policy',
                  showSpacer: true,
                  onTap: () {
                    // TODO: Navigate to privacy policy screen
                  },
                ),

                ProfileTabs(
                  text: 'About Us',
                  showSpacer: true,
                  onTap: () {
                    // TODO: Navigate to about us screen
                  },
                ),

                ProfileTabs(
                  text: 'Contact Us',
                  showSpacer: true,
                  onTap: () {
                    // TODO: Navigate to contact us screen
                    Navigator.of(context).pushNamed(ContactUsTab.routeName);
                  },
                ),

                ProfileTabs(
                  text: 'Log out',
                  showSpacer: true,
                  onTap: _showLogoutDialog, // Using the new dialog function
                ),
              ],
            ),
          ),

          // Dark overlay (shown when bottom sheet is visible)
          if (_showOverlay)
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
        ],
      ),
    );
  }
  Widget _buildLogoutBottomSheet() {
    return CustomBottomSheet(
      height: 202.h,
      backgroundColor: AppColors.white,
      dragHandleColor: AppColors.noColor,
      showDragHandle: false,
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Center(
            child: Text(
              'Log Out',
              style: AppStyles.title.copyWith(
                  fontSize: 24.sp,
                  color: AppColors.black
              ),
            ),
          ),
          Center(
            child: Text(
              'Are you sure you want to log out?',
              style: AppStyles.welcomeButtonText2.copyWith(
                fontSize: 12.sp,
                color: AppColors.gray06.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangularFillButton(
                height: 40.h,
                width: 131.w,
                text: 'Cancel',
                fontWeight: FontWeight.w500,
                onTap: () => Navigator.pop(context),
                backgroundColor: Colors.transparent,
                borderColor: AppColors.secondaryColor,
                textColor: AppColors.secondaryColor,
              ),
              SizedBox(width: 19.w),
              RectangularFillButton(
                height: 40.h,
                width: 131.w,
                text: 'Log Out',
                fontWeight: FontWeight.w500,
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }

}


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs.dart';
// import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/chat_tab.dart';
// import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/edit_personal_details_tab.dart';
// import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/language_tab.dart';
// import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/notification_tab.dart';
// import 'package:safar_maei/ui/home/reusable_buttons/outlined_circler_button.dart';
// import '../../../../utils/app_assets.dart';
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/app_styles.dart';
//
// class MainProfileScreen extends StatelessWidget {
//   static String routeName = 'MainProfileScreen';
//
//   const MainProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//
//       // AppBar Section
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 87.h,
//
//         // Back Button
//         leading: Padding(
//           padding: EdgeInsets.only(left: 30.w),
//           child: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 24.sp,
//               weight: 10,
//             ),
//           ),
//         ),
//
//         // AppBar Title
//         title: Text('Profile'),
//         titleTextStyle: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
//         centerTitle: true,
//       ),
//
//       // Body Section
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             // User Info Row (Name, Phone, and Profile Image)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Name and Phone Number
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // TODO: Replace with dynamic name from controller after login
//                     Text(
//                       'Your Name',
//                       style: AppStyles.title.copyWith(
//                         fontSize: 24.sp,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 8.h),
//
//                     // TODO: Replace with dynamic phone number from controller after login
//                     Text(
//                       '+20 11111111111',
//                       style: AppStyles.welcomeButtonText2.copyWith(
//                         fontSize: 12.sp,
//                         color: AppColors.gray06.withOpacity(0.5),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//
//                 // Profile Image
//                 OutlinedCircularButton(
//                   width: 86.w,
//                   height: 86.h,
//                   onTap: () {},
//                   isCentered: false,
//                   borderColor: AppColors.noColor,
//                   child: Image.asset(
//                     AppAssets.profileImage,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 48.h),
//
//             // Profile Options List
//             ProfileTabs(
//               text: 'Edit personal details',
//               showSpacer: false,
//               textStyle: AppStyles.welcomeButtonText2.copyWith(
//                 fontSize: 14.sp,
//                 color: AppColors.gray06.withOpacity(0.5),
//               ),
//               iconColor: AppColors.gray06.withOpacity(0.5),
//               onTap: () {
//                 ///go to personal details screen
//                 Navigator.of(context).pushNamed(EditPersonalDetails.routeName);
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Change Password',
//               showSpacer: true,
//               onTap: () {
//                 //todo: go to change password screen (enter email => get ver => change pass)//ForgotPassword
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Language',
//               showSpacer: true,
//               onTap: () {
//                 ///go to language screen
//                 Navigator.of(context).pushNamed(LanguageTab.routeName);
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Chat',
//               showSpacer: true,
//               showNotification: true,
//               notificationCount: 2,
//               onTap: () {
//                 ///go to chat screen
//                 Navigator.of(context).pushNamed(ChatTab.routeName);
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Notification',
//               showSpacer: true,
//               onTap: () {
//                 ///go to Notification screen
//                 Navigator.of(context).pushNamed(NotificationTab.routeName);
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Privacy Policy',
//               showSpacer: true,
//               onTap: () {
//                 //todo: go to privacy policy screen
//               },
//             ),
//
//             ProfileTabs(
//               text: 'About Us',
//               showSpacer: true,
//               onTap: () {
//                 //todo: go to About Us screen
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Contact Us',
//               showSpacer: true,
//               onTap: () {
//                 //todo: go to Contact Us screen
//               },
//             ),
//
//             ProfileTabs(
//               text: 'Log out',
//               showSpacer: true,
//               onTap: () {
//                 //todo: set screen and appears (bottom sheet log out options)=> if logout then back to welcome screen & if cancel then pop to the profile screen tani
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
