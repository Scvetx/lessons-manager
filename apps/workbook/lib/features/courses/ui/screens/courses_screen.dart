/* List of courses created by the teacher
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/courses_list_layout.dart';

@RoutePage()
class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) => const CoursesListLayout();
}
