/* A list of students created by the teacher
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/students_list_layout.dart';

@RoutePage()
class StudentsScreen extends StatelessWidget {
  const StudentsScreen({
    super.key,
    this.courseId,
  });
  final String? courseId;

  @override
  Widget build(BuildContext context) => StudentsListLayout(courseId: courseId);
}
