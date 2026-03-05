import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/providers/storage_provider.dart';
import '../../features/cleanup/domain/entities/cleanup_history_record.dart';

final cleanupHistoryServiceProvider = Provider<CleanupHistoryService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return CleanupHistoryService(prefs);
});

final cleanupHistoryProvider = FutureProvider<List<CleanupHistoryRecord>>((
  ref,
) async {
  final service = ref.watch(cleanupHistoryServiceProvider);
  return service.getHistory();
});

class CleanupHistoryService {
  static const String _keyHistory = 'cleanup_history_logs';
  final SharedPreferences _prefs;

  CleanupHistoryService(this._prefs);

  Future<void> addRecord(CleanupHistoryRecord record) async {
    final history = await getHistory();
    history.insert(0, record); // Newest first

    // Keep last 50 records to prevent SharedPreferences bloat
    if (history.length > 50) {
      history.removeRange(50, history.length);
    }

    final jsonList = history.map((e) => jsonEncode(e.toJson())).toList();
    await _prefs.setStringList(_keyHistory, jsonList);
  }

  Future<List<CleanupHistoryRecord>> getHistory() async {
    final jsonList = _prefs.getStringList(_keyHistory);
    if (jsonList == null) return [];

    return jsonList
        .map((e) {
          try {
            return CleanupHistoryRecord.fromJson(jsonDecode(e));
          } catch (_) {
            return null;
          }
        })
        .whereType<CleanupHistoryRecord>()
        .toList();
  }

  Future<void> clearHistory() async {
    await _prefs.remove(_keyHistory);
  }
}
