import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/utils/app_assets.dart';
import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_styles.dart';
import 'chat_tab.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: message.isUser
            ? MainAxisAlignment.end // user massg right
            : MainAxisAlignment.start, // support massg left
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // support section
          if (!message.isUser) ...[
            // support icon (feha sorth)
            CircleAvatar(
              backgroundImage: AssetImage(
                AppAssets.supportManImage,
              ),
              backgroundColor: AppColors.primaryColor,
              // child: Image.asset(AppAssets.supportManImage,width: 36.w,height: 36.h,),
            ),
            SizedBox(width: 12.w),
          ],

          // bubble massg(le user w support)
          Flexible(
            child: Column(
              crossAxisAlignment: message.isUser
                  ? CrossAxisAlignment.end // user massg right
                  : CrossAxisAlignment.start, // support massg left
              children: [
                //  bubble massg(le user w support)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? AppColors.primaryColor
                            .withOpacity(0.6) // color of user bubble
                        : AppColors.white, // color of support bubble
                    borderRadius: BorderRadius.only(
                      //3shan mtcon4 circular kamel
                      topLeft: Radius.circular(message.isUser ? 16.r : 0.r),
                      topRight: Radius.circular(message.isUser ? 0.r : 16.r),
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                    border: Border.all(
                      color: message.isUser
                          ? AppColors.primaryColor
                          : AppColors.noColor,
                    ),
                  ),
                  child: Text(
                    message.text,
                    style: AppStyles.welcomeButtonText2.copyWith(
                      color: message.isUser ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),

                // massg Time
                SizedBox(height: 4.h),
                Text(
                  _formatTime(message.timestamp),
                  style: AppStyles.bodyMM.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.textColorLight,
                  ),
                ),
              ],
            ),
          ),

          // if we want to add icon image for user also
          if (message.isUser) ...[
            SizedBox(width: 8.w),
            //here icon
            /*
            CircleAvatar(
              radius: 16.r,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 18.sp,
              ),
            ),
            */
          ],
        ],
      ),
    );
  }

  //timing
  _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inDays < 1) {
      final hour = dateTime.hour;
      final minute = dateTime.minute;
      final period = hour >= 12 ? 'pm' : 'am';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}

