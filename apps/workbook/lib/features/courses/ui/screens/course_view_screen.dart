/* A page where a teacher can view content of the course
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../layout/course_view_layout.dart';

@RoutePage()
class CourseViewScreen extends StatelessWidget {
  const CourseViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>  const CourseViewLayout();
}
