import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'local_notification_service.dart';

class FirebaseService {
  Future<void> initialize() async {
    await Firebase.initializeApp();
    _analyticsConfiguration();
    _firebaseMessagingConfiguration();
    _crashlyticsConfiguration();
  }

  Future<void> _firebaseMessagingConfiguration() async {
    await FirebaseMessaging.instance.requestPermission();
    _onMessage();
    _onBackgroundMessage();
  }

  void _onMessage() {
    FirebaseMessaging.onMessage.listen(
      (remoteMessage) {
        final localNotification = GetIt.I.get<LocalNotificationService>();
        localNotification.show(remoteMessage);
      },
    );
  }

  void _onBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _analyticsConfiguration() {
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  void _crashlyticsConfiguration() {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  // TODO: Implement this
}
