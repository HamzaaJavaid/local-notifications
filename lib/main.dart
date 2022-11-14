import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  AndroidInitializationSettings android = AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings = InitializationSettings(
    android: android,

  );

   await notificationsPlugin.initialize(initializationSettings);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  void showNotification()async{

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails("hamza", "hamza app",
    priority: Priority.high,
      importance: Importance.high,
      color: Colors.greenAccent
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await notificationsPlugin.show(1, 'HAMZA Javaid ', 'This is notification from HAMZA JAVAID', notificationDetails);

  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            showNotification();
          },
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.notifications_active_sharp,color: Colors.black,),
        ),
        appBar: AppBar(title: Text("ANDROID  NOTIFICATION"),centerTitle: true,backgroundColor: Colors.lightGreenAccent,),
        body: Center(child: Text("Click on bell icon for NOTIFICATION"),),
      ),
    );
  }
}

