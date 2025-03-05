// ignore_for_file: unused_import

/* login screen
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/navigation/constants/default_routes.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/widgets/buttons/link_text.dart';
import '../../../../../core/ui/widgets/buttons/rounded_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../../core/ui/widgets/popups/snack_bar_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../auth/data/repository/firebase_auth_repo.dart';
import '../../domain/riverpod/unauthorized_provider.dart';
import 'first_login_screen.dart';
import 'registration_screen.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    final controller = ref.read(unauthorizedNotifierProvider.notifier);
    
    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ScreenContainerCmp(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputEmailHintText,
                  ),
                ),
                const SizedBox(height: spaceBetweenLines),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: inputTextDecoration.copyWith(
                    hintText: l10n.labelInputPasswordHintText,
                  ),
                ),
                const SizedBox(height: spaceBetweenLines),
                RoundedButtonCmp(
                  title: l10n.labelLogIn, 
                  onPressed: () => controller.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                ),
                const SizedBox(height: spaceBetweenLinesSmall),
                Center(
                  child: LinkText(
                    text: l10n.labelRegisterButton,
                    onPressed: controller.toRegisterScreen,
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
