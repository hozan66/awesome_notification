import 'package:awesome_notification/my_home_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> notificationsInit() async {
  await AwesomeNotifications().initialize(
    null, // null will take the defaultIcon
    [
      NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription',
        defaultColor: const Color(0XFF9050DD),
        enableLights:
            true, // It should set up to true so we can use ledColor property
        ledColor: Colors
            .white, // This color will be visible when notification get received
        playSound: true,
        enableVibration: true,
        channelShowBadge: true,
        importance: NotificationImportance.High,
      ),
    ],
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await notificationsInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Awesome Notification',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
