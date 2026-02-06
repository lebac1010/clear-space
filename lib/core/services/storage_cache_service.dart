import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/domain/entities/storage_info.dart';

class StorageCacheService {
  static const String _keyStorageInfo = 'cached_storage_info';

  final SharedPreferences _prefs;

  StorageCacheService(this._prefs);

  Future<void> cacheStorageInfo(StorageInfo info) async {
    final jsonStr = jsonEncode(info.toJson());
    await _prefs.setString(_keyStorageInfo, jsonStr);
  }

  StorageInfo? getCachedStorageInfo() {
    final jsonStr = _prefs.getString(_keyStorageInfo);
    if (jsonStr == null) return null;

    try {
      final jsonMap = jsonDecode(jsonStr);
      return StorageInfo.fromJson(jsonMap);
    } catch (e) {
      return null;
    }
  }

  Future<void> clearCache() async {
    await _prefs.remove(_keyStorageInfo);
  }
}
