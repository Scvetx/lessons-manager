/* A Layout fot student_view_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../courses/ui/widgets/courses_names_row_cmp.dart';
import '../../domain/riverpod/selected_student_provider.dart';

class StudentViewLayout extends ConsumerWidget {
  const StudentViewLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedStudentNotifierProvider.notifier);
    final state = ref.watch(selectedStudentNotifierProvider);
    if (state == null) return const LoadingLayout();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.studentLabel),
      ),
      body: ScreenContainerCmp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    state.record.dbData.name,
                    style: ovTitleLargeStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: EditButtonCmp(
                    onPressed: controller.onEditRecord,
                  ),
                ),
              ],
            ),
            const SizedBox(height: spaceBetweenLines),
            Row(
              children: [
                SizedBox(
                  width: ovFirstColumnWidth,
                  child: Text(
                    '${l10n.profileFieldLabelEmail}:', 
                    style: ovFieldLabelStyle,
                  ),
                ),
                Text(state.record.dbData.email, style: ovLanguageLevelStyle),
              ],
            ),
            const SizedBox(height: spaceBetweenLines),
            Row(
              children: [
                SizedBox(
                  width: ovFirstColumnWidth,
                  child: Text('${l10n.languageLabelLevel}:',
                    style: ovFieldLabelStyle,
                  ),
                ),
                Text(
                  state.record.dbData.languageLevel,
                  style: ovLanguageLevelStyle,
                ),
              ],
            ),
            const SizedBox(height: spaceBetweenLines),
            Row(
              children: [
                SizedBox(
                  width: ovFirstColumnWidth,
                  child: Text(
                    '${l10n.languageLabelGoal}:', 
                    style: ovFieldLabelStyle,
                  ),
                ),
                Text(
                  state.record.dbData.goal,
                  style: ovLanguageLevelStyle,
                ),
              ],
            ),
            const SizedBox(height: spaceBetweenLinesLarge),
            CoursesNamesRowCmp(coursesIds: state.record.dbData.coursesIds),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonCmp(
        title: '${l10n.labelDeactivate} ${l10n.studentLabel}',
        color: Colors.redAccent,
        onPressed: controller.onDeactivateStudent,
      ),
    );
  }
}

