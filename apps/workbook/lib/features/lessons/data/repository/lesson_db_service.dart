/* functions dml/query lessons
*/

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/database/firebase_collection.dart';
import '../../../../core/firebase/database/query_filter.dart';
import '../../../../core/models/database/scheme/dbobject_scheme.dart';
import '../../domain/models/lesson.dart';
import '../models/lesson_db_data.dart';

@lazySingleton
class LessonDbService extends FirebaseCollection {
  LessonDbService() : super(collectionName: 'lessons');

// - QUERY RECORDS -
  // stream lessons by filters
  Stream<Map<String, Lesson>> streamLessons(List<QueryFilter> filters) =>
    streamRecords(filters)
    .map((snapshot) {
      final Map<String, Lesson> records = {};
      for (final doc in snapshot.docs) {
        final docData = doc.data();
        if (docData == null) continue;
        final jsonData = docData as Map<String, dynamic>;
        jsonData[DBObjectScheme.fIdKey] = doc.id;

        final dbData = LessonDbData.fromJson(jsonData);
        final rec = Lesson.fromDbObject(dbData: dbData);
        
        records[rec.id!] = rec;
      }
      return records;
    });
}
