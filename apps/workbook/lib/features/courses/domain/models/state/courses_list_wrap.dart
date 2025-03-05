import '../../../../../core/models/domain/state/cobject_list_wrap.dart';
import '../../../../../core/utils/map_utils.dart';
import '../course.dart';

/// wrapper for all courses list and map
class CoursesListWrap extends CObjectsListWrap {
  CoursesListWrap({
    required this.recordsMap,
  }) :
    records = recordsMap.values.toList();

  /// map course.id => course
  @override
  final Map<String, Course> recordsMap;
  /// map of all courses
  @override
  final List<Course> records;


  // filter courses map by courses ids
  List<Course> filterMapByIds(
    Map<String, Course> coursesMap,
    List<String> filterIds, 
  ) => 
    MapUtils.filterMapToList(coursesMap, filterIds).cast();
}
