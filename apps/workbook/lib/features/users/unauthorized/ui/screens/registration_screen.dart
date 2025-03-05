/* Teacher's registration form
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/widgets/buttons/rounded_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../domain/riverpod/unauthorized_provider.dart';

@RoutePage()
class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});
  
  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(unauthorizedNotifierProvider.notifier);


    void onNameChanged (value) {
      ref.read(
        unauthorizedNotifierProvider,
      )?.formWrap.record.formData.name.value = value;
    }

    void onEmailChanged (value) {
      ref.read(
        unauthorizedNotifierProvider,
      )?.formWrap.record.formData.email.value = value;
    }
    

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.labelRegistration),
          ),
          backgroundColor: Colors.white,
          body: ScreenContainerCmp(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputNameHintText,
                  ),
                  onChanged: onNameChanged,
                ),
                const SizedBox(height: spaceBetweenLines),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputEmailHintText,
                  ),
                  onChanged: onEmailChanged,
                ),
                const SizedBox(height: spaceBetweenLines),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.left,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputPasswordHintText,
                  ),
                  controller: _passwordController,
                ),
                const SizedBox(height: spaceBetweenLinesLarge),
                RoundedButtonCmp(
                  title: l10n.labelCreateAccount,
                  onPressed: () => controller.registerTeacherAccount(
                    password: _passwordController.text,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
