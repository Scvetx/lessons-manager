/* Custom Widget - a button used in the bottom of the screen
*/

import 'package:flutter/material.dart';

class EditButtonCmp extends StatelessWidget {
  const EditButtonCmp({super.key, required this.onPressed});
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.edit),
        iconSize: 16,
        onPressed: onPressed,
      ),
    );
}
