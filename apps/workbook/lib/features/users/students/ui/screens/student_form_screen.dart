/* A form where a teacher can create/edit student's card
 */

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/models/student.dart';
import '../layout/student_form_layout.dart';

@RoutePage()
class StudentFormScreen extends StatelessWidget {
  const StudentFormScreen({
    super.key,
    this.student,
  });
  final Student? student;

  @override
  Widget build(BuildContext context) => const StudentFormLayout();
}
