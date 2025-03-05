/* A page where a teacher can view content of the lesson
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/lesson_view_layout.dart';

@RoutePage()
class LessonViewScreen extends StatelessWidget {
  const LessonViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const LessonViewLayout();
}
