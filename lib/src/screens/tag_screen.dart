import 'package:flutter/material.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TagScreen'),
      ),
      body: const Center(
        child: Text(
          'TagScreen is working',
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}