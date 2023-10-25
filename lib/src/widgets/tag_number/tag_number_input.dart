import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class TagNumberInput extends StatefulWidget {
  const TagNumberInput({super.key});

  @override
  State<TagNumberInput> createState() => _TagNumberInputState();
}

class _TagNumberInputState extends State<TagNumberInput> {
  late TextEditingController _controller;

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
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(),
            filled: true,
          ),
          controller: _controller,
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: Text(
                      'You typed "$value", which has length ${value.characters.length}.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
