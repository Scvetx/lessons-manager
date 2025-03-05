import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/widgets/overlay/circular_indicator.dart';
import '../../domain/riverpod/disable_screen_provider.dart';

/// Custom Widget - used to disable screen 
/// when waiting for some process to finish
class DisableScreenCmp extends ConsumerWidget {
  const DisableScreenCmp({
    super.key, 
    required this.child, 
    this.disable,
  });
  final Widget child;
  final bool? disable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDisabled = disable ?? ref.watch(disableScreen);
    
    return Stack(
      children: [
        IgnorePointer(ignoring: isDisabled!, child: child),
        Visibility(
          visible: isDisabled,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.withValues(alpha: 0.3),
            child: const CircularIndicator(),
          ),
        ),
      ],
    );
  }
}
