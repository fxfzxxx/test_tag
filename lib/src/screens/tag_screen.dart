import 'package:flutter/material.dart';
import 'package:test_tag/src/widgets/buttons/tag_button.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item.dart';
import 'package:test_tag/src/widgets/tag_number/tag_number.dart';
import 'package:test_tag/src/widgets/tag_preview/tag_preview.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  String tagName = '';
  String tagId = '';
  int tagNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 0),
                child: TagPreview()
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0),
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: TagItem(),
              ),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: TagNumber()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TagButton(
                      textFirstLine: 'Faulty',
                      color: Colors.red,
                      width: 0.1,
                      onTap: () => {}),
                  TagButton(
                      textFirstLine: 'Next',
                      textSecondLine: "location",
                      color: Colors.grey,
                      width: 0.1,
                      onTap: () => {}),
                  TagButton(
                      textFirstLine: 'Pass',
                      color: Colors.green,
                      width: 0.4,
                      onTap: () => {}),
                ],
              )
            ],
          );
  }
  void updateTagNumber(int newTagNumber) {
    setState(() {
      tagNumber = newTagNumber;
    });
  }
  void updateTagName(String newTagName) {
    setState(() {
      tagName = newTagName;
    });
  }
  void updateTagId(String newTagId) {
    setState(() {
      tagId = newTagId;
    });
  }
}