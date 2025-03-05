/* Custom Widget - a list of courses presented as text in one row
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/ui/app_styles/object_view_style.dart';
import '../../domain/riverpod/courses_provider.dart';

class CoursesNamesRowCmp extends ConsumerWidget {
  const CoursesNamesRowCmp({
    super.key, 
    required this.coursesIds,
  });
  final List<String> coursesIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(coursesNotifierProvider).value;
    // empty screen if user is logged out
    if(state == null) return const SizedBox.shrink();
    
    // courses data if logged in
    final filteredCourses = state.filterMapByIds(state.recordsMap, coursesIds);
    // empty screen if no courses matched [coursesIds]
    // * (this case can happen if these courses were deleted)
    if(filteredCourses.isEmpty) return const SizedBox.shrink();

    return Wrap(
      runSpacing: 14, 
      children: [
        for(final course in filteredCourses)
          Text(
            // ignore: lines_longer_than_80_chars
            '${course.formData.name.value}${course.id == filteredCourses.last.id ? '' : ',   '}',
            style: ovCoursesNamesStyle,
          ),
      ],
    );
  }
}
