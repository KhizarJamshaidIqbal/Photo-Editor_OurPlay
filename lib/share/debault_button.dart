// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';

class Defaultbutton extends StatelessWidget {
  final VoidCallback onpress;
  final Widget child;
  final Color color;
  final Color Textcolor;
  const Defaultbutton(
      {super.key,
      required this.onpress,
      required this.child,
      required this.color,
      required this.Textcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onpress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        textStyle:
            MaterialStateProperty.all<TextStyle>(TextStyle(color: Textcolor)),
      ),
    );
  }
}
