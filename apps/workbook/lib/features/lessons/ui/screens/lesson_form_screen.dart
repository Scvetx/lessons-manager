/* A form where a teacher can create/edit a lesson
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/lesson_form_layout.dart';

@RoutePage()
class LessonFormScreen extends StatelessWidget {
  const LessonFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const LessonFormLayout();
}
