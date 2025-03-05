/* A Layout fot lesson_form_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/app_styles/app_style.dart';
import '../../../../core/ui/layouts/loading_layout.dart';
import '../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../core/ui/widgets/data_buttons/button_wrap.dart';
import '../../../../core/ui/widgets/form/form_cmp.dart';
import '../../../../core/utils/labels.dart';
import '../../../courses/ui/widgets/courses_buttons_row_cmp.dart';
import '../../../courses/ui/widgets/parent_course_info.dart';
import '../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../language_level/ui/widgets/language_levels_buttons_row_cmp.dart';
import '../../domain/riverpod/selected_lesson_provider.dart';

class LessonFormLayout extends ConsumerWidget {
  const LessonFormLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedLessonNotifierProvider.notifier);
    final state = ref.watch(selectedLessonNotifierProvider);
    if (state == null) return const LoadingLayout();

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              // ignore: lines_longer_than_80_chars
              '${state.formWrap.isNew ? l10n.labelNew : l10n.labelEdit} ${l10n.lessonLabel}',
            ),
          ),
          body: ScreenContainerCmp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                FormCmp(
                  fieldsMap: state.formWrap.fieldsMap,
                  onChange: (key, value) => state.formWrap.fieldsMap.update(
                    key, 
                    (value) => value,
                  ),
                ),
                LanguageLevelsButtonsRowCmp(
                  label: '${l10n.languageLabelLevel}: ',
                  isSelected: (val) => 
                    state.record.formData.languageLevel.value == val,
                  onSelect: (ButtonWrap btn) {
                    state.record.formData.languageLevel.value = 
                        btn.selected ? btn.key : '';
                  },
                ),
                const SizedBox(height: spaceBetweenLines),
                // selectable courses
                if(state.formWrap.showCoursesList)
                  CoursesButtonsRowCmp(
                    multipleSelect: false,
                    isSelected: (val) => state.formWrap.courseId == val,
                    onSelect: (ButtonWrap btn) {
                      state.formWrap.courseId = btn.selected ? btn.key : null;
                    },
                  )
                // course info text
                else if(state.record.dbData.courseId != null)
                  // if selecting courses is not allowed, because the lesson
                  // was created from a course then show this course info
                  ParentCourseInfo(courseId: state.record.dbData.courseId!),
              ],
            ),
          ),
          bottomNavigationBar:
              BottomButtonCmp(
                title: l10n.labelSave, 
                onPressed: controller.saveLesson,
              ),
        ),
      ),
    );
  }
}
