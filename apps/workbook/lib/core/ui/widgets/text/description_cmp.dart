/* Custom Widget - grey small text
*/

import 'package:flutter/material.dart';

class DescriptiontCmp extends StatelessWidget {
  const DescriptiontCmp({
    super.key, 
    required this.text, 
    this.color = Colors.grey,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}
