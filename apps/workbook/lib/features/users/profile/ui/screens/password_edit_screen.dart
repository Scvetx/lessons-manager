/* Change user's password screen
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../domain/riverpod/current_user_provider.dart';

@RoutePage()
class PasswordEditScreen extends ConsumerStatefulWidget {
  const PasswordEditScreen({super.key});

  @override
  ConsumerState<PasswordEditScreen> createState() => _PasswordEditScreenState();
}

class _PasswordEditScreenState extends ConsumerState<PasswordEditScreen> {
  late TextEditingController _newPasswordController;
  late TextEditingController _oldPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _oldPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _oldPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(currentUserNotifierProvider.notifier);

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '${l10n.labelChange} ${l10n.profileFieldLabelPassword}',
            ),
          ),
          body: ScreenContainerCmp(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputNewPasswordHintText,
                  ),
                ),
                const SizedBox(height: spaceBetweenLines),
                TextField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputOldPasswordHintText,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomButtonCmp(
            title: l10n.labelSave,
            onPressed: () => controller.updatePassword(
              oldPassword: _oldPasswordController.text, 
              newPassword: _newPasswordController.text,
            ),
          ),
        ),
      ),
    );
  }
}
