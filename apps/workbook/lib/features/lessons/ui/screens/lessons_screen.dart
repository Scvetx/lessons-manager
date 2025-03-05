/* List of lessons created by the teacher
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/lessons_list_layout.dart';

@RoutePage()
class LessonsScreen extends StatelessWidget {
  const LessonsScreen({
    super.key,
    this.courseId,
  });
  final String? courseId;

  @override
  Widget build(BuildContext context) => LessonsListLayout(courseId: courseId);
}
