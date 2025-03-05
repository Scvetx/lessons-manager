

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/database/dbobject.dart';
import '../../models/database/scheme/dbobject_scheme.dart';
import 'query_filter.dart';

/// Helpful dart code to work with Firebase Firestore collections 
/// (database custom objects)
class FirebaseCollection {
  FirebaseCollection({required this.collectionName}) {
    db = FirebaseFirestore.instance;
    collection = db.collection(collectionName);
  }
  
  final String collectionName;
  late FirebaseFirestore db;
  late CollectionReference<Map<String, dynamic>> collection;

// ----- DML -----
  /// create 1 record
  Future<String> createRecord(Map<String, dynamic> fieldsMap) async {
    final result = await collection.add(fieldsMap);
    return result.id;
  }

  /// update 1 record
  Future<void> updateRecord(String id, Map<String, dynamic> data) async {
    data.remove(DBObjectScheme.fIdKey);
    await collection.doc(id).update(data);
  }

  /// delete 1 record
  Future<void> deleteRecord(String id) =>
      collection.doc(id).delete();

// ----- BULK DML -----
  /// bulk create
  Future<void> createRecords(List<DBObject> dbObjects) async {
    if (dbObjects.isEmpty) return;
    final batch = db.batch();
    for (final dbObj in dbObjects) {
      final docRef = collection.doc();
      batch.set(docRef, dbObj.toMap());
    }
    await batch.commit();
  }

  /// bulk update
  Future<void> updateRecords(List<DBObject> dbObjects) async {
    if (dbObjects.isEmpty) return;
    final batch = db.batch();
    for (final dbObj in dbObjects) {
      final docRef = collection.doc(dbObj.id);
      batch.update(docRef, dbObj.toMap());
    }
    await batch.commit();
  }

  /// bulk delete by records ids
  Future<void> deleteRecordsByIds(Set<String> ids) async {
    if (ids.isEmpty) return;
    final batch = db.batch();
    for (final id in ids) {
      final docRef = collection.doc(id);
      batch.delete(docRef);
    }
    await batch.commit();
  }

// ----- QUERY RECORDS -----
  /// query record by its id
  Future<DocumentSnapshot<Object?>> queryRecordById(String id) async {
    final docRef = collection.doc(id);
    return docRef.get();
  }

  /// query records by filters
  Future<List<QueryDocumentSnapshot<Object?>>> queryRecords(
    List<QueryFilter> filters,
  ) async {
    final query = _addFilters(filters);
    final querySnapshot = await query.get();
    return querySnapshot.docs;
  }

  /// stream records by filters
  Stream<QuerySnapshot<Object?>> streamRecords(List<QueryFilter> filters) {
    final query = _addFilters(filters);
    return query.snapshots();
  }

  /// add filters to a query
  Query<Map<String, dynamic>> _addFilters(List<QueryFilter> filters) {
    dynamic query = collection;
    if (filters.isNotEmpty) {
      for (final filter in filters) {
        if (filter is BoolQueryFilter) {
          if (filter.operator == BoolQueryOperator.equal) {
            query = query.where(filter.field, isEqualTo: filter.value);
          } else if (filter.operator == BoolQueryOperator.notEqual) {
            query = query.where(filter.field, isNotEqualTo: filter.value);
          }
        } else if (filter is StringQueryFilter) {
          if (filter.operator == StringQueryOperator.equal) {
            query = query.where(filter.field, isEqualTo: filter.value);
          } else if (filter.operator == StringQueryOperator.notEqual) {
            query = query.where(filter.field, isNotEqualTo: filter.value);
          }
        } else if (filter is ListStringQueryFilter) {
          if (filter.operator == ListStringQueryOperator.whereIn) {
            query = query.where(filter.field, whereIn: filter.value);
          } else if (filter.operator == ListStringQueryOperator.whereNotIn) {
            query = query.where(filter.field, whereNotIn: filter.value);
          }
        }
      }
    }
    return query;
  }

// ----- FILTER RECORDS -----
  /// filters DBObject list by ids
  List<DBObject> filterDBObjectsByIds(
    List<DBObject> dbObjectsToFilter, 
    Set<String> ids,
  ) {
    if (ids.isEmpty) return [];
    return dbObjectsToFilter.where(
      (dbObject) => ids.contains(dbObject.id),
    ).toList();
  }
}
