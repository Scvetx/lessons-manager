/* Custom Widget - a list of courses presented as buttons in a row
*   (only courses added to the teacher's library are shown)
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/widgets/data_buttons/index.dart';
import '../../../../core/ui/widgets/overlay/circular_indicator.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/models/course.dart';
import '../../domain/riverpod/courses_provider.dart';

class CoursesButtonsRowCmp extends ConsumerWidget {
  const CoursesButtonsRowCmp({
    super.key, 
    required this.multipleSelect,
    required this.isSelected,
    required this.onSelect,
  });
  final bool multipleSelect;
  final Function isSelected;
  final Function onSelect;

  List<ButtonWrap> getButtons(List<Course> courses) => [
    for (final course in courses)
      ButtonWrap(
        key: course.id!,
        label: course.formData.name.value,
        data: course,
        selected: isSelected(course.id),
        onSelect: onSelect,
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(coursesNotifierProvider);

    return state.when(
      data: (listWrap) => 
        // empty screen if user is logged out
        listWrap == null || state.isLoading ? const SizedBox.shrink() :
        // courses data if logged in
        multipleSelect ?
          // user can select a few courses
          ButtonsRowCmp.multiSelect(
            buttons: getButtons(listWrap.records),
          ) :
          // user can select one course only
          ButtonsRowCmp(
            buttons: getButtons(listWrap.records),
          ),
      loading: () => const CircularIndicator(),
      error: (e, stack) {
        final l10n = getIt<Labels>().l10n;
        final uiMsg = '${l10n.errFailedToLoad} ${l10n.coursesLabelPlural}';
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Utils.handleException(e, stack, 
            'courses_buttons_row_cmp: failed to load courses', 
            snackbarErrMsg: uiMsg,
          );
        });
        return Center(child: Text(uiMsg));
      },
    );
  }
}
