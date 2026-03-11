import 'dart:io';

void main() async {
  final oldPackage = 'com.lebac.storage_dashboard.clear_space';
  final newPackage = 'com.movixalabs.cleanmaster';
  
  // 1. Find and replace in text files
  final extensions = ['.kt', '.kts', '.xml', '.pro'];
  final dir = Directory('android');
  
  if (dir.existsSync()) {
    await for (final entity in dir.list(recursive: true)) {
      if (entity is File) {
        if (extensions.any((ext) => entity.path.endsWith(ext))) {
          String content = await entity.readAsString();
          bool changed = false;
          
          if (content.contains(oldPackage)) {
            content = content.replaceAll(oldPackage, newPackage);
            changed = true;
          }
          
          if (entity.path.endsWith('AndroidManifest.xml') && content.contains('android:label="Clear Space"')) {
            content = content.replaceAll('android:label="Clear Space"', 'android:label="Clean Master Space: Optimizer"');
            changed = true;
          }
          
          if (changed) {
            await entity.writeAsString(content);
            print('Updated: ${entity.path}');
          }
        }
      }
    }
  }

  // 2. Move directory
  final oldDirPath = 'android/app/src/main/kotlin/com/lebac/storage_dashboard/clear_space';
  final newDirPath = 'android/app/src/main/kotlin/com/movixalabs/cleanmaster';
  
  final oldDir = Directory(oldDirPath);
  if (oldDir.existsSync()) {
    final newDir = Directory(newDirPath);
    if (!newDir.existsSync()) {
      await newDir.create(recursive: true);
    }
    
    // Move all contents
    await for (final entity in oldDir.list()) {
      if (entity is File) {
        final newPath = entity.path.replaceFirst(oldDirPath, newDirPath);
        await entity.rename(newPath);
      } else if (entity is Directory) {
        final newPath = entity.path.replaceFirst(oldDirPath, newDirPath);
        await entity.rename(newPath);
      }
    }
    
    print('Moved Kotlin source files to new package directory.');
    
    // Clean up old directories if empty
    var currentDir = oldDir;
    while (currentDir.path != 'android/app/src/main/kotlin') {
      if (currentDir.listSync().isEmpty) {
        await currentDir.delete();
      }
      currentDir = currentDir.parent;
    }
  }
}
