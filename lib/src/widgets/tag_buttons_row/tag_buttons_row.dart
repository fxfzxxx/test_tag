import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';
import 'package:test_tag/src/widgets/buttons/tag_button.dart';
import 'package:test_tag/src/widgets/dialogs/location_dialog.dart';

class TagButtonsRow extends StatelessWidget {
  const TagButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    var tag = context.watch<TagModel>();
    String location = tag.tagLocation;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TagButton(
            textFirstLine: 'Faulty',
            color: Colors.red,
            width: 0.2,
            onTap: () => {}),
        TagButton(
            textFirstLine: location.isEmpty ? 'Set' : 'Next',
            textSecondLine: "location",
            color: Colors.grey,
            width: 0.2,
            onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const LocationDialog()
                )),
        TagButton(
            textFirstLine: 'Pass',
            color: Colors.green,
            width: 0.4,
            onTap: () => {})
      ],
    );
  }
}
