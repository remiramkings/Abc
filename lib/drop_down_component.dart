import 'package:flutter/material.dart';
import 'package:local_notification_project/model/common_id_name.dart';

class CustomDropDown<Option extends CommonIdName> extends StatelessWidget {
  String title;
  List<Option> options;
  Function(Option option) onSelected;
  Option? selected;
  CustomDropDown(
      {super.key,
      required this.title,
      required this.options,
      required this.onSelected,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey),
        ),
        InkWell(
          child: Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(selected != null ? selected!.name : ''),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_drop_down),
                )
              ],
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                            padding: const EdgeInsets.all(13),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey))),
                            child: Text(options[index].name)),
                        onTap: () {
                          onSelected(options[index]);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
