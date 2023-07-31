import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double fontSize;
  const TextBtn({Key? key, required this.text, this.onPressed, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          "wiki: $text",
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.green,
            fontFamily: "PressStart2P",
          ),
          textAlign: TextAlign.center,
        ));
  }
}
