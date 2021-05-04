import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../screens/core/messaging.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  showNotification(message);
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
BuildContext _context;
init(BuildContext context) async {
  _context = context;
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  MessageWidget messageWidget = MessageWidget(context: context);

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          onDidReceiveLocalNotification:
              messageWidget.onDidReceiveLocalNotification);
  final MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification notification = message.notification;

    if (notification != null) {
      showNotification(message);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    //quando clica
    Map<String, String> data = message.data;
    selectNotificationMap(data);
  });
}

Future selectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
  await Navigator.pushNamed(
    _context,
    '/chatCliente',
  );
  await flutterLocalNotificationsPlugin.cancelAll();
}

Future selectNotificationMap(Map<String, dynamic> message) async {
  Navigator.pushNamed(
    _context,
    '/chatCliente',
  );
  //  Navigator.pushNamed(context, '/message',
  //      arguments: MessageArguments(message, true));
  await flutterLocalNotificationsPlugin.cancelAll();
}

Future showNotification(RemoteMessage message) async {
  int index = 0;
  String groupKey = 'com.u1b0x.u1b0xapp.onebox';
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'grouped channel id', 'grouped channel name', 'grouped channel desc',
      importance: Importance.max,
      priority: Priority.high,
      setAsGroupSummary: true,
      groupKey: groupKey);

  var iosChanelsSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: iosChanelsSpecifics);
  await flutterLocalNotificationsPlugin.show(
    index,
    message.notification.title,
    message.notification.body,
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
  index += 1;
}
