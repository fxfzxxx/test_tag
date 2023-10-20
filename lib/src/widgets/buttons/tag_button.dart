import 'package:flutter/material.dart';
import 'package:test_tag/src/utils/app_layout.dart';

class TagButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double width;

  const TagButton({Key? key, required this.text, required this.color, required this.width, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppLayout.getSize(context).height;
    double screenWidth = AppLayout.getSize(context).width;

    return FilledButton(
      onPressed: onTap,
      

      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(screenWidth * width, screenHeight * 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
        textStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text,maxLines: 2,),
    );
  }
}
