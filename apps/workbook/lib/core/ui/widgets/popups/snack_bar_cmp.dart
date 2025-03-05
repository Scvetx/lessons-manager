/* Custom Widget - a snackbar to show user platform messages in the app
*/

import 'package:flutter/material.dart';

class SnackBarCmp extends SnackBar {
  SnackBarCmp({
    super.key, 
    required this.text,
  })
      : super(
          content: Text(text),
          backgroundColor: Colors.grey.withValues(alpha: 0.3),
        );
  final String text;
}
