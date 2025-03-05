/* Custom Widget - a button with rounded borders
*/

import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';

class RoundedButtonCmp extends StatelessWidget {
  const RoundedButtonCmp({
    super.key, 
    required this.title,
    this.color = defaultButtonColor,
    required this.onPressed,
  });

  final Color color;
  final String title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) => Material(
    elevation: 5,
    color: color,
    borderRadius: BorderRadius.circular(roundedButtonRadius),
    child: MaterialButton(
      padding: defaultButtonPadding,
      onPressed: onPressed,
      child: Text(title, style: whiteText),
    ),
  );
}
