import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/reusable/rectangular_box.dart';
import 'package:safar_maei/utils/app_assets.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';

class LanguageTab extends StatelessWidget {
  static String routeName = 'LanguageTab';

  const LanguageTab({super.key});

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
        title: Text(
          'Language',
          style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            RectangularBox(
              width: 150.w,
              height: 100.h,
              backgroundColor: AppColors.noColor,
              borderColor: AppColors.primaryColor,
              onTap: () {},
              isClickable: true,
              pressedColor: Colors.white,
              customChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.arabicLanguageIcon),
                  SizedBox(height: 8.h),
                  Text('عربيه', style: AppStyles.uploadPicButton),
                ],
              ),
            ),
            Spacer(),
            RectangularBox(
              width: 150.w,
              height: 100.h,
              backgroundColor: AppColors.noColor,
              borderColor: AppColors.primaryColor,
              onTap: () {},
              isClickable: true,
              pressedColor: Colors.white,
              customChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.englishLanguageIcon),
                  SizedBox(height: 8.h),
                  Text('English', style: AppStyles.uploadPicButton),
                ],
              ),
            )
            // RectangularBox(width: 150.w, height: 100.h,backgroundColor: AppColors.noColor,),
            // Spacer(),
            // RectangularBox(width: 150.w, height: 100.h),
          ],
        ),
      ),
    );
  }
}
