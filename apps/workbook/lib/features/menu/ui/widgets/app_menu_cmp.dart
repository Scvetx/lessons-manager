/* Custom Widget - the main menu shown in the AppBar
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/utils/labels.dart';
import '../../../users/profile/domain/riverpod/user_repo_provider.dart';
import '../../constants/menu.dart';

class AppMenuCmp extends ConsumerWidget {
  const AppMenuCmp({super.key});

  static String? curTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final isTeacher = ref.watch(userRepoProvider).isTeacher;

    if(isTeacher == null) return const SizedBox.shrink();

    void navigateToScreen(BuildContext context, String routeName) {
      curTab = routeName;
      NavigationService.popUntilRoot();
      NavigationService.pushByRouteName(routeName);
    }

    return PopupMenuButton(
      constraints: const BoxConstraints(
        minWidth: 150,
      ),
      itemBuilder: (context) => isTeacher ? 
        teacherMenu(l10n) : 
        studentMenu(l10n),
      onSelected: (val) => navigateToScreen(context, val.toString()),
    );
  }
}