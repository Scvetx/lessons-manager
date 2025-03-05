/* A Layout fot course_view_screen.dart
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
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/riverpod/selected_course_provider.dart';
import '../widgets/related_lessons_button.dart';
import '../widgets/related_students_button.dart';

class CourseViewLayout extends ConsumerWidget {
  const CourseViewLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedCourseNotifierProvider.notifier);
    final state = ref.watch(selectedCourseNotifierProvider);

    if (state == null) return const LoadingLayout();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.courseLabel),
      ),
      body: ScreenContainerCmp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(state.record.dbData.name,
                    style: ovTitleLargeStyle,
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
            const SizedBox(height: spaceBetweenLinesSmall),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RelatedStudentsButton(),
                RelatedLessonsButton(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: getIt<UserRepository>().isTeacher ?? false
          ? BottomButtonCmp(
              title: '${l10n.labelDelete} ${l10n.courseLabel}',
              color: Colors.redAccent,
              onPressed: controller.onDelete,
            )
          : null,
    );
  }
}
