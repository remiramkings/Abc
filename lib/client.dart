import 'package:flutter/material.dart';

class Client extends StatelessWidget {
  String payLoad;
  Client({super.key, required this.payLoad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Client')),
        body: Center(
          child: Text("Payload: ${payLoad}"),
        ));
  }
}
