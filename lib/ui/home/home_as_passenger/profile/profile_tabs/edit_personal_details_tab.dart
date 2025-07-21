import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safar_maei/ui/home/reusable_buttons/rectangular_fill_button.dart';
import 'package:safar_maei/ui/login/login_screen/custom_text_fields.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../reusable_buttons/custom_bottom_sheet.dart';
import '../../../reusable_buttons/outlined_circler_button.dart';

class EditPersonalDetails extends StatefulWidget {
  static String routeName = 'EditPersonalDetails';

  const EditPersonalDetails({super.key});

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  bool _showOverlay = false; // Controls overlay visibility

  // Show delete account confirmation dialog
  void _showDeleteAccountDialog() {
    setState(() {
      _showOverlay = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _buildDeleteAccountBottomSheet();
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

        // Back Button
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
        title: Text('Profile'),
        titleTextStyle: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
        centerTitle: true,
      ),

      // Body
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Info Row (Name, Phone, and Profile Image)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Phone Column
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

                    // Profile Image with edit button
                    Stack(
                      children: [
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
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: OutlinedCircularButton(
                            width: 32.w,
                            height: 32.h,
                            onTap: () {
                              // TODO: adding profile picture change
                            },
                            isCentered: true,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.noColor,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primaryColor,
                              size: 16.49.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 48.h),

                // Text fields
                CustomTextFields(title: 'Your Name', hintText: 'Your Name'),
                SizedBox(height: 16.h),
                CustomTextFields(title: 'Email', hintText: 'email@Email.com'),
                SizedBox(height: 16.h),
                CustomTextFields(title: 'Phone Numer', hintText: '01012345789'),
                SizedBox(height: 40.h),

                // Save button
                RectangularFillButton(text: 'Save', onTap: () {}),
                SizedBox(height: 10.h),

                // Delete account button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _showDeleteAccountDialog,
                      child: Text(
                        'Delete your Account',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: AppColors.secondaryColor,
                          decorationColor: AppColors.secondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Dark overlay (shown when user clicks button delete my acc)
          if (_showOverlay)
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
        ],
      ),
    );
  }

  // bottom sheet
  Widget _buildDeleteAccountBottomSheet() {
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
              'Delete Account',
              style: AppStyles.title
                  .copyWith(fontSize: 24.sp, color: AppColors.black),
            ),
          ),
          Center(
            child: Text(
              'Are you sure you want to Delete Acount',
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
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                borderColor: AppColors.secondaryColor,
                textColor: AppColors.secondaryColor,
              ),
              SizedBox(width: 19.w),
              RectangularFillButton(
                height: 40.h,
                width: 131.w,
                text: 'Delete',
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



//elcode ui
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:safar_maei/ui/home/reusable_buttons/rectangular_fill_button.dart';
// import 'package:safar_maei/ui/login/login_screen/custom_text_fields.dart';
//
// import '../../../../../utils/app_assets.dart';
// import '../../../../../utils/app_colors.dart';
// import '../../../../../utils/app_styles.dart';
// import '../../../reusable_buttons/outlined_circler_button.dart';
//
// class EditPersonalDetails extends StatelessWidget {
//   static String routeName = 'EditPersonalDetails';
//
//   const EditPersonalDetails({super.key});
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
//                 Container(
//                   child: Stack(
//                     children: [
//                       OutlinedCircularButton(
//                         width: 86.w,
//                         height: 86.h,
//                         onTap: () {},
//                         isCentered: false,
//                         borderColor: AppColors.noColor,
//                         child: Image.asset(
//                           AppAssets.profileImage,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       Positioned(
//                         right: 0,
//                         bottom: 0,
//                         child: OutlinedCircularButton(
//                           width: 32.w,
//                           height: 32.h,
//                           onTap: () {
//                             //todo: upload another profile picture
//                           },
//                           isCentered: true,
//                           backgroundColor: Colors.white,
//                           borderColor: AppColors.noColor,
//                           child: Icon(
//                             Icons.camera_alt_outlined,
//                             color: AppColors.primaryColor,
//                             size: 16.49.sp,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//
//             SizedBox(height: 48.h),
//
//             //todo: need controller to pass the data (name)+(email)+(phone num)
//             CustomTextFields(title: 'Your Name', hintText: 'Your Name'),
//             SizedBox(height: 16.h),
//             CustomTextFields(title: 'Email', hintText: 'email@Email.com'),
//             SizedBox(height: 16.h),
//             CustomTextFields(title: 'Phone Numer', hintText: '01012345789'),
//             SizedBox(height: 40.h),
//
//             RectangularFillButton(text: 'Save', onTap: () {}),
//             SizedBox(height: 10.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//
//                   },
//                   child: Text(
//                     'Delete your Account',
//                     style: GoogleFonts.poppins(
//                         fontSize: 12.sp,
//                         color: AppColors.secondaryColor,
//                         decorationColor: AppColors.secondaryColor,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
