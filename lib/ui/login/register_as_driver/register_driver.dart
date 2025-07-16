import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safar_maei/ui/login/register_as_driver/register_as_driver_two.dart';
import 'dart:io';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../primary_colored_button.dart';
import '../login_screen/custom_text_fields.dart';
import '../register_as_passenger/verify/verify_screen.dart';

class RegisterDriver extends StatefulWidget {
  static String routeName = 'RegisterDriver';

  const RegisterDriver({super.key});

  @override
  State<RegisterDriver> createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
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
            Text('Register', style: AppStyles.title),

            RichText(
              text: TextSpan(
                style: AppStyles.bodySmallRegular,
                children: [
                  const TextSpan(text: 'Go and win with '),
                  TextSpan(
                    text: 'Safar Maei\n',
                    style: AppStyles.bodySmallRegular.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                      text: 'Register now and start delivering\nwith ease'),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Enhanced Image Upload Widget
            Column(
              children: [
                // Image Preview
                if (_profileImage != null)
                  Container(
                    width: 120.w,
                    height: 120.h,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: FileImage(_profileImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                // Upload Button
                SizedBox(
                  width: double.infinity,
                  height: 80.h,
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        side: BorderSide(
                            color: _profileImage != null
                                ? AppColors.primaryColor
                                : AppColors.stroke,
                            width: 1.w),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            _profileImage != null
                                ? 'Change profile picture'
                                : 'Upload a clear profile picture',
                            style: AppStyles.uploadPicButton,
                          ),
                        ),
                        Container(
                          height: 64.h,
                          width: 64.w,
                          decoration: BoxDecoration(
                            color: _profileImage != null
                                ? AppColors.primaryColor.withOpacity(0.1)
                                : AppColors.stroke,
                            borderRadius: BorderRadius.circular(43.r),
                            border: Border.all(
                              width: 1.w,
                              color: _profileImage != null
                                  ? AppColors.primaryColor
                                  : AppColors.stroke,
                            ),
                          ),
                          child: Center(
                            child: _profileImage != null
                                ? Icon(
                              Icons.check,
                              size: 24.sp,
                              color: AppColors.primaryColor,
                            )
                                : Icon(
                              Icons.add,
                              size: 24.sp,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // form fields
            CustomTextFields(
              title: 'First Name',
              hintText: 'Enter Your Name',
            ),
            SizedBox(height: 16.h),

            CustomTextFields(
              title: "Father's Name",
              hintText: 'Enter Name',
            ),
            SizedBox(height: 16.h),

            CustomTextFields(
              title: 'Last Name',
              hintText: 'Enter Name',
            ),
            SizedBox(height: 16.h),

            CustomTextFields(
              title: 'Phone Number',
              hintText: 'Enter Number',
            ),
            SizedBox(height: 16.h),

            CustomTextFields(
              title: 'Other Phone Number',
              hintText: 'Enter Number',
            ),
            SizedBox(height: 24.h),

            PrimaryColoredButton(
              text: "Next",
              onTap: () {
                if (_profileImage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please upload a profile picture')),
                  );
                  return;
                }
                Navigator.of(context).pushNamed(RegisterAsDriverTwo.routeName);
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}