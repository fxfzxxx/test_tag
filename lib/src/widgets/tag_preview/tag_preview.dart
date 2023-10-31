import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';

class TagPreview extends StatelessWidget {
  const TagPreview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var tag = context.watch<TagModel>();
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
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID:'),
                      Text('Items:'),
                      Text('Location: '),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('${tag.tagStartId} ~ ${tag.tagEndId}'),
                      Text('${tag.tagName} x ${tag.tagNumber}'),
                      Text(tag.tagLocation),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
