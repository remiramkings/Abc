import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  String label;
  Function(DateTime) onSelected;
  DateTime selected;
  DateTime firstDate;
  CustomDatePicker({
    super.key,
    required this.label,
    required this.onSelected,
    required this.selected,
    required this.firstDate
  });
  
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.grey, fontSize: 15)),
        Container(
          decoration:
              const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          child: InkWell(
            child: Row(children: [
              Expanded(child: Text(dateFormat.format(selected))),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.calendar_today_outlined,
                    color: Colors.blue),
              )
            ]),
            onTap: () async {
              DateTime? dt = await showDatePicker(
                  context: context,
                  initialDate: selected,
                  firstDate: firstDate,
                  lastDate: DateTime(2100));
              if (dt == null) {
                return;
              }
              onSelected(dt);
            },
          ),
        ),
      ],
    );
  }
}
