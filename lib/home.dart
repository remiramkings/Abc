import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_project/notification_service.dart.dart';
import 'package:local_notification_project/second_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> tokens = [
    "abc-12365",
    "abc-78946",
    "abc-56564",
    "abc-58526",
    "abc-33468",
    "abc-89796",
    "abc-44566",
  ];
  
  @override
  void initState() {
    NotificationService().init(
      (NotificationResponse details){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return SecondScreen(payLoad: details.payload ?? "");
          })
        );
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
          children: [
            InkWell(
              child: const Icon(Icons.notifications),
              onTap: () async {
                await NotificationService.getInstance().showNotificationWithPayLoad();
              },
            ),
            SizedBox(width: 10),
            InkWell(
              child: const Icon(Icons.token),
              onTap: () {
                showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Available Tokens'),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: tokens.length,
                                  itemBuilder: (context, index) {
                                    String token = tokens[index];
                                    return Text(token);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                         
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Exit'),
                            child: const Text('Exit'),
                          ),
                        ],
                      ),
                    );
              },
            ),
          ],
        )
        ],
      ),
    );
  }
}
