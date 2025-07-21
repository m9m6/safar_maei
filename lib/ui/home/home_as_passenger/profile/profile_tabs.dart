import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';

class ProfileTabs extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final bool showSpacer;
  final Color iconColor;
  final double iconSize;
  final bool showNotification;
  final int? notificationCount;
  final Color notificationColor;

  const ProfileTabs({
    super.key,
    required this.text,
    this.textStyle,
    this.onTap,
    this.showSpacer = true,
    this.iconColor = AppColors.textColorLight,
    this.iconSize = 14.7,
    this.showNotification = false,
    this.notificationCount,
    this.notificationColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 16.h),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            children: [
              Text(
                text,
                style: textStyle ??
                    GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
              if (showNotification && notificationCount != null) ...[
                SizedBox(width: 4.w),
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: notificationColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      notificationCount.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
              if (showSpacer) const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: iconSize.w,
                color: iconColor,
                weight: 0.2,
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Divider(
          color: AppColors.white.withOpacity(0.3),
          thickness: 1.h,
        ),
      ],
    );
  }
}