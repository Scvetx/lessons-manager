/* Custom Widget - a clickable section button on the screen
*/

import 'package:flutter/material.dart';

class SectionTitleButtonCmp extends StatelessWidget {
  const SectionTitleButtonCmp({
    super.key, 
    required this.title, 
    required this.onPressed,
  });
  
  final String title;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withValues(alpha: 0.5),
            Colors.grey.withValues(alpha: 0.3),
          ],
          // ignore: avoid_redundant_argument_values
          begin: Alignment.centerLeft,
           // ignore: avoid_redundant_argument_values
          end: Alignment.centerRight,
        ),
        color: Colors.grey.withValues(alpha: 0.05),
        // ignore: avoid_redundant_argument_values
        border: Border.all(width: 1, color: Colors.grey.withValues(alpha: 0.2)),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 1.5,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}
