// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get labelSave => 'Сохранить';

  @override
  String get labelEdit => 'Редактировать';

  @override
  String get labelAdd => 'Добавить';

  @override
  String get labelChange => 'Изменить';

  @override
  String get labelDelete => 'Удалить';

  @override
  String get labelDeactivate => 'Деактивировать';

  @override
  String get labelNew => 'Новый';

  @override
  String get labelCard => 'Карточка';

  @override
  String get labelMy => 'Мой';

  @override
  String get labelRelated => 'Связанный';

  @override
  String get labelContinue => 'Продолжить';

  @override
  String get labelCancel => 'Отмена';

  @override
  String get labelPleaseTryAgain => 'Пожалуйста, попробуйте снова.';

  @override
  String get labelLogIn => 'Войти';

  @override
  String get labelLogOut => 'Выйти';

  @override
  String get labelRegistration => 'Новая учетная запись учителя';

  @override
  String get labelCreateAccount => 'Создать учетную запись';

  @override
  String get labelInputNameHintText => 'Введите ваше имя';

  @override
  String get labelInputEmailHintText => 'Введите ваш email';

  @override
  String get labelInputPasswordHintText => 'Введите ваш пароль';

  @override
  String get labelInputNewPasswordHintText => 'Введите новый пароль';

  @override
  String get labelInputOldPasswordHintText => 'Введите старый пароль';

  @override
  String get labelEnterNewPassword => 'Введите ваш новый пароль ниже:';

  @override
  String get labelNewPasswordDescription => 'При первом входе измените временный пароль, предоставленный вашим учителем:';

  @override
  String get labelRegisterButton => 'Зарегистрироваться как учитель >';

  @override
  String get labelLoginButton => 'Войти >';

  @override
  String get userErrFailedToCreateUser => 'Не удалось создать пользователя.';

  @override
  String get labelNewStudentPopupTitle => 'Временный пароль студента';

  @override
  String get labelNewStudentPopupText => 'Сохраните указанные ниже учетные данные и отправьте их вашему студенту. \nСтудент изменит пароль после первого входа.';

  @override
  String get labelUserLogin => 'Логин';

  @override
  String get cobjectFieldLabelName => 'Название';

  @override
  String get cobjectFieldLabelDescription => 'Описание';

  @override
  String get courseLabel => 'Курс';

  @override
  String get coursesLabelPlural => 'Курсы';

  @override
  String get courseErrFailedToOpenRelatedStudents => 'Не удалось открыть список студентов.';

  @override
  String get courseErrFailedToOpenRelatedLessons => 'Не удалось открыть список уроков.';

  @override
  String get lessonLabel => 'Урок';

  @override
  String get lessonsLabelPlural => 'Уроки';

  @override
  String get languageLabelLevel => 'Уровень';

  @override
  String get languageLabelGoal => 'Цель';

  @override
  String get languageErrLevelGreaterThanGoal => 'Текущий уровень знания языка не может быть выше, чем целевой уровень.';

  @override
  String get profileLabel => 'Профиль';

  @override
  String get profileFieldLabelName => 'Имя';

  @override
  String get profileFieldLabelEmail => 'Email';

  @override
  String get profileFieldLabelPassword => 'Пароль';

  @override
  String get profileFieldLabelPhoto => 'Фото';

  @override
  String get profileErrEmailIsNotValid => 'Неверный формат Email';

  @override
  String get profileErrFailedToLoadPhoto => 'Не удалось загрузить фото.';

  @override
  String get studentLabel => 'Студент';

  @override
  String get studentsLabelPlural => 'Студенты';

  @override
  String get studentErrDeactivateUserFailed => 'Не удалось деактивировать пользователя. Пожалуйста, попробуйте еще раз.';

  @override
  String get teacherLabel => 'Преподаватель';

  @override
  String get errNoState => 'Не удалось определить состояние';

  @override
  String get errFieldNotEntered => 'не введено!';

  @override
  String get errNotLoggedIn => 'Пользователь не вошел в систему!';

  @override
  String get errFailedToView => 'Не удалось открыть';

  @override
  String get errFailedToAdd => 'Не удалось добавить';

  @override
  String get errFailedToLoad => 'Не удалось загрузить';

  @override
  String get errFailedToSave => 'Не удалось сохранить';

  @override
  String get errFailedToGetData => 'Не удалось получить данные.';

  @override
  String get errFailedToDelete => 'Не удалось удалить';
}
