/* A Layout fot course_form_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/layouts/loading_layout.dart';
import '../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../core/ui/widgets/form/form_cmp.dart';
import '../../../../core/utils/labels.dart';
import '../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../domain/riverpod/selected_course_provider.dart';

class CourseFormLayout extends ConsumerWidget {
  const CourseFormLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedCourseNotifierProvider.notifier);
    final state = ref.watch(selectedCourseNotifierProvider);
    if (state == null) return const LoadingLayout();

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              // ignore: lines_longer_than_80_chars
              '${state.formWrap.isNew ? l10n.labelNew : l10n.labelEdit} ${l10n.courseLabel}',
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
              ],
            ),
          ),
          bottomNavigationBar:
            BottomButtonCmp(
              title: l10n.labelSave, 
              onPressed: controller.saveCourse,
            ),
        ),
      ),
    );
  }
}
