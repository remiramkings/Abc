import 'package:flutter/material.dart';

class Enquiry extends StatelessWidget {
  String payLoad;
  Enquiry({super.key, required this.payLoad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Enquiries')),
        body: Center(
          child: Text("Payload: ${payLoad}"),
        ));
  }
}