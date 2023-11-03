import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';

class LocationDialog extends StatefulWidget {
  const LocationDialog({super.key});

  @override
  State<LocationDialog> createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  String _location = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Please enter location'),
      content: TextField(
        decoration: const InputDecoration(hintText: "Enter location"),
        onChanged: (value) => {
          setState(() {
            _location = value;
          }),
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'Cancel'),
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            context.read<TagModel>().updateLocation(_location),
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
