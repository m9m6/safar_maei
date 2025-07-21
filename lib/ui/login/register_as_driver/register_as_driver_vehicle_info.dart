import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../home/home_as_passenger/home_screens/home_ride_screens/home_screen_ride.dart';
import '../../primary_colored_button.dart';
import '../login_screen/custom_text_fields.dart';

class RegisterAsDriverVehicleInfo extends StatefulWidget {
  static String routeName = 'RegisterAsDriverVehicleInfo';

  const RegisterAsDriverVehicleInfo({super.key});

  @override
  State<RegisterAsDriverVehicleInfo> createState() => _RegisterAsDriverVehicleInfoState();
}

class _RegisterAsDriverVehicleInfoState extends State<RegisterAsDriverVehicleInfo> {
  // Controllers for text fields
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  final TextEditingController _insuranceNumberController = TextEditingController();

  // Variable to store license image
  File? _licenseImage;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickLicenseImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _licenseImage = File(image.path);
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
            Text('Vehicle Information', style: AppStyles.title),

            SizedBox(height: 8.h),
            Text(
              'Please fill in the vehicle information\nto complete your account\nactivation',
              style: AppStyles.bodySmallRegular,
            ),

            SizedBox(height: 20.h),

            // Vehicle Type field
            CustomTextFields(
              title: 'Vehicle Type',
              hintText: 'Enter Type',
            ),

            SizedBox(height: 16.h),

            // Vehicle Number field
            CustomTextFields(
              title: 'Vehicle Number',
              hintText: 'Enter Number',
            ),

            SizedBox(height: 16.h),

            // Insurance Number field
            CustomTextFields(
              title: 'Insurance Number',
              hintText: 'Enter Number',
            ),

            SizedBox(height: 16.h),

            // Instruction text for License
            Text(
              "Please upload a photo of Driver's License Copy",
              style: AppStyles.bodyMM.copyWith(fontSize: 14),
            ),

            SizedBox(height: 8.h),

            // License image upload container
            GestureDetector(
              onTap: _pickLicenseImage,
              child: SizedBox(
                height: 110.h,
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
                  child: _licenseImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.file(
                      _licenseImage!,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Center(
                    child: Image.asset(AppAssets.plusIcon),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // Confirm button with validation
            PrimaryColoredButton(
              text: "Confirm",
              onTap: () {
                Navigator.of(context).pushNamed(HomeScreenRide.routeName);
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}