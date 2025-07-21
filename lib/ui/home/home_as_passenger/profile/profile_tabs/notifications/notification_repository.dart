import 'notification_model.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getNotifications() async {
    //هنا APIs
    return [
      NotificationModel(
        id: '1',
        type: NotificationType.success,
        title: 'Successful',
        message: 'The destination has been reached safely',
        date: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationModel(
        id: '2',
        type: NotificationType.error,
        title: 'Error',
        message: 'Your order has been cancelled',
        date: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      ),
      NotificationModel(
        id: '3',
        type: NotificationType.update,
        title: 'Update',
        message: 'The password has been changed successfully',
        date: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    ];
  }
}