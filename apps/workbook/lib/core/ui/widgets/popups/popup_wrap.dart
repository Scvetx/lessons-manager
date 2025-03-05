import 'package:flutter/widgets.dart';

class PopupWrap {
  PopupWrap({
    required this.title, 
    required this.content, 
    required this.actions,
  });
  final Widget title;
  final Widget content;
  final Widget actions;
}
