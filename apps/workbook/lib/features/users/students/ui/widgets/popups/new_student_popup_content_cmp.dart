/* Custom Widget - new student: popup content
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../../core/utils/labels.dart';
import '../../../domain/riverpod/selected_student_provider.dart';

class NewStudentPopupContentCmp extends ConsumerWidget {
  const NewStudentPopupContentCmp({super.key, required this.formContext});
  final BuildContext formContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final state = ref.watch(selectedStudentNotifierProvider);
    if (state == null) return const LoadingLayout();

    final formData = state.formWrap.record.formData;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(l10n.labelNewStudentPopupText, style: sGreyText),
            ),
            const SizedBox(height: spaceBetweenLines),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(l10n.labelUserLogin, style: mGreyLabel),
                  ),
                  Text(formData.email.value, style: mGreyText),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      l10n.profileFieldLabelPassword, 
                      style: mGreyLabel,
                    ),
                  ),
                  Text(state.formWrap.record.firstLoginPassword!,
                      style: mGreyText,
                  ),
                ],
              ),
            ),
            const SizedBox(height: spaceBetweenLines),
          ],
        ),
      ),
    );
  }
}
