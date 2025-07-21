import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safar_maei/ui/login/register_as_driver/register_as_driver_vehicle_info.dart';
import 'dart:io';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../primary_colored_button.dart';
import '../login_screen/custom_password_field.dart';
import '../login_screen/custom_text_fields.dart';
import '../register_as_passenger/verify/verify_screen.dart';

class RegisterAsDriverTwo extends StatefulWidget {
  static String routeName = 'RegisterDriverTwo';

  const RegisterAsDriverTwo({super.key});

  @override
  State<RegisterAsDriverTwo> createState() => _RegisterAsDriverTwoState();
}

class _RegisterAsDriverTwoState extends State<RegisterAsDriverTwo> {
  // Controllers for text fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  // Variables to store front and back card images
  File? _frontImage;
  File? _backImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage(bool isFront) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          if (isFront) {
            _frontImage = File(image.path);
          } else {
            _backImage = File(image.path);
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.noColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 42.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: InkWell(
            onTap: () => Navigator.pop(context),
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
        child: ListView(
          children: [
            SizedBox(height: 40.h),
            Text('Hi Mohamed', style: AppStyles.title),

            Text(
              'Enter your personal information to\nactivate your account securely',
              style: AppStyles.bodySmallRegular,
            ),

            SizedBox(height: 20.h),

            // Password field
            CustomPasswordField(
              title: 'Password',
              hintText: 'Enter Password',
              controller: _passwordController,
            ),

            SizedBox(height: 16.h),

            // Confirm password field
            CustomPasswordField(
              title: 'Confirm Password',
              hintText: 'Enter Password Again',
              controller: _confirmPasswordController,
            ),

            SizedBox(height: 16.h),

            // ID field
            CustomTextFields(
              title: 'ID',
              hintText: 'Enter Your ID',
            ),

            SizedBox(height: 16.h),

            // Instruction text for card upload
            RichText(
              text: TextSpan(
                style: AppStyles.bodyMM.copyWith(fontSize: 14),
                children: [
                  const TextSpan(text: 'Please upload a photo of the card from both sides '),
                  TextSpan(
                    text: '(front and back)',
                    style: AppStyles.bodyMM.copyWith(
                      fontSize: 14,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            // Card image upload containers
            SizedBox(
              height: 110.h,
              width: 156.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Front card image container
                  GestureDetector(
                    onTap: () => _pickImage(true),
                    child: Container(
                      height: 110.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                        color: AppColors.stroke,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          width: 1.w,
                          color:AppColors.stroke,
                        ),
                      ),
                      child: _frontImage != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.file(
                          _frontImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Center(
                        child: Image.asset(AppAssets.plusIcon),
                      ),
                    ),
                  ),

                  SizedBox(width: 23.w),

                  // Back card image container
                  GestureDetector(
                    onTap: () => _pickImage(false),
                    child: Container(
                      height: 110.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                        color: AppColors.stroke,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          width: 1.w,
                          color: AppColors.stroke,
                        ),
                      ),
                      child: _backImage != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.file(
                          _backImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : Center(
                        child: Image.asset(AppAssets.plusIcon),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Next button with validation
            PrimaryColoredButton(
              text: "Next",
              onTap: () {
                Navigator.of(context).pushNamed(RegisterAsDriverVehicleInfo.routeName);

                /// Validate all fields are filled
                if (_passwordController.text.isEmpty ||
                    _confirmPasswordController.text.isEmpty ||
                    _idController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }

                // Validate password match
                if (_passwordController.text != _confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Passwords do not match')),
                  );
                  return;
                }

                // Validate both images are uploaded
                if (_frontImage == null || _backImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please upload both front and back images')),
                  );
                  return;
                }

                // Navigate to verify screen if all validations pass
                // Navigator.of(context).pushNamed(RegisterAsDriverVehicleInfo.routeName);
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../utils/app_assets.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_styles.dart';
// import '../../primary_colored_button.dart';
// import '../login_screen/custom_password_field.dart';
// import '../login_screen/custom_text_fields.dart';
// import '../register_as_passenger/verify/verify_screen.dart';
//
// class RegisterAsDriverTwo extends StatelessWidget {
//   static String routeName = 'RegisterDriverTwo';
//   final TextEditingController _passwordController = TextEditingController();
//
//   RegisterAsDriverTwo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: AppColors.noColor,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 42.h,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 20.w),
//           child: InkWell(
//             onTap: () => Navigator.pop(context),
//             child: SizedBox(
//               width: 40.w,
//               height: 40.h,
//               child: Image.asset(AppAssets.iconBackArrow),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: ListView(
//           children: [
//             SizedBox(height: 40.h),
//             Text('Hi Mohamed', style: AppStyles.title),
//
//             Text(
//               'Enter your personal information to\nactivate your account securely',
//               style: AppStyles.bodySmallRegular,
//             ),
//
//             SizedBox(height: 20.h),
//
//             // passwords field
//             CustomPasswordField(
//               title: 'Password',
//               hintText: 'Enter Password',
//               controller: _passwordController,
//             ),
//
//             SizedBox(height: 16.h),
//
//             CustomPasswordField(
//               title: 'Confirm Password',
//               hintText: 'Enter Password Again',
//               controller: _passwordController,
//             ),
//
//             SizedBox(height: 16.h),
//
//             CustomTextFields(
//               title: 'ID',
//               hintText: 'Enter Your ID',
//             ),
//
//             SizedBox(height: 16.h),
//
//             RichText(
//               text: TextSpan(
//                 style: AppStyles.bodyMM.copyWith(
//                   fontSize: 14,
//                 ),
//                 children: [
//                   const TextSpan(text: 'Please upload a photo of the card from both sides '),
//                   TextSpan(
//                     text: '(front and back)',
//                     style: AppStyles.bodyMM.copyWith(
//                       fontSize: 14,
//                       color: AppColors.secondaryColor,
//                     ),
//                   ),
//                   ],
//               ),
//             ),
//
//             SizedBox(height: 8.h),
//
//             //adding front + back images
//             SizedBox(
//               height: 110.h,
//               width: 156.w,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     height: 110.h,
//                     width: 156.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.stroke,
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(
//                         width: 1.w,
//                         color: AppColors.stroke,
//                       ),
//                     ),
//                     child: Center(
//                       child: Image.asset(AppAssets.plusIcon),
//                     ),
//                   ),
//                   SizedBox(width: 23.w),
//                   Container(
//                     height: 110.h,
//                     width: 156.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.stroke,
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(
//                         width: 1.w,
//                         color: AppColors.stroke,
//                       ),
//                     ),
//                     child: Center(
//                       child: Image.asset(AppAssets.plusIcon),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 24.h),
//
//             PrimaryColoredButton(
//               text: "Next",
//               onTap: () {
//                 Navigator.of(context).pushNamed(VerifyScreen.routeName);
//               },
//             ),
//
//             SizedBox(height: 24.h),
//           ],
//         ),
//       ),
//     );
//   }
// }