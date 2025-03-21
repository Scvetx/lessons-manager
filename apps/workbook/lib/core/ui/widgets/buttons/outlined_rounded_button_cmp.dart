/* Custom Widget - a button with rounded borders and white background
*/

import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';

class OutlinedRoundedButtonCmp extends StatelessWidget {
  const OutlinedRoundedButtonCmp({
    super.key, 
    required this.title, 
    required this.onPressed,
  });
  final String title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: defaultButtonPadding,
        side: const BorderSide(color: defaultButtonColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(roundedButtonRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: defaultButtonColor, 
          fontWeight: FontWeight.w500,
        ),
      ),
    );
}
