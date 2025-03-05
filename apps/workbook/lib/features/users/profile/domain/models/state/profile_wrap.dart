import '../../../../../../core/models/domain/state/cobject_wrap.dart';
import '../profile.dart';
import 'profile_form_wrap.dart';

abstract class ProfileWrap extends CObjectWrap {
  
  @override
  Profile get record;

  @override
  bool get isNew;

  @override
  ProfileFormWrap get formWrap;
}

