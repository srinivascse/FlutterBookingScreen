import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'layout/ticketbooking.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Virtusa',
            channelDescription: "Schedule Notification",
            defaultColor: Color(0XFF9050DD),
            ledColor: Colors.white,
            playSound: true,
            enableLights:true,
            enableVibration: true
        )
      ]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: TicketBooking(),
    );
  }
}


