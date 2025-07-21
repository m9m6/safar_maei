import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/contact_us/social_media_botton.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/reusable/rectangular_box.dart';
import 'package:safar_maei/ui/login/login_screen/custom_text_fields.dart';
import 'package:safar_maei/utils/app_assets.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_styles.dart';

class ContactUsTab extends StatelessWidget {
  static String routeName = 'ContactUsTab';

  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,

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

        title: Text(
          'Contact Us',
          style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.contactUsImage,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomTextFields(title: 'Subject', hintText: ''),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFields(title: 'Email', hintText: ''),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextFields(
                      title: 'Message', hintText: '', height: 120.h),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(
                          platform: SocialMediaPlatform.instagram),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.whatsapp),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.twitter),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.tiktok),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.snapchat),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.youtube),
                      SizedBox(
                        width: 15.w,
                      ),
                      SocialMediaButton(
                          platform: SocialMediaPlatform.instagram),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
