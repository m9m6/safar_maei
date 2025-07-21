import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../reusable_buttons/rectangular_fill_button.dart';
import '../../profile/profile_tabs/reusable/rectangular_box.dart';

class DriverCard extends StatelessWidget {
  final String driverName;
  final String distance;
  final String carInfo;
  final double rating;
  final String price;
  final VoidCallback onAccept;

  const DriverCard({
    super.key,
    required this.driverName,
    required this.distance,
    required this.carInfo,
    required this.rating,
    required this.price,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return RectangularBox(
      width: 335.w,
      height: 112.h,
      borderColor: AppColors.primaryColor,
      borderRadius: 16.w,
      customChild: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.asset(
                    AppAssets.profileImage,
                    height: 48.h,
                    width: 48.w,
                  ),
                ),
                SizedBox(width: 11.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppStyles.uploadPicButton.copyWith(
                          fontSize: 14.sp,
                        ),
                        children: [
                          TextSpan(text: driverName),
                          TextSpan(
                            text: ' ($distance)',
                            style: AppStyles.uploadPicButton.copyWith(
                              fontSize: 10.sp,
                              color: AppColors.gray06,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      carInfo,
                      style: AppStyles.uploadPicButton.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.gray06,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15.7,
                    ),
                    Text(
                      rating.toString(),
                      style: AppStyles.uploadPicButton.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.gray06,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  price,
                  style: AppStyles.title.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Spacer(),
                RectangularFillButton(
                  text: 'Accept',
                  fontSize: 9.sp,//16sp
                  onTap: onAccept,
                  height: 32.h,
                  width: 74.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}