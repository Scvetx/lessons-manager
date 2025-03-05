/* A Layout fot lesson_view_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/app_styles/app_style.dart';
import '../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../core/ui/layouts/loading_layout.dart';
import '../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../core/ui/widgets/text/description_cmp.dart';
import '../../../../core/utils/labels.dart';
import '../../../courses/ui/widgets/parent_course_info.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/riverpod/selected_lesson_provider.dart';

class LessonViewLayout extends ConsumerWidget {
  const LessonViewLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedLessonNotifierProvider.notifier);
    final state = ref.watch(selectedLessonNotifierProvider);
    if (state == null) return const LoadingLayout();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.lessonLabel),
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
                    style: ovTitleMediumStyle,
                  ),
                ),
                Visibility(
                  visible: getIt<UserRepository>().isTeacher ?? false,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: EditButtonCmp(
                      onPressed: controller.onEditRecord,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: state.record.dbData.description.isNotEmpty,
              child: Column(
                children: [
                  const SizedBox(height: spaceBetweenLines),
                  DescriptiontCmp(text: state.record.dbData.description),
                ],
              ),
            ),
            const SizedBox(height: spaceBetweenLines),
            Row(
              children: [
                SizedBox(
                  width: ovFirstColumnWidth,
                  child: Text(
                    '${l10n.languageLabelLevel}:',
                    style: ovFieldLabelStyle,
                  ),
                ),
                Text(
                  state.record.dbData.languageLevel,
                  style: ovLanguageLevelStyle,
                ),
              ],
            ),
            // --- parent course info ---
            if(state.record.dbData.courseId != null)
              const SizedBox(height: spaceBetweenLines),
            if(state.record.dbData.courseId != null)
              ParentCourseInfo(courseId: state.record.dbData.courseId!),

          ],
        ),
      ),
      bottomNavigationBar: getIt<UserRepository>().isTeacher ?? false
          ? BottomButtonCmp(
              title: '${l10n.labelDelete} ${l10n.lessonLabel}',
              color: Colors.redAccent,
              onPressed: controller.onDelete,
            )
          : null,
    );
  }
}
