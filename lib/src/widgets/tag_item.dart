import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_tag/src/utils/app_layout.dart';
import 'package:test_tag/src/widgets/tag_item_input.dart';

class TagItem extends StatelessWidget {
  const TagItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Item',
            )),
        TagItemInput(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 10),
          child: Column(children: [
            Row(
              children: [
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data"))
              ],
            ),
            AppLayout.gap(10),
            Row(
              children: [
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data")),
                FilledButton(onPressed: null, child: Text("data"))
              ],
            )
          ]),
        )
      ],
    );
  }
}
