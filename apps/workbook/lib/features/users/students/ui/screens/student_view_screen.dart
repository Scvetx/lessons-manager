/* A page where a teacher can view info about the student
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/models/student.dart';
import '../layout/student_view_layout.dart';

@RoutePage()
class StudentViewScreen extends StatelessWidget {
  const StudentViewScreen({
    super.key,
    required this.student,
  });
  final Student student;

  @override
  Widget build(BuildContext context) => const StudentViewLayout();
}
