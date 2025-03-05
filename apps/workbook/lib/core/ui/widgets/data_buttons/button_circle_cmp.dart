/* Custom Widget - a button with data, presented as a text in a circle
*/

import 'package:flutter/material.dart';
import '../text/text_in_circle_cmp.dart';
import 'button_wrap.dart';

class ButtonCircleCmp extends StatefulWidget {
  const ButtonCircleCmp({
    super.key, 
    required this.btn, 
    this.onSelect,
  });
  final ButtonWrap btn;
  final Function? onSelect;
  @override
  State<ButtonCircleCmp> createState() => _ButtonCircleCmpState();
}

class _ButtonCircleCmpState extends State<ButtonCircleCmp> {
  final Color defaultColor = Colors.grey;
  final Color selectedColor = Colors.orangeAccent;

  bool _hovered = false;

  void _onHover(bool hovered) =>
      setState(() => hovered ? _onStartHover() : _onStopHover());

  void _onStartHover() => _hovered = true;
  void _onStopHover() => _hovered = false;

  void _onSelect() {
    widget.onSelect?.call(widget.btn);
    setState(() => widget.btn.onSelect());
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.btn.selected ? selectedColor : defaultColor;
    final color = _hovered ? baseColor.withValues(alpha: 0.7) : baseColor;

    return InkWell(
      onTap: _onSelect,
      onHover: _onHover,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: TextInCircleCmp(
        text: widget.btn.label, 
        frameColor: color, 
        textColor: color,
      ),
    );
  }
}
