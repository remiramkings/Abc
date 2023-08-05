import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification_project/client.dart';
import 'package:local_notification_project/enquiry.dart';
import 'package:local_notification_project/notification_actions.dart';
import 'package:local_notification_project/notification_service.dart.dart';
import 'package:local_notification_project/order.dart';
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
        String? payload = details.payload;
        if(payload == null){
          return;
        }
        Widget widget = SecondScreen(payLoad: details.payload ?? "");
        if( payload == NotificationAction.client.name){
          widget = Client(payLoad: details.payload ?? "");
        } else if( payload == NotificationAction.enquiry.name){
          widget = Enquiry(payLoad: details.payload ?? "");
        } else if( payload == NotificationAction.order.name){
          widget = Order(payLoad: details.payload ?? "");
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget)
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
                await NotificationService.getInstance().showNotificationWithPayLoad(
                  "New token is assigned",
                  "Tap to accept",
                  NotificationAction.tokenReceived.name,
                  NotificationAction.tokenReceived.index
                );
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
      body: Center(
        child: Column(
          
          children: [
          SizedBox(height:10),
          ElevatedButton(onPressed: ()async{
            await NotificationService.getInstance().showNotificationWithPayLoad(
              "This is a Client notification",
              "Tap to see Client",
              NotificationAction.client.name,
              NotificationAction.client.index
            );
          }, child: Text('Client')),
          SizedBox(height:10),
          ElevatedButton(onPressed: ()async{
            await NotificationService.getInstance().showNotificationWithPayLoad(
              "This is an Enquiry notification",
              "Tap to see Enquiry",
              NotificationAction.enquiry.name,
              NotificationAction.enquiry.index
            );
          }, child: Text('Enquiry')),
          SizedBox(height:10),
          ElevatedButton(onPressed: ()async{
            await NotificationService.getInstance().showNotificationWithPayLoad(
              "This is an Order notification",
              "Tap to see Order",
              NotificationAction.order.name,
              NotificationAction.order.index
            );
          }, child: Text('Order'))
        ]),
      ),
    );
  }
}
