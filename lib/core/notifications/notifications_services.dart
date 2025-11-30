import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  // get instance form messaging
  final messaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // init fcm
  Future<void> intFcm() async {
    // get Permission
    await messaging.requestPermission();

    // get token
    final token = await messaging.getToken();
    print("Token :: $token");

    // get  notifications when tap message
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("message ${message.notification?.title}");
    });

    // get notifications when app for ground
    FirebaseMessaging.onMessage.listen((message) {
      print("message ${message.notification!.title}");
    });
  }

  Future<void> initLocalNotification() async {
    //initializeTimeZones();

    //! https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

    // setLocalLocation(getLocation('Africa/Cairo'));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await notificationsPlugin.initialize(initializationSettings);
  }
}
