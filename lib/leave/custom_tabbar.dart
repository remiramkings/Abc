import 'package:flutter/material.dart';
import 'package:local_notification_project/leave/custom_tab.dart';
import 'package:local_notification_project/model/leave_grid_summary.dart';

class CustomTabBar extends StatelessWidget {
  LeaveSummary? summary;
  int selectedIndex;
  Function(int index) onSelected;

  CustomTabBar(
      {super.key,
      this.summary,
      required this.selectedIndex,
      required this.onSelected});

  isSelected(int index) {
    return selectedIndex == index;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: CustomTab(
              name: 'Waiting List',
              count: summary != null ? summary!.Waitlist : '0',
              color: isSelected(1) ? Colors.white : Colors.blue[900] ?? Colors.blue,
              textColor: isSelected(1) ? Colors.black : Colors.white,
              onSelected: () {
                onSelected(1);
              },
            )),
        Expanded(
            flex: 1,
            child: CustomTab(
              name: 'Approved',
              count: summary != null ? summary!.Approved : '0',
              color: isSelected(2) ? Colors.white : Colors.green,
              textColor: isSelected(2) ? Colors.black : Colors.white,
              onSelected: () {
                onSelected(2);
              },
            )),
        Expanded(
            flex: 1,
            child: CustomTab(
              name: 'Rejected',
              count: summary != null ? summary!.Rejected : '0',
              color: isSelected(3) ? Colors.white : Color.fromARGB(255, 197, 54, 44),
              textColor: isSelected(3) ? Colors.black : Colors.white,
              onSelected: () {
                onSelected(3);
              },
            )),
        Expanded(
            flex: 1,
            child: CustomTab(
              name: 'All',
              count: summary != null ? summary!.allCount : '0',
              color: isSelected(0) ? Colors.white : Color.fromARGB(255, 244, 164, 44),
              textColor: isSelected(0) ? Colors.black : Colors.white,
              onSelected: () {
                onSelected(0);
              },
            ))
      ],
    );
  }
}
