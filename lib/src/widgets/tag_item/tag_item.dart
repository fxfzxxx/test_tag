import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item_button.dart';
import 'package:test_tag/src/widgets/tag_item/tag_item_input.dart';

class TagItem extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
  ];
  final List<String> oddIndexArray = [];
  final List<String> evenIndexArray = [];
  TagItem({super.key});

  void getOddEvenIndexArrays(List<String> inputList, List<String> oddIndexArray,
      List<String> evenIndexArray) {
    for (int i = 0; i < inputList.length; i++) {
      if (i % 2 == 0) {
        evenIndexArray.add(inputList[i]);
      } else {
        oddIndexArray.add(inputList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getOddEvenIndexArrays(items, oddIndexArray, evenIndexArray);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 3),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Item',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )),
        TagItemInput(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, left: 5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children:
                  evenIndexArray.map((e) => TagItemButton(text: e)).toList(),
            ),
            AppLayout.verticalGap(7),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  oddIndexArray.map((e) => TagItemButton(text: e)).toList(),
            ),
          ]),
        )
      ],
    );
  }
}
