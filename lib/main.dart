import 'package:flutter/material.dart';
import 'package:local_notification_project/attendance/attendance.dart';
import 'package:local_notification_project/call_log.dart';
import 'package:local_notification_project/leave/leave.dart';
import 'package:local_notification_project/notification_alert.dart';

import 'home.dart';
import 'notification_service.dart.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

