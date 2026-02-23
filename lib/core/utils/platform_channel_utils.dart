/// Utility functions for safe Platform Channel data conversion.
///
/// Platform Channels (MethodChannel/EventChannel) return data as
/// `Map<Object?, Object?>` at runtime, not `Map<String, dynamic>`.
/// These utilities handle recursive conversion for nested structures.
library;

/// Recursively converts a Platform Channel response to Dart-friendly types.
///
/// - [Map] values are converted to `Map<String, dynamic>` with all nested
///   values also converted.
/// - [List] values have each element recursively converted.
/// - Primitive values (int, double, String, bool, null) pass through unchanged.
///
/// Example:
/// ```dart
/// final result = await methodChannel.invokeMethod('getData');
/// final safeMap = deepConvertPlatformData(result) as Map<String, dynamic>;
/// ```
dynamic deepConvertPlatformData(dynamic value) {
  if (value == null) return null;

  if (value is Map) {
    return <String, dynamic>{
      for (final entry in value.entries)
        entry.key.toString(): deepConvertPlatformData(entry.value),
    };
  }

  if (value is List) {
    return value.map(deepConvertPlatformData).toList();
  }

  // Primitives: int, double, String, bool
  return value;
}

/// Type-safe wrapper that converts and casts to `Map<String, dynamic>`.
///
/// Throws [TypeError] if the result is not a Map.
Map<String, dynamic> convertToJsonMap(dynamic platformData) {
  final converted = deepConvertPlatformData(platformData);
  if (converted is! Map<String, dynamic>) {
    // [A11] Descriptive error instead of raw TypeError
    throw FormatException(
      'Expected Map<String, dynamic> from platform channel, got ${converted.runtimeType}: $converted',
    );
  }
  return converted;
}
