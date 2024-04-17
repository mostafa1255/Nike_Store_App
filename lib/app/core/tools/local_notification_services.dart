import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../styles/App_Colors.dart';

class LocalNotificationService {
  static void initializeNotification() {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelKey: 'channel 1',
          channelName: 'mostafa',
          channelDescription: 'my channel',
          defaultColor: AppColors.kPrimaryColor,
          importance: NotificationImportance.High,
          locked: true,
          playSound: true,
          enableLights: true,
          enableVibration: true,
          defaultRingtoneType: DefaultRingtoneType.Notification)
    ]);
  }

  static Future<void> showNotification({required RemoteMessage message}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "channel 1",
            body: message.notification!.body,
            color: AppColors.kPrimaryColor,
            title: message.notification!.title,
            notificationLayout: message.notification?.android?.imageUrl != null
                ? NotificationLayout.BigPicture
                : NotificationLayout.Default,
            bigPicture: message.notification?.android?.imageUrl ??
                "https://firebasestorage.googleapis.com/v0/b/nike-store-app-f8ff2.appspot.com/o/-5902198634768874126_121.jpg?alt=media&token=67fac45d-59e6-4eb1-a505-7bf823f63478"));
  }
}
