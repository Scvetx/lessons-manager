import 'package:flutter/material.dart';
import '../../app_styles/app_style.dart';
import 'icon_close_cmp.dart';
import 'popup_wrap.dart';

class PopupCmp extends StatelessWidget {
  const PopupCmp({
    super.key, 
    required this.wrap,
  });
  final PopupWrap wrap;

  @override
  Widget build(BuildContext context) => AlertDialog(
    backgroundColor: defaultHeaderColor,
    titlePadding: const EdgeInsets.all(14),
    contentPadding: const EdgeInsets.all(5),
    actionsPadding: const EdgeInsets.all(14),
    title: Stack(
      children: [
        const Positioned(
          right: 0,
          top: 0,
          child: IconCloseCmp(),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding( // Ensure space for close button at the right
            padding: const EdgeInsets.only(right: 40), 
            child: wrap.title,
          ),
        ),
      ],
    ),
    content: wrap.content,
    actions: [wrap.actions],
  );
}
