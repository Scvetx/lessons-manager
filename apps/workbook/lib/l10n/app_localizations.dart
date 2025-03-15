import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @labelSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get labelSave;

  /// No description provided for @labelEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get labelEdit;

  /// No description provided for @labelAdd.
  ///
  /// In en, this message translates to:
  /// **'Add a'**
  String get labelAdd;

  /// No description provided for @labelChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get labelChange;

  /// No description provided for @labelDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete the'**
  String get labelDelete;

  /// No description provided for @labelDeactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate the'**
  String get labelDeactivate;

  /// No description provided for @labelNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get labelNew;

  /// No description provided for @labelCard.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get labelCard;

  /// No description provided for @labelMy.
  ///
  /// In en, this message translates to:
  /// **'My'**
  String get labelMy;

  /// No description provided for @labelRelated.
  ///
  /// In en, this message translates to:
  /// **'Related'**
  String get labelRelated;

  /// No description provided for @labelContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get labelContinue;

  /// No description provided for @labelCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get labelCancel;

  /// No description provided for @labelPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again'**
  String get labelPleaseTryAgain;

  /// No description provided for @labelLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get labelLogIn;

  /// No description provided for @labelLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get labelLogOut;

  /// No description provided for @labelRegistration.
  ///
  /// In en, this message translates to:
  /// **'New Teacher Account'**
  String get labelRegistration;

  /// No description provided for @labelCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get labelCreateAccount;

  /// No description provided for @labelInputNameHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get labelInputNameHintText;

  /// No description provided for @labelInputEmailHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get labelInputEmailHintText;

  /// No description provided for @labelInputPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get labelInputPasswordHintText;

  /// No description provided for @labelInputNewPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get labelInputNewPasswordHintText;

  /// No description provided for @labelInputOldPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter old password'**
  String get labelInputOldPasswordHintText;

  /// No description provided for @labelEnterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password below:'**
  String get labelEnterNewPassword;

  /// No description provided for @labelNewPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'At the time of your first login change the temporary password provided by your teacher:'**
  String get labelNewPasswordDescription;

  /// No description provided for @labelRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up as a Teacher >'**
  String get labelRegisterButton;

  /// No description provided for @labelLoginButton.
  ///
  /// In en, this message translates to:
  /// **'Log in >'**
  String get labelLoginButton;

  /// No description provided for @userErrFailedToCreateUser.
  ///
  /// In en, this message translates to:
  /// **'Failed to create user.'**
  String get userErrFailedToCreateUser;

  /// No description provided for @labelNewStudentPopupTitle.
  ///
  /// In en, this message translates to:
  /// **'Student\'s Temporary Password'**
  String get labelNewStudentPopupTitle;

  /// No description provided for @labelNewStudentPopupText.
  ///
  /// In en, this message translates to:
  /// **'Save the credentials below and send to your student. \nThe student will change the password after the first login.'**
  String get labelNewStudentPopupText;

  /// No description provided for @labelUserLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get labelUserLogin;

  /// No description provided for @cobjectFieldLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get cobjectFieldLabelName;

  /// No description provided for @cobjectFieldLabelDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get cobjectFieldLabelDescription;

  /// No description provided for @courseLabel.
  ///
  /// In en, this message translates to:
  /// **'Course'**
  String get courseLabel;

  /// No description provided for @coursesLabelPlural.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get coursesLabelPlural;

  /// No description provided for @courseErrFailedToOpenRelatedStudents.
  ///
  /// In en, this message translates to:
  /// **'Failed to open related students.'**
  String get courseErrFailedToOpenRelatedStudents;

  /// No description provided for @courseErrFailedToOpenRelatedLessons.
  ///
  /// In en, this message translates to:
  /// **'Failed to open related lessons.'**
  String get courseErrFailedToOpenRelatedLessons;

  /// No description provided for @lessonLabel.
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get lessonLabel;

  /// No description provided for @lessonsLabelPlural.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get lessonsLabelPlural;

  /// No description provided for @languageLabelLevel.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get languageLabelLevel;

  /// No description provided for @languageLabelGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get languageLabelGoal;

  /// No description provided for @languageErrLevelGreaterThanGoal.
  ///
  /// In en, this message translates to:
  /// **'Language level can\'t be greater than goal'**
  String get languageErrLevelGreaterThanGoal;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @profileFieldLabelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get profileFieldLabelName;

  /// No description provided for @profileFieldLabelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileFieldLabelEmail;

  /// No description provided for @profileFieldLabelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get profileFieldLabelPassword;

  /// No description provided for @profileFieldLabelPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get profileFieldLabelPhoto;

  /// No description provided for @profileErrEmailIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Wrong Email format'**
  String get profileErrEmailIsNotValid;

  /// No description provided for @profileErrFailedToLoadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Failed to load photo.'**
  String get profileErrFailedToLoadPhoto;

  /// No description provided for @studentLabel.
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get studentLabel;

  /// No description provided for @studentsLabelPlural.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get studentsLabelPlural;

  /// No description provided for @studentErrDeactivateUserFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to deactivate user. Please, try again.'**
  String get studentErrDeactivateUserFailed;

  /// No description provided for @teacherLabel.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacherLabel;

  /// No description provided for @errNoState.
  ///
  /// In en, this message translates to:
  /// **'Unable to define state'**
  String get errNoState;

  /// No description provided for @errFieldNotEntered.
  ///
  /// In en, this message translates to:
  /// **'is not entered!'**
  String get errFieldNotEntered;

  /// No description provided for @errNotLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'User is not logged in!'**
  String get errNotLoggedIn;

  /// No description provided for @errFailedToView.
  ///
  /// In en, this message translates to:
  /// **'Failed to view a'**
  String get errFailedToView;

  /// No description provided for @errFailedToAdd.
  ///
  /// In en, this message translates to:
  /// **'Failed to add'**
  String get errFailedToAdd;

  /// No description provided for @errFailedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get errFailedToLoad;

  /// No description provided for @errFailedToSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save'**
  String get errFailedToSave;

  /// No description provided for @errFailedToGetData.
  ///
  /// In en, this message translates to:
  /// **'Failed to get data.'**
  String get errFailedToGetData;

  /// No description provided for @errFailedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete'**
  String get errFailedToDelete;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
