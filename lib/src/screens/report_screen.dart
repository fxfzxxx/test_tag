import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag_list.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tagList = context.watch<TagListModel>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8.0),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(1.0), // Flex factor for 'ID' column
              1: FlexColumnWidth(0.8), // Flex factor for 'Name' column
              2: FlexColumnWidth(0.8), // Flex factor for 'Location' column
              3: FlexColumnWidth(0.5), // Flex factor for 'Status' column
            },
            children: const [
              TableRow(
                children: [
                  Text('ID'),
                  Text('Name'),
                  Text('Location'),
                  // Text('Description'),
                  Text('Status'),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView.separated(
            itemCount: tagList.tags.length,
            itemBuilder: (context, index) {
              var tag = tagList.tags[index];
              return Container(
                color: tag.tagStatus
                    ? Colors.transparent
                    : Colors.red[100], // Highlight if status is false
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1.0), // Flex factor for 'ID' column
                      1: FlexColumnWidth(0.8), // Flex factor for 'Name' column
                      2: FlexColumnWidth(
                          0.8), // Flex factor for 'Location' column
                      3: FlexColumnWidth(
                          0.5), // Flex factor for 'Status' column
                    },
                    children: [
                      TableRow(
                        children: [
                          Text(tag.id),
                          Text(tag.tagName),
                          Text(tag.tagLocation),
                          // Text(tag.tagDescription),
                          Text(tag.tagStatus ? 'True' : 'False'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(), // Add a divider between each item
          ),
        ),
      ],
    );
  }
}
