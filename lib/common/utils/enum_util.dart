import 'package:collection/collection.dart';

final class EnumUtil {
  static K? decode<K extends Enum, V>(Map<K, V> enumValues, Object? source, {Enum? unknownValue}) {
    if (source == null) {
      return null;
    }

    return enumValues.entries.firstWhereOrNull((entry) => entry.value == source)?.key;
  }

  static T? parse<T extends Enum>(List<T> enumValues, String? source) {
    if (source == null) {
      return null;
    }

    return enumValues.firstWhereOrNull((element) => source == element.name);
  }
}
