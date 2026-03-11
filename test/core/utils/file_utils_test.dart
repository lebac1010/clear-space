import 'package:flutter_test/flutter_test.dart';
import 'package:clear_space/core/utils/file_utils.dart';

void main() {
  group('FileUtils', () {
    test('formatSize formats bytes correctly', () {
      expect(FileUtils.formatSize(0), '0 B');
      expect(FileUtils.formatSize(100), '100 B');
      expect(FileUtils.formatSize(1023), '1023 B');
    });

    test('formatSize formats KB correctly', () {
      expect(FileUtils.formatSize(1024), '1.0 KB');
      expect(FileUtils.formatSize(1536), '1.5 KB');
    });

    test('formatSize formats MB correctly', () {
      expect(FileUtils.formatSize(1024 * 1024), '1.0 MB');
      expect(
        FileUtils.formatSize((1024 * 1024 * 1.5).toInt()),
        '1.5 MB',
      ); // Cast for calculation
    });

    test('formatSize formats GB correctly', () {
      expect(FileUtils.formatSize(1024 * 1024 * 1024), '1.0 GB');
    });

    test('formatSize handles large numbers', () {
      expect(
        FileUtils.formatSize(1024 * 1024 * 1024 * 10),
        '10.0 GB',
      ); // 10GB is still int range
    });
  });
}
