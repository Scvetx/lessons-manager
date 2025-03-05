import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/app_styles/app_style.dart';
import '../../../../core/ui/widgets/buttons/section_button_cmp.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/riverpod/selected_course_provider.dart';

class RelatedStudentsButton extends ConsumerWidget {
  const RelatedStudentsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(selectedCourseNotifierProvider.notifier);
    final relatedStudentsState = ref.watch(
      courseRelatedStudentsNotifierProvider,
    );

    return relatedStudentsState.when(
      data: (data) {
        final numberOfStudents = data?.records.length ?? 0;
        return Visibility(
          visible: getIt<UserRepository>().isTeacher ?? false,
          child: Padding(
            padding: const EdgeInsets.only(top: spaceBetweenLines),
            child: SectionTitleButtonCmp(
              title: '${l10n.studentsLabelPlural}: $numberOfStudents',
              onPressed: controller.toRelatedStudents,
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
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