import 'package:flutter/material.dart';
import 'package:local_notification_project/custom_date_picker.dart';

class SearchPopUp extends StatefulWidget {
  SearchPopUp({super.key});

  @override
  State<SearchPopUp> createState() => _SearchPopUpState();
}

class _SearchPopUpState extends State<SearchPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.all(10),
      content: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomDatePicker(
                    label: 'From date',
                  )
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: CustomDatePicker(
                    label: 'To date',
                  )
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Search'))
          ],
        ),
      ),
    );
  }
}
