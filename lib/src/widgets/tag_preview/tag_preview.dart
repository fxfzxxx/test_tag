import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';

class TagPreview extends StatelessWidget {
  const TagPreview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var tag = context.watch<TagModel>();
    String tagId = tag.tagStartId == tag.tagEndId
        ? tag.tagStartId
        : '${tag.tagStartId} ${tag.tagStartId.isEmpty ? '' : '~'} ${tag.tagEndId}';
    String tagName = tag.tagName;
    String tagQuantity = tag.tagQuantity.isEqual(0) |
            tag.tagStartId.isEmpty |
            tag.tagEndId.isEmpty
        ? ''
        : '${tag.tagQuantity}';
    String tagLocation = tag.tagLocation;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Tag Preview',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )),
        Card(
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 4, vertical: 4),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID:'),
                      Text('Items:'),
                      Text('Quantity:'),
                      Text('Location:'),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(tagId),
                        Text(tagName),
                        Text(tagQuantity),
                        Text(tagLocation),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
