import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import 'user_repo_provider.dart';

part 'user_photo_provider.g.dart';

@Riverpod(keepAlive: true)
class UserPhotoNotifier extends _$UserPhotoNotifier {
  @override
  File? build() => null;

  // ignore: use_setters_to_change_properties
  void setPhoto(File? newState) {
    state = newState;
  }  

  Future<void> changePic() async {
    try {
      ref.read(loadingPhoto.notifier).state = true; // Lock some widgets
      final pickedImage = await _pickImage();
      
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      if (pickedImage != null) await _uploadPhoto(pickedImage);
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to change photo picture', 
        snackbarErrMsg: l10n.profileErrFailedToLoadPhoto,
      );
    } finally {
      ref.read(loadingPhoto.notifier).state = false; // Unlock some widgets
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }


  Future<void> _uploadPhoto(File pickedImage) async {
    final userRepo = ref.read(userRepoProvider);
    final userId = userRepo.profileId!;
    final path = 'avatars/$userId';
    final imageRef = FirebaseStorage.instance.ref().child(path);
    await imageRef.putFile(pickedImage);
    final photoURL = await imageRef.getDownloadURL();
    final updatedProfile = userRepo.profile!.copy();
    updatedProfile.formData.photo.value = photoURL;
    await userRepo.updateUserPhoto(updatedProfile);
    await _logEventEditPic();
  }

  Future<File?> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final imageTemp = File(image.path);
    setPhoto(imageTemp);
    return imageTemp;
  }

// ---------- FIREBASE ANALYTICS -----------  
  Future<void> _logEventEditPic() async {
    await FirebaseAnalytics.instance.logSelectContent(
      contentType: 'image',
      itemId: 'profile_photo',
    );
  }
}

/// indicates that photo is loading
final loadingPhoto = StateProvider<bool>((ref) => false);