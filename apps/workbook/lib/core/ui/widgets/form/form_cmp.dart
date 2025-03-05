/* Custom Widget - a list of text inputs to create/edit records on forms
*/

import 'package:flutter/material.dart';
import '../../../models/domain/scheme/cfield.dart';
import '../../app_styles/app_style.dart';
import '../text/text_input_cmp.dart';

class FormCmp extends StatefulWidget {
  const FormCmp({
    super.key,
    required this.fieldsMap, 
    required this.onChange,
  });
  final Map<String, TextCField> fieldsMap;
  final dynamic Function(String, String) onChange;

  @override
  State<FormCmp> createState() => _FormCmpState();
}

class _FormCmpState extends State<FormCmp> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (final textField in widget.fieldsMap.values)
        Column(children: [
          TextInputCmp(
            placeholder: textField.scheme.label,
            length: textField.scheme.maxLength,
            maxNumberOfLines: textField.scheme.maxNumberOfLines,
            curValue: textField.value,
            onChange: (value) {
              setState(() {
                textField.value = value;
              });
              widget.onChange(textField.scheme.key, textField.value);
            },
          ),
          const SizedBox(
            height: spaceBetweenLines,
          ),
        ],
      ),
    ],
  );
}
