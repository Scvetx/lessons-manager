/* Custom Widget - clickable text
*/

import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    super.key, 
    required this.text, 
    required this.onPressed,
  });

  final String text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressed,
    child: Text(
      text,
      style: const TextStyle(color: defaultButtonColor),
    ),
  );
}
