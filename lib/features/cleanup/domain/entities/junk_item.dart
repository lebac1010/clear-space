/// Represents a single junk item (file or folder) found during scan.
class JunkItem {
  final String path;
  final String name;
  final int size;

  const JunkItem({required this.path, required this.name, required this.size});

  factory JunkItem.fromMap(Map<String, dynamic> map) {
    return JunkItem(
      path: map['path'] as String? ?? '',
      name: map['name'] as String? ?? 'Unknown',
      size: (map['size'] as num?)?.toInt() ?? 0,
    );
  }
}
