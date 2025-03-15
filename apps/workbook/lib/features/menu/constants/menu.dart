import 'package:flutter/material.dart';

import '../../../core/navigation/routes/app_router.dart';
import '../../../l10n/app_localizations.dart';

List<PopupMenuItem> teacherMenu (AppLocalizations l10n) => [
  // test 
  PopupMenuItem<String>(
    value: ProfileViewRoute.name,
    child: Text('${l10n.labelMy} ${l10n.profileLabel}'),
  ),
  PopupMenuItem<String>(
    value: LessonsRoute.name,
    child: Text(l10n.lessonsLabelPlural),
  ),
  PopupMenuItem<String>(
    value: CoursesRoute.name,
    child: Text(l10n.coursesLabelPlural),
  ),
  PopupMenuItem<String>(
    value: StudentsRoute.name,
    child: Text(l10n.studentsLabelPlural),
  ),
];

List<PopupMenuItem> studentMenu (AppLocalizations l10n) => [
  PopupMenuItem<String>(
    value: ProfileViewRoute.name,
    child: Text('${l10n.labelMy} ${l10n.profileLabel}'),
  ),
  PopupMenuItem<String>(
    value: CoursesRoute.name,
    child: Text(l10n.coursesLabelPlural),
  ),
];
