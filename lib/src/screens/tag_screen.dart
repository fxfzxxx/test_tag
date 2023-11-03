import 'package:flutter/material.dart';
import 'package:test_tag/src/widgets/tag_buttons_row/tag_buttons_row.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item.dart';
import 'package:test_tag/src/widgets/tag_ID/tag_id.dart';
import 'package:test_tag/src/widgets/tag_preview/tag_preview.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: const TagPreview()),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
          child: const TagItem(),
        ),
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: const TagNumber()),
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            child: const TagButtonsRow()),
      ],
    );
  }
}
