import '../cobject.dart';

/// wrapper for all students list and map
abstract class CObjectsListWrap {
  Map<String, CObject> get recordsMap;
  List<CObject> get records;
}
