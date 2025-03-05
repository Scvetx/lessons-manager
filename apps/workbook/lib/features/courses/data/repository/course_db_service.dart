/* functions dml/query courses
*/

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/database/firebase_collection.dart';
import '../../../../core/firebase/database/query_filter.dart';
import '../../../../core/models/database/scheme/dbobject_scheme.dart';
import '../../domain/models/course.dart';
import '../models/course_db_data.dart';

@lazySingleton
class CourseDbService extends FirebaseCollection {
  CourseDbService() : super(collectionName: 'courses');

// -- QUERY RECORDS --
  // stream lessons by filters
  Stream<Map<String, Course>> streamCourses(List<QueryFilter> filters) =>
    streamRecords(filters)
    .map((snapshot) {
      final Map<String, Course> records = {};
      for (final doc in snapshot.docs) {
        final docData = doc.data();
        if (docData == null) continue;
        final jsonData = docData as Map<String, dynamic>;
        jsonData[DBObjectScheme.fIdKey] = doc.id;
        
        final dbData = CourseDbData.fromJson(jsonData);
        final rec = Course.fromDbObject(dbData: dbData);
        
        records[rec.id!] = rec;
      }
      return records;
    });
}
