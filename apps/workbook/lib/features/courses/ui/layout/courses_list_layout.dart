/* A Layout fot courses_screen.dart
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../core/ui/widgets/overlay/circular_indicator.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../menu/ui/widgets/app_menu_cmp.dart';
import '../../../users/profile/domain/riverpod/user_repo_provider.dart';
import '../../domain/riverpod/courses_provider.dart';
import '../widgets/courses_list_cmp.dart';

class CoursesListLayout extends ConsumerWidget {
  const CoursesListLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final state = ref.watch(coursesNotifierProvider);
    final controller = ref.watch(coursesNotifierProvider.notifier);


    Future<void> onItemTap(course) async => 
      controller.onViewRecord(course: course);
    
    Future<void> onEditItem(course) async => 
      controller.onEditRecord(course: course);

    Future<void> onAddNewRecord() async => 
      controller.onAddRecord();


    return DisableScreenCmp(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.coursesLabelPlural),
          actions: const [
            AppMenuCmp(),
          ],
        ),
        body: ScreenContainerCmp(
          child: state.when(
            data: (listWrap) {
              // empty screen if user is logged out
              if(listWrap == null || state.isLoading) {
                return const SizedBox.shrink();
              }
        
              // courses data if logged in
              return CoursesListCmp(
                listWrap: listWrap,
                onTap: onItemTap,
                onEditTap: onEditItem,
              );
            },
            loading: () => const CircularIndicator(),
            error: (e, stack) {
              // ignore: lines_longer_than_80_chars
              final uiMsg = '${l10n.errFailedToLoad} ${l10n.coursesLabelPlural}';
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Utils.handleException(e, stack, 
                  'courses_list_layout: failed to load courses', 
                  snackbarErrMsg: uiMsg,
                );
              });
              return Center(child: Text(uiMsg));
            },
          ), 
        ),
        bottomNavigationBar: ref.read(userRepoProvider).isTeacher ?? false ? 
          BottomButtonCmp(
            title: '${l10n.labelAdd} ${l10n.courseLabel}', 
            onPressed: onAddNewRecord,
          ) : 
          const SizedBox.shrink(),
      ),
    );
  }
}
