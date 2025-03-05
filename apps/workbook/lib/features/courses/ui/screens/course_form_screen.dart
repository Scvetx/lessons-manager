/* A form where a teacher can create/edit a course
*/

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/course_form_layout.dart';

@RoutePage()
class CourseFormScreen extends StatelessWidget {
  const CourseFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const CourseFormLayout();
}
