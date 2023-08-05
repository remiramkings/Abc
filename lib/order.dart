import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  String payLoad;
  Order({super.key, required this.payLoad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
        body: Center(
          child: Text("Payload: ${payLoad}"),
        )
    );
  }
}