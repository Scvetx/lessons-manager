/* Custom Widget - a container with edge padding for screens
*/

import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';

class ScreenContainerCmp extends StatelessWidget {
  const ScreenContainerCmp({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: screenPadding, 
    child: child,
  );
}
