/* A Layout fot lessons_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../core/ui/widgets/overlay/circular_indicator.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../courses/domain/riverpod/selected_course_provider.dart';
import '../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../menu/ui/widgets/app_menu_cmp.dart';
import '../../../users/profile/domain/riverpod/user_repo_provider.dart';
import '../../domain/models/state/lessons_list_wrap.dart';
import '../../domain/riverpod/lessons_provider.dart';
import '../widgets/lessons_list_cmp.dart';

class LessonsListLayout extends ConsumerWidget {
  const LessonsListLayout({
    super.key,
    this.courseId,
  }) :
    isRelatedToCourse = courseId != null;

  final String? courseId;

  /// true if the lessons layout is opened from a related course
  final bool isRelatedToCourse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;

    final controller = ref.watch(lessonsNotifierProvider.notifier);

    final state = isRelatedToCourse ? 
      // lessons related to the course provider
      ref.watch(courseRelatedLessonsNotifierProvider) : 
      // all lessons provider
      ref.watch(lessonsNotifierProvider);


    Future<void> onItemTap(lesson) async => 
      controller.onViewRecord(lesson: lesson);
    
    Future<void> onEditItem(lesson) async => 
      controller.onEditRecord(lesson: lesson);

    Future<void> onAddNewRecord() async => 
      controller.onAddRecord(courseId: courseId);


    return DisableScreenCmp(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.lessonsLabelPlural),
          actions: isRelatedToCourse ? null : const [AppMenuCmp()],
        ),
        body: ScreenContainerCmp(
          child: state.when(
            data: (listWrap) {
              // empty screen if user is logged out
              if(listWrap == null || state.isLoading) {
                return const SizedBox.shrink();
              }
              
              // lessons data if logged in
              // if lessonsIds param is not null then 
              // get listWrap with related lessons 
              final listWrapFiltered = isRelatedToCourse ?
                RelatedLessonsListWrap(
                  parentId: courseId!,
                  recordsMap: listWrap.recordsMap,
                ) :
                listWrap;
        
              return LessonsListCmp(
                listWrap: listWrapFiltered,
                onTap: onItemTap,
                onEditTap: onEditItem,
              );
            },
            loading: () => const CircularIndicator(),
            error: (e, stack) {
              // ignore: lines_longer_than_80_chars
              final uiMsg = '${l10n.errFailedToLoad} ${l10n.lessonsLabelPlural}';
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Utils.handleException(e, stack, 
                  'lessons_list_layout: failed to load lessons', 
                  snackbarErrMsg: uiMsg,
                );
              });
              return Center(child: Text(uiMsg));
            },
          ),
        ),
      bottomNavigationBar: ref.read(userRepoProvider).isTeacher ?? false ?
          BottomButtonCmp(
            title: '${l10n.labelAdd} ${l10n.lessonLabel}', 
            onPressed: onAddNewRecord,
          ) :
          null,
      ),
    );
  }
}
