import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

class LocalNotificationService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> initialize() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSSetting = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iOSSetting,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  @pragma('vm:entry-point')
  void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      log('notification payload: $payload');
    }
  }

  Future<void> show(RemoteMessage remoteMessage) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: Importance.max,
      priority: Priority.high,
    );
    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    final title = remoteMessage.notification?.title;
    final body = remoteMessage.notification?.body;
    await flutterLocalNotificationsPlugin.show(
      remoteMessage.hashCode,
      title,
      body,
      notificationDetails,
      payload: 'Payload',
    );
  }
}
