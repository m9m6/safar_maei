import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/test_test.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../primary_colored_button.dart';
import '../../login_screen/custom_text_fields.dart';

class VerifyScreen extends StatelessWidget {
  static String routeName = 'VerifyScreen';

  const VerifyScreen({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            // Title
            Text('Verify', style: AppStyles.title),

            // Subtitle
            Text(
              'We have sent a message to your\nemail account with a verification\ncode!',
              style: AppStyles.bodySmallRegular,
            ),

            SizedBox(height: 80.h),

            // Email Field
            CustomTextFields(
              title: 'Verification Code',
              hintText: 'EX: 123456',
            ),

            SizedBox(height: 24.h),

            // verify Button
            PrimaryColoredButton(
              text: "Register",
              onTap: () {
                //todo: User enter App
                Navigator.of(context).pushNamed(TestTest.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
