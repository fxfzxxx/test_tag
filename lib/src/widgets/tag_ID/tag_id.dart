import 'package:flutter/material.dart';
import 'package:test_tag/src/widgets/tag_ID/tag_id_input.dart';

class TagNumber extends StatelessWidget {
  const TagNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 8, vertical: 3),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'ID from',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        const TagIDInput(start:true),
        Container(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 8, vertical: 3),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'To',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
         const TagIDInput(start:false),
      ],
    );
  }
}
