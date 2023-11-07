import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';
import 'package:test_tag/src/model/tag_list.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tagList = context.watch<TagListModel>();
    return ListView.builder(
      itemCount: tagList.tags.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tagList.tags[index].tagName),
          subtitle: Text(tagList.tags[index].tagLocation),
          // onTap: () {
          //   Navigator.pushNamed(context, '/report1');
          // },
        );
      },
      // .reports.map((report) {
      //   return ListTile(
      //     title: Text(report.title),
      //     onTap: () {
      //       Navigator.pushNamed(context, report.route);
      //     },
      //   );
      // }).toList(),
      // children: <Widget>[
      //   ListTile(
      //     title: const Text('Report 1'),
      //     onTap: () {
      //       Navigator.pushNamed(context, '/report1');
      //     },
      //   ),
      //   ListTile(
      //     title: const Text('Report 2'),
      //     onTap: () {
      //       Navigator.pushNamed(context, '/report2');
      //     },
      //   ),
      //   ListTile(
      //     title: const Text('Report 3'),
      //     onTap: () {
      //       Navigator.pushNamed(context, '/report3');
      //     },
      //   ),
      // ],
    );
  }
}