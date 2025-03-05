/* Custom Widget - text input used in forms
*/

import 'package:flutter/material.dart';

import '../../../basic_data_types/numbers_helper.dart';
import '../../app_styles/app_style.dart';

class TextInputCmp extends StatefulWidget {
  const TextInputCmp({
    super.key, 
    required this.placeholder,
    required this.curValue,
    this.length,
    this.maxNumberOfLines,
    required this.onChange,
  });

  final String placeholder;
  final String curValue;
  final int? length;
  final int? maxNumberOfLines;
  final Function(String value) onChange;

  @override
  State<TextInputCmp> createState() => _TextInputCmpState();
}

class _TextInputCmpState extends State<TextInputCmp> {
  late TextEditingController _controller;
  late int _minLines;
  late int _maxLines;
  late String curValue;
  

  void _initLinesLimits() {
    // get needed number of lines by text length limit
    int minNumberOfLines = _getMinNumberOfLinesByLength();
    // ensure that input max number of lines is not exceeded
    if (widget.maxNumberOfLines != null) {
      minNumberOfLines = NumbersHelper.getSmallestInt(
        widget.maxNumberOfLines!, minNumberOfLines,
      );
    }
    _minLines = minNumberOfLines;
    _maxLines = widget.maxNumberOfLines ?? _minLines + 5;
  }

  int _getMinNumberOfLinesByLength() {
    const maxVal = 4;
    return widget.length == null
        // max number of lines if text length limit wasn't provided
        ? maxVal
        // 1 line if text length limit <= 50
        : widget.length! <= 50
            ? 1
            // 2 lines if text length limit <= 100
            : widget.length! <= 100
                ? 2
                // max number of lines if text length limit > 100
                : maxVal;
  }

  TextInputType get inputType => widget.length == null || widget.length! <= 50
      ? TextInputType.text
      : TextInputType.multiline;

  void _initController() {
    _controller = TextEditingController.fromValue(
      TextEditingValue(text: widget.curValue),
    );

    _controller.addListener(() {
      if (_controller.text.length <= widget.length!) {
        widget.onChange(_controller.text);
      } else {
        _controller.text = _controller.text.substring(0, widget.length!- 1);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initLinesLimits();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      TextField(
        controller: _controller,
        //maxLength: widget.length, // doesn't work in android: replaced with controller listener
        textAlign: TextAlign.left,
        minLines: _minLines,
        maxLines: _maxLines,
        keyboardType: inputType,
        decoration: inputTextDecoration.copyWith(hintText: widget.placeholder),
      ),
    ],
  );
}
