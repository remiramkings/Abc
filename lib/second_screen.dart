import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String payLoad;
  SecondScreen({super.key,
    required this.payLoad
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Text("Payload: ${payLoad}"),
      ),
    );
  }
}