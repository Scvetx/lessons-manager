import 'package:flutter/material.dart';
import '../../../navigation/navigation_service.dart';
import '../../app_styles/app_style.dart';

class IconCloseCmp extends StatelessWidget {
  const IconCloseCmp({super.key});

  @override
  Widget build(BuildContext context) => const InkWell(
      onTap: NavigationService.pop,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(Icons.close, color: greyIconColor, size: 22),
    );
}
