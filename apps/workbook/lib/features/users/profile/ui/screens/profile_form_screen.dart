// ignore_for_file: unused_import

/* A form where a teacher can create/edit a teacher
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/models/domain/scheme/cobject_form_scheme.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../core/ui/widgets/buttons/bottom_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/ui/widgets/containers/unfocus_container_cmp.dart';
import '../../../../../core/ui/widgets/popups/snack_bar_cmp.dart';
import '../../../../../core/ui/widgets/text/text_input_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../../auth/data/repository/firebase_auth_repo.dart';
import '../../../unauthorized/ui/layouts/err_logged_out_layout.dart';
import '../../domain/models/profile.dart';
import '../../domain/riverpod/current_user_provider.dart';
import 'profile_view_screen.dart';

@RoutePage()
class ProfileFormScreen extends ConsumerStatefulWidget {
  const ProfileFormScreen({
    super.key,
  });

  @override
  ConsumerState<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends ConsumerState<ProfileFormScreen> {
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
    final controller = ref.read(currentUserNotifierProvider.notifier);
    final state = ref.watch(currentUserNotifierProvider);

    if (state == null) return const LoadingLayout();

    final profile = state.record;

    return DisableScreenCmp(
      child: UnfocusContainerCmp(
        child: Scaffold(
          appBar: AppBar(
            title: Text('${l10n.labelEdit} ${l10n.profileLabel}'),
          ),
          body: ScreenContainerCmp(
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInputCmp(
                    placeholder: l10n.profileFieldLabelName,
                    curValue: profile.formData.name.value,
                    length: profile.formData.name.scheme.maxLength,
                    maxNumberOfLines: profile.formData.name
                                          .scheme.maxNumberOfLines, 
                    onChange: (val) => profile.formData.name.value = val,
                  ),
                  const SizedBox(height: spaceBetweenLinesSmall),
                  TextInputCmp(
                    placeholder: l10n.profileFieldLabelEmail,
                    curValue: profile.formData.email.value,
                    length: profile.formData.email.scheme.maxLength,
                    maxNumberOfLines: profile.formData.email
                                          .scheme.maxNumberOfLines,
                    onChange: (val) => profile.formData.email.value = val,
                  ),
                  const SizedBox(height: spaceBetweenLinesSmall),
                  Visibility(
                    visible: profile.formData.email.value != 
                                              profile.dbData.email,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        obscureText: true,
                        decoration: inputTextDecoration.copyWith(
                          hintText: l10n.labelInputPasswordHintText,
                        ),
                        controller: _passwordController,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
          bottomNavigationBar: BottomButtonCmp(
            title: l10n.labelSave,
            onPressed: () => controller.saveProfile(
              password: _passwordController.text,
            ),
          ),
        ),
      ),
    );
  }
}
