import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safar_maei/ui/home/home_as_passenger/profile/profile_tabs/reusable/rectangular_box.dart';
import 'package:safar_maei/utils/app_assets.dart';
import 'package:safar_maei/utils/app_colors.dart';
import 'package:safar_maei/utils/app_styles.dart';

import 'notification_model.dart';
import 'notification_repository.dart';

class NotificationTab extends StatefulWidget {
  static String routeName = 'NotificationTab';

  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  final NotificationRepository _repository = NotificationRepository();
  late Future<List<NotificationModel>> _notificationsFuture;

  @override
  void initState() {
    super.initState();
    _notificationsFuture = _repository.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: FutureBuilder<List<NotificationModel>>(
        future: _notificationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final notifications = snapshot.data!;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                return _buildNotificationItem(notifications[index]);
              },
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
        'Notification',
        style: AppStyles.welcomeButtonText2.copyWith(fontSize: 18.sp),
      ),
      centerTitle: true,
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    String iconPath;
    switch (notification.type) {
      case NotificationType.success:
        iconPath = AppAssets.successNotification;
        break;
      case NotificationType.error:
        iconPath = AppAssets.errorNotification;
        break;
      case NotificationType.update:
        iconPath = AppAssets.updateNotification;
        break;
      default:
        iconPath = AppAssets.updateNotification;
    }

    return GestureDetector(
      onTap: () {
        /// if we clicked in the notification ?? => hna what will happens
        setState(() {
          // notification.isRead = true;
        });
      },
      child: RectangularBox(
        width: 335.w,
        height: 66.h,
        borderColor: AppColors.white,
        customChild: Padding(
          padding: const EdgeInsets.only(left: 23, top: 11, right: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(iconPath),
                  SizedBox(width: 8.w),
                  Text(
                    notification.title,
                    style: AppStyles.bodyMM.copyWith(
                      fontSize: 14.sp,
                      color: notification.isRead
                          ? AppColors.gray06.withOpacity(0.6)
                          : AppColors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    notification.timeAgo,
                    style: AppStyles.welcomeButtonText2.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.gray06.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                notification.message,
                style: AppStyles.welcomeButtonText2.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xff6C6E7C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}