import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  String label;
  CustomDatePicker({super.key, required this.label});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime dateTime = DateTime.now();
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: const TextStyle(color: Colors.grey, fontSize: 15)),
        Container(
          decoration:
              const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
          child: InkWell(
            child: Row(children: [
              Expanded(child: Text(dateFormat.format(dateTime))),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.calendar_today_outlined,
                    color: Colors.blue),
              )
            ]),
            onTap: () async {
              DateTime? dt = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));
              if (dt == null) {
                return;
              }
              setState(() {
                dateTime = dt;
              });
            },
          ),
        ),
      ],
    );
  }
}
