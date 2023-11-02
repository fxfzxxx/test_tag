import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';
import 'package:test_tag/src/model/tag_items.dart';
import 'package:test_tag/src/utils/app_layout.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item_button.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item_input.dart';

class TagItem extends StatefulWidget {
  TagItem({super.key});

  @override
  State<TagItem> createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {

  String inputText = '';
  @override
  Widget build(BuildContext context) {
    // var tag = context.watch<TagModel>();
    List<String> evenIndexArray = TagItemModel.evenIndexArray;
    List<String> oddIndexArray = TagItemModel.oddIndexArray;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 8, vertical: 3),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Item',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        TagItemInput(text:inputText, onChangedCallback: tagItemInputOnChange),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, left: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: evenIndexArray
                  .map((e) => TagItemButton(
                        text: e,
                        onPressedCallback: tagItemButtonOnPressed,
                      ))
                  .toList(),
            ),
            AppLayout.verticalGap(7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: oddIndexArray
                  .map((e) => TagItemButton(
                        text: e,
                        onPressedCallback: tagItemButtonOnPressed,
                      ))
                  .toList(),
            ),
          ]),
        )
      ],
    );
  }

  void tagItemInputOnChange(String text) {
    setState(() {
      inputText = text;
    });
  }

  void tagItemButtonOnPressed(String text) {
    setState(() {
      inputText = text;
    });
  }

  
}
