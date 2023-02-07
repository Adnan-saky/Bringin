import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  CustomText({required this.text, this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,

        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    );
  }
}
