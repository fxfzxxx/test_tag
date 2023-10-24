import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class TagItemButton extends StatefulWidget {
  const TagItemButton({super.key, required});

  @override
  State<TagItemButton> createState() => _TagItemButtonState();
}

class _TagItemButtonState extends State<TagItemButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(onPressed: null, child: Text('data')),
        AppLayout.gap(10),
        FilledButton(onPressed: null, child: Text('data'))
      ],
    );
  }
}