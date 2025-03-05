/* A Layout to show lock a screen while waiting for some process
*/

import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>  const Center(
    child: CircularProgressIndicator.adaptive(),
  );
}
