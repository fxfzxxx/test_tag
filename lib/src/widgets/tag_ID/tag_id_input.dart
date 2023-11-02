import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class TagIDInput extends StatefulWidget {
  final bool start;
  const TagIDInput({super.key, required this.start});

  @override
  State<TagIDInput> createState() => _TagIDInputState();
}

class _TagIDInputState extends State<TagIDInput> {
  late TextEditingController _controller;

  // get start => TagIDInput;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tag = context.read<TagModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: AppLayout.getSize(context).height * 0.05,
      width: double.infinity,
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            // height: 15,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.all(0), //this will keep the text inside the box
            border: OutlineInputBorder(),
            filled: true,
          ),
          controller: _controller,
          onChanged: widget.start
              ? (value) => tag.updateTagStartId(value)
              : (value) => tag.updateTagEndId(value),
        ),
      ),
    );
  }
}
