/* A page where a teacher or a student can view profile card
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/app_styles/object_view_style.dart';
import '../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/buttons/edit_button_cmp.dart';
import '../../../../../core/ui/widgets/buttons/expanded_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../menu/ui/widgets/app_menu_cmp.dart';
import '../../domain/riverpod/current_user_provider.dart';
import '../widgets/avatar.dart';

@RoutePage()
class ProfileViewScreen extends ConsumerWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(currentUserNotifierProvider.notifier);
    final state = ref.watch(currentUserNotifierProvider);

    if (state == null) return const LoadingLayout();

    final profile = state.record;

    return Scaffold(
      appBar: AppBar(
        title: Text('${l10n.labelMy} ${l10n.profileLabel}'),
        actions: const [
          AppMenuCmp(),
        ],
      ),
      body: ScreenContainerCmp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 24),
                  child: Avatar(
                    imageUrl: state.record.dbData.photoUrl,
                    onTap: controller.onEditPhoto,
                  ),
                ),
                Expanded(
                  child: Text(
                    profile.dbData.name,
                    style: ovTitleLargeStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: EditButtonCmp(
                    onPressed: controller.onEditRecord,
                  ),
                ),
              ],
            ),
            const SizedBox(height: spaceBetweenLines),
            Row(
              children: [
                SizedBox(
                  width: ovFirstColumnWidth,
                  child: Text(
                    '${l10n.profileFieldLabelEmail}:',
                    style: ovFieldLabelStyle,
                  ),
                ),
                Text(profile.dbData.email),
              ],
            ),
            const SizedBox(height: spaceBetweenLinesLarge),
            const SizedBox(height: spaceBetweenLinesLarge),
            Row(
              children: [
                ExpandedButtonCmp(
                  // ignore: lines_longer_than_80_chars
                  title: '${l10n.labelChange} ${l10n.profileFieldLabelPassword}',
                  onPressed: controller.onEditPassword,
                ),
              ],
            ),
          ],
        ),
      
      ),
      bottomNavigationBar: BottomButtonCmp(
        title: l10n.labelLogOut,
        color: Colors.redAccent,
        onPressed: controller.logOut,
      ),
    );
  }
}
