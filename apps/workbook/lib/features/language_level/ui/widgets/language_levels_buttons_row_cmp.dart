/* Custom Widget - a list of language levels presented as buttons in a row
*   (available language levels list is constant)
*/

import 'package:flutter/material.dart';
import '../../../../core/ui/widgets/data_buttons/index.dart';
import '../../constants/language_levels.dart';

class LanguageLevelsButtonsRowCmp extends StatelessWidget {
  const LanguageLevelsButtonsRowCmp({
    super.key, 
    this.label, 
    required this.isSelected, 
    required this.onSelect,
  });

  final String? label;
  final Function isSelected;
  final Function onSelect;

  List<ButtonWrap> get buttons => [
        for (final langLevel in languageLevels)
          ButtonWrap(
            key: langLevel.value,
            label: langLevel.value,
            selected: isSelected(langLevel.value),
            onSelect: onSelect,
          ),
      ];

  @override
  Widget build(BuildContext context) => 
      ButtonsRowCmp(label: label, buttons: buttons);
}
