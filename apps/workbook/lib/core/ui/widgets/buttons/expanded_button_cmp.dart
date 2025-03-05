/* Custom Widget - a button expanded on all width (for buttons list)
*/

import 'package:flutter/material.dart';

class ExpandedButtonCmp extends StatelessWidget {
  const ExpandedButtonCmp({
    super.key, 
    required this.title, 
    required this.onPressed,
  });
  final String title;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) => Expanded(
      child: Material(
        elevation: 2,
        color: Colors.white,
        child: MaterialButton(
          onPressed: onPressed,
          height: 42,
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
}
