import '../../../../../core/models/domain/cobject.dart';
import '../../data/models/profile_db_object.dart';
import 'profile_form_data.dart';

abstract class Profile extends CObject {
  
// ----- FORM DATA -----
  @override
  ProfileDBData get dbData;

// ----- FORM DATA -----
  @override
  ProfileFormData get formData;

// ----- COPY OBJECT METHOD -----
  /// returns current Teacher obj copy as a new Instance of Teacher
  /// used while updating Teacher to store the old value
  Profile copy({
    String? nameValue, 
    String? userId,
    String? photoUrl,
  });
}
