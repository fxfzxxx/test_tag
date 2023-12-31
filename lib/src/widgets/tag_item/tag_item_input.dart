import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class TagItemInput extends StatefulWidget {
  const TagItemInput({super.key});

  @override
  State<TagItemInput> createState() => _TagItemInputState();
}

class _TagItemInputState extends State<TagItemInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = context.watch<TagModel>().tagName;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: AppLayout.getSize(context).height * 0.08,
      width: double.infinity,
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontSize: 22,
            // fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(),
            filled: true,
          ),
          controller: _controller,
          onChanged: (value) => {
            context.read<TagModel>().updateTagName(
                value) //this is to update the tag model, so that the tag preview will be updated
          },
        ),
      ),
    );
  }
}
