/* functions dml/query students
*/

import 'package:injectable/injectable.dart';

import '../../../../../core/firebase/database/firebase_collection.dart';
import '../../../../../core/firebase/database/query_filter.dart';
import '../../../../../core/models/database/scheme/dbobject_scheme.dart';
import '../../domain/models/student.dart';
import '../models/student_db_data.dart';

@lazySingleton
class StudentDbService extends FirebaseCollection {
  StudentDbService() : super(collectionName: 'students');

// - QUERY RECORDS -
  // query students by filters
  Future<List<Student>> queryStudents(List<QueryFilter> filters) async {
    final List<Student> records = [];
    final docs = await queryRecords(filters);
    for (final doc in docs) {
      final docData = doc.data();
      if (docData == null) continue;
      final jsonData = docData as Map<String, dynamic>;
      jsonData[DBObjectScheme.fIdKey] = doc.id;

      final dbData = StudentDbData.fromJson(jsonData);
      final rec = Student.fromDbObject(dbData: dbData);

      records.add(rec);
    }
    return records;
  }

  // stream students by filters
  Stream<Map<String, Student>> streamStudents(List<QueryFilter> filters) =>
    streamRecords(filters)
    .map((snapshot) {
      final Map<String, Student> records = {};
      for (final doc in snapshot.docs) {
        final docData = doc.data();
        if (docData == null) continue;
        final jsonData = docData as Map<String, dynamic>;
        jsonData[DBObjectScheme.fIdKey] = doc.id;

        final dbData = StudentDbData.fromJson(jsonData);
        final rec = Student.fromDbObject(dbData: dbData);
        
        records[rec.id!] = rec;
      }
      return records;
    });
}
