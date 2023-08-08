import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  String name;
  String count;
  Color color;
  Color textColor;
  Function()? onSelected;
  CustomTab(
      {super.key,
      required this.name,
      required this.count,
      required this.color,
      required this.textColor,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Column(
            children: [
              Text(name, style: TextStyle(color: textColor)),
              Text(count, style: TextStyle(color: textColor))
            ],
          ),
        ),
      ),
    );
  }
}
