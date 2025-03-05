/* A Layout fot student_form_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../../core/ui/widgets/data_buttons/button_wrap.dart';
import '../../../../../core/ui/widgets/form/form_cmp.dart';
import '../../../../../core/ui/widgets/popups/popup_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../courses/ui/widgets/courses_buttons_row_cmp.dart';
import '../../../../courses/ui/widgets/courses_names_row_cmp.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../../language_level/ui/widgets/language_levels_buttons_row_cmp.dart';
import '../../domain/riverpod/selected_student_provider.dart';
import '../widgets/popups/new_student_popup_wrap.dart';

class StudentFormLayout extends ConsumerWidget {
  const StudentFormLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedStudentNotifierProvider.notifier);
    final state = ref.watch(selectedStudentNotifierProvider);
    
    if (state == null) return const LoadingLayout();
    
    final formData = state.formWrap.record.formData;

    void toNewStudentPopup() {
      controller.prepareToSave();
      if(state.formWrap.record.firstLoginPassword != null) {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) =>
              PopupCmp(wrap: NewStudentPopupWrap(formContext: context)),
        );
      }
    }

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title:
                // ignore: lines_longer_than_80_chars
                Text('${state.formWrap.isNew ? l10n.labelNew : l10n.labelEdit} ${l10n.studentLabel}'),
          ),
          body: ScreenContainerCmp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Visibility(
                  visible: state.record.dbData.isVerified,
                  child: Column(
                    children: [
                      Text(
                        state.record.formData.name.value, 
                        style: ovTitleLargeStyle,
                      ),
                      const SizedBox(height: spaceBetweenLinesLarge),
                    ],
                  ),
                ),
                FormCmp(
                  fieldsMap: state.formWrap.fieldsMap,
                  onChange: (key, value) => state.formWrap.fieldsMap.update(
                    key, 
                    (value) => value,
                  ),
                ),
                LanguageLevelsButtonsRowCmp(
                  label: '${l10n.languageLabelLevel}: ',
                  isSelected: (val) => formData.languageLevel.value == val,
                  onSelect: (ButtonWrap btn) {
                    formData.languageLevel.value = btn.selected ? btn.key : '';
                  },
                ),
                const SizedBox(height: spaceBetweenLinesSmall),
                LanguageLevelsButtonsRowCmp(
                  label: '${l10n.languageLabelGoal}: ',
                  isSelected: (val) => formData.goal.value == val,
                  onSelect: (ButtonWrap btn) {
                    formData.goal.value = btn.selected ? btn.key : '';
                  },
                ),
                const SizedBox(height: spaceBetweenLines),
                // --- parent courses info ---
                if(state.formWrap.showCoursesList)
                  CoursesButtonsRowCmp(
                    multipleSelect: true,
                    isSelected: (val) => state.formWrap.containsCourse(val),
                    onSelect: (ButtonWrap btn) {
                      if (btn.selected) {
                        state.formWrap.addCourse(btn.key);
                      } else {
                        state.formWrap.removeCourse(btn.key);
                      }
                    },
                  )
                else if (state.record.dbData.coursesIds.isNotEmpty) 
                  CoursesNamesRowCmp(
                    coursesIds: state.record.dbData.coursesIds,
                  ),
                
              ],
            ),
          ),
          bottomNavigationBar: BottomButtonCmp(
            title: l10n.labelSave,
            onPressed: state.formWrap.isNew ? 
              toNewStudentPopup : 
              controller.saveStudent,
          ),
        ),
      ),
    );
  }
}
