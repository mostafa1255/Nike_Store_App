import '../tools/local_notification_services.dart';
import '../tools/remote_notification_sevices.dart';

void setupNotification() {
  RemoteNotificationService remoteNotificationService =
      RemoteNotificationService();
  remoteNotificationService.requestNotificationPermission();
  LocalNotificationService.initializeNotification();
  remoteNotificationService.subscribeToTopic();
  RemoteNotificationService.remoteMessageToLocalNotification();
}
