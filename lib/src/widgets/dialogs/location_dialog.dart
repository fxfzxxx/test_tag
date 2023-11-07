import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_tag/src/model/tag.dart';

class LocationDialog extends StatelessWidget {
  LocationDialog({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  // final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    String location = '';
    return AlertDialog(
      title: const Text('Please enter location'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: const InputDecoration(hintText: "Enter location"),
          validator: (value) {
            if (value == null || value.isEmpty || value.trim().isEmpty) {
              return 'Please enter some text';
            }
            location = value;
            return null;
          },
          autofocus: true,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context, location);
              context.read<TagModel>().updateLocation(location);
            }
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
