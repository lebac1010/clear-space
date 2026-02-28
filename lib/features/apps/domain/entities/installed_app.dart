import 'dart:convert';
import 'package:flutter/foundation.dart';

/// Represents an installed application on the device.
/// Icon bytes are pre-decoded and cached to avoid Base64 decoding on every rebuild.
class InstalledApp {
  final String packageName;
  final String name;
  final String version;
  final int size;
  final int installDate;
  final Uint8List iconBytes;

  const InstalledApp({
    required this.packageName,
    required this.name,
    required this.version,
    required this.size,
    required this.installDate,
    required this.iconBytes,
  });

  /// Factory to create from native MethodChannel map.
  /// Base64 is decoded once here and cached as Uint8List.
  /// Defensively handles corrupted/empty icon data.
  factory InstalledApp.fromMap(Map<String, dynamic> map) {
    final iconBase64 = map['iconBase64'] as String? ?? '';

    // Guard against corrupted Base64 from native side
    Uint8List decoded;
    try {
      decoded = iconBase64.isNotEmpty ? base64Decode(iconBase64) : Uint8List(0);
    } catch (_) {
      decoded = Uint8List(0);
    }

    return InstalledApp(
      packageName: map['packageName'] as String? ?? '',
      name: map['name'] as String? ?? 'Unknown',
      version: map['version'] as String? ?? 'Unknown',
      // Kotlin `Long` maps to Dart `int` on 64-bit, but could arrive as `num`
      size: (map['size'] as num?)?.toInt() ?? 0,
      installDate: (map['installDate'] as num?)?.toInt() ?? 0,
      iconBytes: decoded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstalledApp && packageName == other.packageName;

  @override
  int get hashCode => packageName.hashCode;
}
