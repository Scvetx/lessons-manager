/* A page to edit a photo on profile
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/ui/app_styles/app_style.dart';
import '../../../../../core/ui/layouts/loading_layout.dart';
import '../../../../../core/ui/widgets/buttons/outlined_rounded_button_cmp.dart';
import '../../../../../core/ui/widgets/containers/screen_container_cmp.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../disable_screen/ui/widgets/disable_screen_cmp.dart';
import '../../domain/riverpod/current_user_provider.dart';
import '../../domain/riverpod/user_photo_provider.dart';
import '../widgets/avatar.dart';

@RoutePage()
class PhotoEditScreen extends ConsumerStatefulWidget {
  const PhotoEditScreen({super.key});

  @override
  ConsumerState<PhotoEditScreen> createState() => _PhotoEditScreenState();
}

class _PhotoEditScreenState extends ConsumerState<PhotoEditScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = getIt<Labels>().l10n;
    final state = ref.watch(currentUserNotifierProvider);

    final controller = ref.watch(userPhotoNotifierProvider.notifier);

    if (state == null) return const LoadingLayout();

    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('${l10n.labelMy} ${l10n.profileFieldLabelPhoto}'),
      ),
      body: DisableScreenCmp(
        child: ScreenContainerCmp(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                children: [
                  Avatar(
                    imageUrl: state.record.dbData.photoUrl,
                    width: sw / 2.5,
                    widthPlaceholder: sw/ 3,
                    isLoading: ref.watch(loadingPhoto),
                  ),
                  const SizedBox(height: spaceBetweenLines),
                  const SizedBox(height: spaceBetweenLines),
                  SizedBox(
                    width: sw / 1.5,
                    child: OutlinedRoundedButtonCmp(
                      // ignore: lines_longer_than_80_chars
                      title: '${l10n.labelChange} ${l10n.profileFieldLabelPhoto}',
                      onPressed: () => ref.watch(loadingPhoto) ? null : 
                          controller.changePic(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
