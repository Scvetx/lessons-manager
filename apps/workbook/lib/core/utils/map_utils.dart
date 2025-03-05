/// Utils for Map data type.
abstract class MapUtils {
  /// Filters a map by keys and returns a map.
  /// If a key does not exist in the map, it is ignored.
  ///
  /// [keys] - A list of IDs to filter by.
  /// [map] - A map of dynamic where the key is String.
  static List<dynamic> filterMapToList(
    Map<String, dynamic> map,
    List<String> keys,
  ) {
    final List<dynamic> result = [];
    if(keys.isEmpty) return result;
    for (final id in keys) {
      final value = map[id];
      if (value != null) {
        result.add(value);
      }
    }
    return result;
  }

  /// Filters a map by keys and returns a list.
  /// If a key does not exist in the map, it is ignored.
  ///
  /// [keys] - A list of IDs to filter by.
  /// [map] - A map of dynamic where the key is String.
  static List<dynamic> filterMap(
    Map<String, dynamic> map,
    List<String> keys, 
  ) {
    final List<dynamic> result = [];
    if(keys.isEmpty) return result;
    for (final id in keys) {
      final value = map[id];
      if (value != null) {
        result.add(value);
      }
    }
    return result;
  }

  /// Filters a map by filter.
  /// Returns a list of values for which filter returned true.
  /// If a key does not exist in the map, it is ignored.
  ///
  /// [keys] - A list of IDs to filter by.
  /// [map] - A map of dynamic where the key is String.
  static List<dynamic> filterMapByValue(
    Map<String, dynamic> map,
    bool Function(dynamic) filter,
  ) {
    final List<dynamic> result = [];
    for (final value in map.values) {
      if(filter(value)) {
        result.add(value);
      }
    }
    return result;
  }
}