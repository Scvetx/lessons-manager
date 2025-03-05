/* Custom Widget - a list of courses component
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/app_styles/object_view_style.dart';
import '../../domain/riverpod/courses_provider.dart';

class ParentCourseInfo extends ConsumerWidget {
  const ParentCourseInfo({
    super.key,
    required this.courseId,
  });
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(coursesNotifierProvider).value;
    if(state == null) return const SizedBox.shrink();

    final course = state.recordsMap[courseId];
    if(course == null) return const SizedBox.shrink();

    return Text(course.formData.name.value,
      style: ovCoursesNamesStyle,
    );
  }
}
