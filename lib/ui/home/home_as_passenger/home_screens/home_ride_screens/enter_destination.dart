import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../reusable_buttons/custom_bottom_sheet.dart';
import '../../../reusable_buttons/outlined_circler_button.dart';
import '../../../reusable_buttons/reusable_others/location_field.dart';
import '../../profile/profile_tabs.dart';

class EnterDestination extends StatelessWidget {
  static String routeName = 'EnterDestination';

  const EnterDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: 650.h,//728 h elmfrod
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saved Location',
            style: AppStyles.bodyMM.copyWith(fontSize: 16),
          ),
          SizedBox(height: 8.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                OutlinedCircularButton(width: 32.w, height: 32.h, onTap: (){}, child: Icon(Icons.location_on_outlined,color: Colors.white,size: 30,),backgroundColor: AppColors.secondaryColor,borderColor: Colors.white,),
                SizedBox(height: 4.h,),
                Text('Home',style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp),),
              ],),
              Column(children: [
                OutlinedCircularButton(width: 32.w, height: 32.h, onTap: (){}, child: Icon(Icons.location_on_outlined,color: Colors.white,size: 30,),backgroundColor: AppColors.secondaryColor,borderColor: Colors.white,),
                SizedBox(height: 4.h,),
                Text('Office',style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp),),
              ],),
              Column(children: [
                OutlinedCircularButton(width: 32.w, height: 32.h, onTap: (){}, child: Icon(Icons.location_on_outlined,color: Colors.white,size: 30,),backgroundColor: AppColors.secondaryColor,borderColor: Colors.white,),
                SizedBox(height: 4.h,),
                Text('School',style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp),),
              ],),
              Column(children: [
                OutlinedCircularButton(width: 32.w, height: 32.h, onTap: (){}, child: Icon(Icons.add_circle,color: AppColors.secondaryColor,size: 30,),backgroundColor: AppColors.noColor,borderColor: AppColors.secondaryColor,),
                SizedBox(height: 4.h,),
                Text('Add New',style: AppStyles.welcomeButtonText2.copyWith(fontSize: 12.sp),),
              ],),
            ],
          ),
          SizedBox(height: 20.h,),

          LocationField(
            height: 48.h,
            hintText: 'Current address',
            prefixIconPath: AppAssets.locationCurrent,
          ),
          SizedBox(height: 20.h),
          LocationField(
            height: 48.h,
            hintText: 'Enter destination',
            prefixIconPath: AppAssets.locationDestnation,
          ),
          SizedBox(height: 20.h),
          ProfileTabs(text: ' Chalotte St',iconColor: AppColors.noColor,),
          ProfileTabs(text: ' Chalot Coffee shop',iconColor: AppColors.noColor),
          ProfileTabs(text: ' Chalotte University',iconColor: AppColors.noColor),

        ],
      ),
    );
  }
}
