/* A Layout to show lock a screen while waiting for some process
*/

import 'package:flutter/material.dart';
import '../../../features/menu/ui/widgets/app_menu_cmp.dart';
import '../widgets/overlay/circular_indicator.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({
    super.key, 
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        actions: const [
          AppMenuCmp(),
        ],
      ),
      body: const CircularIndicator(),
    );
}
