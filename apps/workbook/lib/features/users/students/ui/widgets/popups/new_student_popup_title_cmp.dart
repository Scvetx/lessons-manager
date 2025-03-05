/* Custom Widget - new student: popup title
*/

import 'package:flutter/material.dart';
import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../../core/utils/labels.dart';

class NewStudentPopupTitleCmp extends StatelessWidget {
  const NewStudentPopupTitleCmp({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    return Text(l10n.labelNewStudentPopupTitle, style: whiteText);
  }
}
