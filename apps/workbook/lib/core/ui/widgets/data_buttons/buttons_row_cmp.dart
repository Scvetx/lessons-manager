/* Custom Widget - a list of buttons with data, presented in one row
*/

import 'package:flutter/material.dart';
import '../../../basic_data_types/string_ext.dart';
import '../../app_styles/object_view_style.dart';
import 'index.dart';

class ButtonsRowCmp extends StatefulWidget {
  /// a user can select one value only
  const ButtonsRowCmp({
      super.key, 
      this.label,
      required this.buttons,
    })
      : multipleSelect = false;

  // a user can select a few values
  const ButtonsRowCmp.multiSelect({
      super.key, 
      this.label,
      required this.buttons,
    })
      : multipleSelect = true;

  final String? label;
  final bool multipleSelect;
  final List<ButtonWrap> buttons;



  @override
  State<ButtonsRowCmp> createState() => _ButtonsRowCmpState();
}

class _ButtonsRowCmpState extends State<ButtonsRowCmp> {
  // process on button selected depending on multipleSelect value
  void handleSelect(ButtonWrap selectedBtn) {
    setState(() {
      for (final btn in widget.buttons) {
        // unselect all other buttons  if multipleSelect = false
        if (!widget.multipleSelect &&
            btn.selected &&
            btn.key != selectedBtn.key) {
          btn.selected = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomLeft,
    child: Wrap(
      spacing: 5, 
      children: [
        Container(
            child: widget.label.isBlank
                ? Container()
                : SizedBox(
                    width: ovFirstColumnWidth,
                    child: Text(widget.label!),
                  ),
        ),
        for (final btn in widget.buttons)
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: ButtonCircleCmp(btn: btn, onSelect: handleSelect),
          ),
      ],
    ),
  );
}
