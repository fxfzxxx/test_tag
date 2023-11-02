import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/utils/app_layout.dart';

import '../../model/tag.dart';

class TagItemButton extends StatelessWidget {
  final String text;
  final Function onPressedCallback;
  const TagItemButton(
      {super.key, required this.text, required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    var tag = context.read<TagModel>();
    return Row(children: [
      FilledButton(
        onPressed: () => {
          onPressedCallback(text),
          tag.updateTagName(text),
        },
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(1),
        ),
        child: Text(text),
      ),
      AppLayout.horizontalGap(10),
    ]);
  }
}
