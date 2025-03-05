

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/widgets/buttons/rounded_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../profile/domain/riverpod/current_user_provider.dart';

/// This screen appears when a student is logging in for the first time.
/// The first login requires to change a temporary password 
/// generated for the student
@RoutePage()
class FirstLoginScreen extends ConsumerStatefulWidget {
  const FirstLoginScreen({super.key});

  @override
  ConsumerState<FirstLoginScreen> createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends ConsumerState<FirstLoginScreen> {
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(currentUserNotifierProvider.notifier);
    
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${l10n.labelNew} ${l10n.profileFieldLabelPassword}'),
        ),
        body: ScreenContainerCmp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  l10n.labelNewPasswordDescription,
                  style: mBlackLongText,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: spaceBetweenLinesLarge),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: inputTextDecoration.copyWith(
                  hintText: l10n.labelInputNewPasswordHintText,
                ),
              ),
              const SizedBox(height: spaceBetweenLines),
              RoundedButtonCmp(
                title: '${l10n.labelChange} ${l10n.profileFieldLabelPassword}',
                onPressed: () => controller.updateStudentPasswordOnFirstLogin(
                  newPassword: _newPasswordController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
