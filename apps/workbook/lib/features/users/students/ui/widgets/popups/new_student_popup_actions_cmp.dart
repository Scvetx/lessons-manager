/* Custom Widget - new student: popup actions buttons
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/ui/widgets/buttons/outlined_rounded_button_cmp.dart';
import '../../../../../../core/utils/labels.dart';
import '../../../domain/riverpod/selected_student_provider.dart';

class NewStudentPopupActionsCmp extends ConsumerWidget {
  const NewStudentPopupActionsCmp({super.key, required this.formContext});
  final BuildContext formContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedStudentNotifierProvider.notifier);

    return OutlinedRoundedButtonCmp(
      title: l10n.labelContinue, 
      onPressed: controller.saveStudent,
    );
  }
}
