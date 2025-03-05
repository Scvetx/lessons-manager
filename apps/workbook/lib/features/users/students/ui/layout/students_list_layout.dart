/* A Layout fot students_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/overlay/circular_indicator.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../courses/domain/riverpod/selected_course_provider.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../../menu/ui/widgets/app_menu_cmp.dart';
import '../../domain/models/state/students_list_wrap.dart';
import '../../domain/riverpod/students_provider.dart';
import '../widgets/students_list_cmp.dart';

class StudentsListLayout extends ConsumerWidget {
  const StudentsListLayout({
    super.key,
    this.courseId,
  }) :
     isRelatedToCourse = courseId != null;
  final String? courseId;

  /// true if the students layout is opened from a related course
  final bool isRelatedToCourse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;

    final controller = 
      ref.watch(studentsNotifierProvider.notifier);

    final state = isRelatedToCourse ? 
      // students related to the course provider
      ref.watch(courseRelatedStudentsNotifierProvider) : 
      // all students provider
      ref.watch(studentsNotifierProvider);
      

    Future<void> onItemTap(student) async => 
      controller.onViewRecord(student: student);
    
    Future<void> onEditItem(student) async => 
      controller.onEditRecord(student: student);

    Future<void> onAddNewRecord() async => 
      controller.onAddRecord(courseId: courseId);


    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.studentsLabelPlural),
        actions: isRelatedToCourse ? null : const [AppMenuCmp()],
      ),
      body: DisableScreenCmp(
        child: ScreenContainerCmp(
          child: state.when(
            data: (listWrap) {
              // empty screen if user is logged out
              if(listWrap == null || state.isLoading) {
                return const SizedBox.shrink();
              }
        
              // students data if logged in
              // if courseId param is not null then 
              // get listWrap with related students 
              final listWrapFiltered = isRelatedToCourse ?
                  RelatedStudentsListWrap(
                    parentId: courseId!,
                    recordsMap: listWrap.recordsMap,
                  ) :
                  listWrap;
        
              return StudentsListCmp(
                listWrap: listWrapFiltered,
                onTap: onItemTap,
                onEditTap: onEditItem,
              );
            },
            loading: () => const CircularIndicator(),
            error: (e, stack) {
              // ignore: lines_longer_than_80_chars
              final uiMsg = '${l10n.errFailedToLoad} ${l10n.studentsLabelPlural}';
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Utils.handleException(e, stack, 
                  'students_list_layout: failed to load students', 
                  snackbarErrMsg: uiMsg,
                );
              });
              return Center(child: Text(uiMsg));
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomButtonCmp(
        title: '${l10n.labelAdd} ${l10n.studentLabel}',
        onPressed: onAddNewRecord,
      ),
    );
  }
}
