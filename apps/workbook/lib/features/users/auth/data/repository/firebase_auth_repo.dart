/* Helpful dart code to work with Firebase Auth features (User objects)
*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:random_password_generator/random_password_generator.dart';

@lazySingleton
class FirebaseAuthRepository {  
  FirebaseAuth get auth => FirebaseAuth.instance;
  User? get user => auth.currentUser;
  String? get userId => user?.uid;
  bool get loggedIn => auth.currentUser != null;

  //using onNavigation in router config
  // on user logged out event
  Stream<User?> streamUserLoggedOut() => auth.idTokenChanges();
  

  // additional authenticate user  (if sesnitive user data is being changed)
  Future<void> reauthenticateUser(String password) async {
    if (loggedIn) {
      final email = user!.email!;
      final credential = EmailAuthProvider.credential(
        email: email, 
        password: password,
      );
      await user!.reauthenticateWithCredential(credential);
    }
  }

  // generate a random password with 8 chars
  String generatePassword() {
    final passwordGenerator = RandomPasswordGenerator();
    final newPassword = passwordGenerator.randomPassword(
        // ignore: avoid_redundant_argument_values
        letters: true,
        numbers: true,
        passwordLength: 6,
        // ignore: avoid_redundant_argument_values
        specialChar: false,
        uppercase: true,
      );
    return newPassword;
  }

  // create a new user without sighning in right after the creation
  Future<User?> createUserWithoutSigningIn(
    String email, 
    String password,
  ) async {
    final app = await Firebase.initializeApp(
      name: 'CreateStudent', 
      options: Firebase.app().options,
    );
    final newUserCred = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(email: email, password: password);
    await app.delete();
    return newUserCred.user;
  }

  // log out
  Future<void> logOut() => auth.signOut();
  
  // update user name
  Future<void> updateUserName(String newName) async =>
      await user?.updateDisplayName(newName);
  // update user email
  Future<void> updateUserEmail(String newEmail) async =>
      await user?.verifyBeforeUpdateEmail(newEmail);
  // update user avatar photo url
  Future<void> updateUserPhotoURL(String newURL) async =>
      await user?.updatePhotoURL(newURL);
  // update user password
  Future<void> updatePassword(String newPassword) async =>
      await user?.updatePassword(newPassword);
}
