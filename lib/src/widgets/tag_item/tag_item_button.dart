import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/utils/app_layout.dart';

import '../../model/tag.dart';

class TagItemButton extends StatelessWidget {
  final String text;

  const TagItemButton(
      {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      FilledButton(
        onPressed: () => {
           context.read<TagModel>().updateTagName(text),
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
