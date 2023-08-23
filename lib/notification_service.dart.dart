import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_project/notification_actions.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService();

  static const String channelId = "MY_CHANNEL_ID";
  static const String channelName = "My Channel";
  static const String channelDesc = "This is my channel description";

  static NotificationService getInstance() {
    return _instance;
  }

  void init(Function(NotificationResponse) onNotificationClicked) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(onDidReceiveLocalNotification: null);
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      print("Debug: Notification clicked ${details.payload}");
      onNotificationClicked(details);
    });
  }

  Future<void> showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId, channelName,
            channelDescription: channelDesc,
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      1,
      'New token is assigned',
      'Tap to accept',
      notificationDetails,
    );
  }

  Future<void> showNotificationWithPayLoad(
      String message, String action, String payload, int actionId) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channelId, channelName,
            channelDescription: channelDesc,
            importance: Importance.max,
            priority: Priority.high,
            sound: RawResourceAndroidNotificationSound('wave'),
            playSound: true,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(actionId, message, action, notificationDetails, payload: payload);
  }
}
