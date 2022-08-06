import 'package:awesome_notification/second_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // It must listen once
    listenToNotification();
  }

  void notify() async {
    String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'channelKey',
        title: 'This is Notification title',
        body: 'This is body of the Notification',
        bigPicture: 'https://miro.medium.com/max/880/0*SQy-aKEXu_WSoRd-.png',
        // Defining the size of the image
        notificationLayout: NotificationLayout.BigPicture,
      ),
      schedule: NotificationInterval(
        interval: 2, // 2 seconds
        timeZone: timezone,
        repeats: false,
      ),
    );
  }

  // When notification is pressed
  void listenToNotification() {
    AwesomeNotifications().actionStream.listen((receiveNotification) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return const SecondScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Icon(Icons.circle_notifications),
          onPressed: () {
            notify();
          },
        ),
      ),
    );
  }
}
