/* functions dml/query teachers
*/

import 'package:injectable/injectable.dart';

import '../../../../../core/firebase/database/firebase_collection.dart';
import '../../../../../core/firebase/database/query_filter.dart';
import '../../../../../core/models/database/scheme/dbobject_scheme.dart';
import '../../domain/models/teacher.dart';
import '../models/teacher_db_data.dart';

@lazySingleton
class TeacherDbService extends FirebaseCollection {
  TeacherDbService() : super(collectionName: 'teachers');

// - QUERY RECORDS -
  // query teachers by filters
  Stream<Map<String, Teacher>> streamTeachers(List<QueryFilter> filters) =>
    streamRecords(filters)
    .map((snapshot) {
      final Map<String, Teacher> records = {};
      for (final doc in snapshot.docs) {
        final docData = doc.data();
        if (docData == null) continue;
        final jsonData = docData as Map<String, dynamic>;
        jsonData[DBObjectScheme.fIdKey] = doc.id;

        final dbData = TeacherDbData.fromJson(jsonData);
        final rec = Teacher.fromDbObject(dbData: dbData);

        records[rec.id!] = rec;
      }
      return records;
    });
}
